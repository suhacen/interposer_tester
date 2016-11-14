//**************************************************************************************
//             Proprietary Information of General Electric Company
//             Copyright (c) 2016, General Electric Company
//**************************************************************************************
//
// Project     : Test Software
// Module      : Controller Application
//
// Filename    : iic_temp_sensor.c
//
// Description : Temperature sensor read functions.
//
// Revision History:
//
// DATE      AUTHOR     COMMENTS
// 10SEP2016 NeerajS	Initial Draft.
// ------------------------------------------------------------------------

/**************************** Include Files ********************************/

#include "xparameters.h"
#include "xiic.h"
#include "xil_exception.h"
#include "string.h"

#ifdef XPAR_INTC_0_DEVICE_ID
#include "xintc.h"
#else
#include "xscugic.h"
#endif


#define DEV_ID 	0x21
#define MANUFACTURER_ID 0x55

/************************* Constant Definitions ****************************


 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define IIC_DEVICE_ID	XPAR_AXI_IIC_0_DEVICE_ID



#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC_DEVICE_ID	XPAR_INTC_0_DEVICE_ID
#define IIC_INTR_ID	XPAR_INTC_0_IIC_0_VEC_ID
#define INTC			XIntc
#define INTC_HANDLER	XIntc_InterruptHandler
#else
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define IIC_INTR_ID		XPAR_FABRIC_IIC_0_VEC_ID
#define INTC			 	XScuGic
#define INTC_HANDLER		XScuGic_InterruptHandler
#endif



#define SENSOR_ADDRESS 						0x4c
#define SENSOR_RW_DATA_SZ					25
#define SENSOR_TEST_START_ADDRESS			0



/* Register related to Sensor*/


#define TMP421_TEMP_MSB_REG					0x00   //4 reg including this
#define TMP421_TEMP_LSB_REG					0x10   //4 reg including this
#define TMP421_STATUS_REG					0x08
#define TMP421_CONFIG_REG_1                 0x09
#define TMP421_CONVERSION_RATE_REG          0x0B
#define TMP421_MANUFACTURER_ID_REG          0xFE
#define TMP421_DEVICE_ID_REG                0xFF


/* Basic Tests:
 * Communication with Temp Sensor:
 * 1. Read Manufacturing ID and Device ID
 * 2. Read Temp MSB Reg.
 * 3. Read Temp LSB Reg.
 */

/**************** Macros (Inline Functions) Definitions ********************

 ************************* Function Prototypes *****************************/

int IicSensorExample();

int SensorReadData(u8 *BufferPtr, u16 ByteCount, u16 ReadAdd);

static int SetupInterruptSystemSensor(XIic *IicInstPtr);

static void SendHandlerSensor(XIic *InstancePtr);

static void ReceiveHandlerSensor(XIic *InstancePtr);

static void StatusHandlerSensor(XIic *InstancePtr, int Event);

/************************* Variable Definitions ****************************/

XIic IicInstanceSensor;	 //The instance of the IIC device.
INTC IntcSensor; 	 //The instance of the Interrupt Controller Driver


u8 WriteBufferSensor[SENSOR_RW_DATA_SZ];
u8 ReadBufferSensor[SENSOR_RW_DATA_SZ];

volatile u8 TransmitCompleteSensor;	 //Flag to check completion of Transmission
volatile u8 ReceiveCompleteSensor;	 //Flag to check completion of Reception

u8 SensorIicAddr;		 //Variable for storing Eeprom IIC address

/************************* Function Definitions ****************************/


int temp_sensor_test(void)
{
	int Status;

	xil_printf("*** TMP421DCN Sensor Test:\r\n");

	Status = IicSensorExample();
//	print_result(Status);
//	if (Status == XST_SUCCESS)
//	{
//		xil_printf("\nSensor Test: \033[32mPASSED\033[0m \r\n");
//	}
//	else
//	{
//		xil_printf("\nSensor Test: \033[5mFAILED\033[0m \r\n");
//	}
//
//	print("*** IIC TMP421 Sensor Test Exit ***\n\r");

	return Status;
}

/***************************************************************************
 *
 * This function writes, reads, and verifies the data to the IIC EEPROM. It
 * does the write as a single page write, performs a buffered read.
 *
 * @param	None.
 *
 * @return	XST_SUCCESS if successful else XST_FAILURE.
 *
 * @note		None.
 *
 *****************************************************************************/
int IicSensorExample()
{
	int Status;
	u8 lsb_byte, msb_byte , temp;
	double dec_data;
	u8 print_buf[50] = "";
	XIic_Config *ConfigPtr;	 //Pointer to configuration data
	SensorIicAddr = SENSOR_ADDRESS;


	/* Initialize the IIC driver so that it is ready to use.*/

	ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&IicInstanceSensor, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Setup the Interrupt System.*/

	Status = SetupInterruptSystemSensor(&IicInstanceSensor);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Set the Handlers for transmit and reception.*/

	XIic_SetSendHandler(&IicInstanceSensor, &IicInstanceSensor,
			(XIic_Handler) SendHandlerSensor);
	XIic_SetRecvHandler(&IicInstanceSensor, &IicInstanceSensor,
			(XIic_Handler) ReceiveHandlerSensor);
	XIic_SetStatusHandler(&IicInstanceSensor, &IicInstanceSensor,
			(XIic_StatusHandler) StatusHandlerSensor);



	/* Set the Slave address.*/

	Status = XIic_SetAddress(&IicInstanceSensor, XII_ADDR_TO_SEND_TYPE,
			SensorIicAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Initialize the data to write and the read buffer.*/

	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);

//	xil_printf("\r\nReading Temp Sensor Manufacturing ID:\r\n");
	Status = SensorReadData(ReadBufferSensor, 1, TMP421_MANUFACTURER_ID_REG);
	if (Status != XST_SUCCESS)
	{
		print_result(XST_FAILURE);
		return XST_FAILURE;
	}

	xil_printf("Manufacturing ID is 0x%02x", ReadBufferSensor[0]);
	if (ReadBufferSensor[0] != MANUFACTURER_ID)
	{
		print_result(XST_FAILURE);
	}
	else
	{
		print_result(XST_SUCCESS);
	}

	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);
//	xil_printf("\nReading Temp Sensor TMP421 Device ID:\n");
	Status = SensorReadData(ReadBufferSensor, 1, TMP421_DEVICE_ID_REG);
	if (Status != XST_SUCCESS)
	{
		print_result(XST_FAILURE);
		return XST_FAILURE;
	}

	xil_printf("Device ID is 0x%02x       ", ReadBufferSensor[0]);
	if (ReadBufferSensor[0] != DEV_ID)
	{
		print_result(XST_FAILURE);
		return XST_FAILURE;
	}
	else
	{
		print_result(XST_SUCCESS);
	}
//	xil_printf("Manufacturing ID and Device ID Read Successfully.");


	/* Readng MSB Temperature bytes.*/


	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);
	SensorReadData(ReadBufferSensor,1,TMP421_TEMP_MSB_REG);
	msb_byte = ReadBufferSensor[0];
	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);
	SensorReadData(ReadBufferSensor,1,TMP421_TEMP_LSB_REG);
	lsb_byte = ReadBufferSensor[0];
	temp = (msb_byte & 0x0f) + (msb_byte >> 4)*16;
	msb_byte = temp;
	lsb_byte = lsb_byte >> 4;
	dec_data = ((((lsb_byte & 0x08) >> 3) * 0.5) + (((lsb_byte & 0x04) >> 2) * 0.25) + (((lsb_byte & 0x02) >> 1) * 0.125) + (((lsb_byte & 0x01)) * 0.0625)); // + ((lsb_byte && 0x02) * 0.125) + ((lsb_byte && 0x01) * 0.0625)
	sprintf(print_buf,"%.4f",(msb_byte + dec_data));
	xil_printf("Local Temperature is %sC   [\033[33mVisual Inspection\033[0m]\r\n", print_buf);

	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);
	SensorReadData(ReadBufferSensor,1,TMP421_TEMP_MSB_REG + 1);
	msb_byte = ReadBufferSensor[0];

	memset(WriteBufferSensor, 25, 0x0);
	memset(ReadBufferSensor, 25, 0x0);
	SensorReadData(ReadBufferSensor,1,TMP421_TEMP_LSB_REG + 1);
	lsb_byte = ReadBufferSensor[0];
	temp = (msb_byte & 0x0f) + (msb_byte >> 4)*16;
	msb_byte = temp;
	lsb_byte = lsb_byte >> 4;
	dec_data = ((((lsb_byte & 0x08) >> 3) * 0.5) + (((lsb_byte & 0x04) >> 2) * 0.25) + (((lsb_byte & 0x02) >> 1) * 0.125) + (((lsb_byte & 0x01)) * 0.0625)); // + ((lsb_byte && 0x02) * 0.125) + ((lsb_byte && 0x01) * 0.0625)
	sprintf(print_buf,"%.4f",(msb_byte + dec_data));
	xil_printf("Remote Temperature is %sC  [\033[33mVisual Inspection\033[0m]\r\n", print_buf);

	return Status;
}


/***************************************************************************
*
* This function writes a buffer of data to the IIC serial EEPROM.
*
* @param	ByteCount contains the number of bytes in the buffer to be
*		written.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
		*
		* @note		The Byte count should not exceed the page size of the EEPROM as
		*		noted by the constant PAGE_SIZE.
		*
*****************************************************************************/
int SensorWriteData(u16 ByteCount)
{
	int Status;


	/* Set the defaults.*/

	TransmitCompleteSensor = 1;
	IicInstanceSensor.Stats.TxErrors = 0;


	/* Start the IIC device.*/

	Status = XIic_Start(&IicInstanceSensor);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Send the Data.*/

	Status = XIic_MasterSend(&IicInstanceSensor, WriteBufferSensor, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Wait till the transmission is completed.*/

	while ((TransmitCompleteSensor) || (XIic_IsIicBusy(&IicInstanceSensor) == TRUE)) {

		/* This condition is required to be checked in the case where we
		* are writing two consecutive buffers of data to the EEPROM.
		* The EEPROM takes about 2 milliseconds time to update the data
		* internally after a STOP has been sent on the bus.
		* A NACK will be generated in the case of a second write before
		* the EEPROM updates the data internally resulting in a
		* Transmission Error.
		*/
		if (IicInstanceSensor.Stats.TxErrors != 0) {



			/* Enable the IIC device.*/

			Status = XIic_Start(&IicInstanceSensor);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}


			if (!XIic_IsIicBusy(&IicInstanceSensor)) {

				/* Send the Data.*/

				Status = XIic_MasterSend(&IicInstanceSensor,
						WriteBufferSensor,
						ByteCount);
				if (Status == XST_SUCCESS) {
					IicInstanceSensor.Stats.TxErrors = 0;
				}
				else {
				}
			}
		}
	}


	/* Stop the IIC device.*/

	Status = XIic_Stop(&IicInstanceSensor);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
/***************************************************************************
*
* This function reads data from the IIC serial EEPROM into a specified buffer.
*
* @param	BufferPtr contains the address of the data buffer to be filled.
* @param	ByteCount contains the number of bytes in the buffer to be read.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
*****************************************************************************/
int SensorReadData(u8 *BufferPtr, u16 ByteCount, u16 ReadAdd)
{
	int Status;

	/* Set the Defaults.*/

	ReceiveCompleteSensor = 1;

	/*Read register address sending.*/

	WriteBufferSensor[0] = (u8) ReadAdd;

	Status = SensorWriteData(1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Start the IIC device.*/

	Status = XIic_Start(&IicInstanceSensor);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Receive the Data.*/

	Status = XIic_MasterRecv(&IicInstanceSensor, BufferPtr, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Wait till all the data is received.*/

	while ((ReceiveCompleteSensor) || (XIic_IsIicBusy(&IicInstanceSensor) == TRUE)) {

	}


	/* Stop the IIC device.*/

	Status = XIic_Stop(&IicInstanceSensor);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/***************************************************************************
*
* This function setups the interrupt system so interrupts can occur for the
* IIC device. The function is application-specific since the actual system may
* or may not have an interrupt controller. The IIC device could be directly
* connected to a processor without an interrupt controller. The user should
* modify this function to fit the application.
*
* @param	IicInstPtr contains a pointer to the instance of the IIC device
*		which is going to be connected to the interrupt controller.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
*****************************************************************************/
static int SetupInterruptSystemSensor(XIic *IicInstPtr)
{
	int Status;

#ifdef XPAR_INTC_0_DEVICE_ID


	/* Initialize the interrupt controller driver so that it's ready to use.*/

	Status = XIntc_Initialize(&IntcSensor, INTC_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Connect the device driver handler that will be called when an
	* interrupt for the device occurs, the handler defined above performs
	* the specific interrupt processing for the device.
	*/
	Status = XIntc_Connect(&IntcSensor, IIC_INTR_ID,
			(XInterruptHandler) XIic_InterruptHandler,
			IicInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Start the interrupt controller so interrupts are enabled for all
	* devices that cause interrupts.
	*/
	Status = XIntc_Start(&IntcSensor, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Enable the interrupts for the IIC device.*/

	XIntc_Enable(&IntcSensor, IIC_INTR_ID);

#else

	XScuGic_Config *IntcConfig;


	* Initialize the interrupt controller driver so that it is ready to
	* use.

	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&Intc, IntcConfig,
			IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(&Intc, IIC_INTR_ID,
			0xA0, 0x3);


	* Connect the interrupt handler that will be called when an
	* interrupt occurs for the device.

	Status = XScuGic_Connect(&Intc, IIC_INTR_ID,
			(Xil_InterruptHandler)XIic_InterruptHandler,
			IicInstPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}


	* Enable the interrupt for the IIC device.

	XScuGic_Enable(&Intc, IIC_INTR_ID);

#endif


	/* Initialize the exception table and register the interrupt
	* controller handler with the exception table*/

	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)INTC_HANDLER, &IntcSensor);

	/*Enable non-critical exceptions*/
	Xil_ExceptionEnable();



	return XST_SUCCESS;
}

/***************************************************************************
*
* This Send handler is called asynchronously from an interrupt
* context and indicates that data in the specified buffer has been sent.
*
* @param	InstancePtr is not used, but contains a pointer to the IIC
*		device driver instance which the handler is being called for.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
static void SendHandlerSensor(XIic *InstancePtr)
{
	TransmitCompleteSensor = 0;
}

/***************************************************************************
*
* This Receive handler is called asynchronously from an interrupt
* context and indicates that data in the specified buffer has been Received.
*
* @param	InstancePtr is not used, but contains a pointer to the IIC
*		device driver instance which the handler is being called for.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
static void ReceiveHandlerSensor(XIic *InstancePtr)
{
	ReceiveCompleteSensor = 0;
}

/***************************************************************************
*
* This Status handler is called asynchronously from an interrupt
* context and indicates the events that have occurred.
*
* @param	InstancePtr is a pointer to the IIC driver instance for which
*		the handler is being called for.
* @param	Event indicates the condition that has occurred.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
static void StatusHandlerSensor(XIic *InstancePtr, int Event)
{

}
