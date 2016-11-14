//**************************************************************************************
//             Proprietary Information of General Electric Company
//             Copyright (c) 2016, General Electric Company
//**************************************************************************************
//
// Project     : Test Software
// Module      : Controller Application
//
// Filename    : iic_rfid.c
//
// Description : Rfid UID read functions.
//
// Revision History:
//
// DATE      AUTHOR     COMMENTS
// 10SEP2016 NeerajS	Initial Draft.
// ------------------------------------------------------------------------

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xiic.h"
#include "xil_exception.h"
//#include "common_header.h"
#include "string.h"
#ifdef XPAR_INTC_0_DEVICE_ID
 #include "xintc.h"
#else
 #include "xscugic.h"
#endif

/************************** Constant Definitions *****************************/

/*
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

/*
 * Rfid Address
 */
#define RFID_ADDRESS 					0x57	/* Address for RTC i.e. 1101111R/W. */
#define RFID_RW_DATA_SZ					25
#define RFID_TEST_START_ADDRESS			0



/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int IicRfidExample();

int RfidWriteData(u16 ByteCount);

int RfidReadData(u8 *BufferPtr, u16 ByteCount);

static int SetupInterruptSystemRfid(XIic *IicInstPtr);

static void SendHandlerRfid(XIic *InstancePtr);

static void ReceiveHandlerRfid(XIic *InstancePtr);

static void StatusHandlerRfid(XIic *InstancePtr, int Event);

/************************** Variable Definitions *****************************/

XIic IicInstanceRfid;	/* The instance of the IIC device. */
INTC IntcRfid; 	/* The instance of the Interrupt Controller Driver */

/*
 * Write buffer for writing a page.
 */
u8 WriteBufferRfid[RFID_RW_DATA_SZ];

u8 ReadBufferRfid[RFID_RW_DATA_SZ];	/* Read buffer for reading a page. */

volatile u8 TransmitCompleteRfid;	/* Flag to check completion of Transmission */
volatile u8 ReceiveCompleteRfid;	/* Flag to check completion of Reception */

u8 RfidIicAddr;		/* Variable for storing Eeprom IIC address */

/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
* Main function to call the High level EEPROM example.
*
* @param	None.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int rfid_test(void)
{
	int Status;

	/*
	 * Run the Iic EEPROM interrupt mode example.
	 */
    xil_printf("*** M24LR64E-R RFID  Test:\r\n");

    Status = IicRfidExample();
//    if (Status == XST_SUCCESS)
//	{
//		xil_printf("\nRFID Test:	\033[32mPASSED\033[0m ***\r\n");
//	}
//    else
//    {
//    	xil_printf("\nRFID Test:	\033[5mFAILED\033[0m ***\r\n");
//	}
//
//    print("*** IIC M24LR64E-R RFID Test Exit ***\n\r");

	return Status;
}

/*****************************************************************************/
/**
* This function writes, reads, and verifies the data to the IIC RTC.
*
* @param	None.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int IicRfidExample()
{
	int Status;
	XIic_Config *ConfigPtr;	/* Pointer to configuration data */
	RfidIicAddr = RFID_ADDRESS;

	/*
	 * Initialize the IIC driver so that it is ready to use.
	 */
	ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&IicInstanceRfid, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the Interrupt System.
	 */
	Status = SetupInterruptSystemRfid(&IicInstanceRfid);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the Handlers for transmit and reception.
	 */
	XIic_SetSendHandler(&IicInstanceRfid, &IicInstanceRfid,
				(XIic_Handler) SendHandlerRfid);
	XIic_SetRecvHandler(&IicInstanceRfid, &IicInstanceRfid,
				(XIic_Handler) ReceiveHandlerRfid);
	XIic_SetStatusHandler(&IicInstanceRfid, &IicInstanceRfid,
				  (XIic_StatusHandler) StatusHandlerRfid);

	/*
	 * Set the Slave address.
	 */
	Status = XIic_SetAddress(&IicInstanceRfid, XII_ADDR_TO_SEND_TYPE,
				 RfidIicAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Initialize the data to write and the read buffer.
	 */

	memset(WriteBufferRfid, 25, 0x0);
	memset(ReadBufferRfid, 25, 0x0);
	/*
	 * Address in EEPROM to read as UID.
	 */
	WriteBufferRfid[0] = 0x09;	//2320 address and size i.e. next 16 bytes till 2332.
	WriteBufferRfid[1] = 0x10;

	Status = RfidReadData(ReadBufferRfid, 16);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}
	xil_printf("AFI Value is 0x%02x               [\033[33mVisual Inspection\033[0m]\r\n",
			ReadBufferRfid[2]);
	xil_printf("DSFID Value is 0x%02x             [\033[33mVisual Inspection\033[0m]\r\n",
			ReadBufferRfid[3]);
	xil_printf("UID Value is 0x%02x%02x%02x%02x%02x%02x%02x%02x [\033[33mVisual Inspection\033[0m]\r\n",
			ReadBufferRfid[11],ReadBufferRfid[10],ReadBufferRfid[9],ReadBufferRfid[8],ReadBufferRfid[7],ReadBufferRfid[6],ReadBufferRfid[5],ReadBufferRfid[4]);
	xil_printf("Mem Size is 0x%02x%02x%02x            [\033[33mVisual Inspection\033[0m]\r\n",
			ReadBufferRfid[15],ReadBufferRfid[14],ReadBufferRfid[13]);

	return Status;
}


/*****************************************************************************/
/**
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
******************************************************************************/
int RfidWriteData(u16 ByteCount)
{
	int Status;

	/*
	 * Set the defaults.
	 */
	TransmitCompleteRfid = 1;
	IicInstanceRfid.Stats.TxErrors = 0;

	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(&IicInstanceRfid);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Send the Data.
	 */
	Status = XIic_MasterSend(&IicInstanceRfid, WriteBufferRfid, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till the transmission is completed.
	 */
	while ((TransmitCompleteRfid) || (XIic_IsIicBusy(&IicInstanceRfid) == TRUE)) {
		/*
		 * This condition is required to be checked in the case where we
		 * are writing two consecutive buffers of data to the EEPROM.
		 * The EEPROM takes about 2 milliseconds time to update the data
		 * internally after a STOP has been sent on the bus.
		 * A NACK will be generated in the case of a second write before
		 * the EEPROM updates the data internally resulting in a
		 * Transmission Error.
		 */
		if (IicInstanceRfid.Stats.TxErrors != 0) {


			/*
			 * Enable the IIC device.
			 */
			Status = XIic_Start(&IicInstanceRfid);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}


			if (!XIic_IsIicBusy(&IicInstanceRfid)) {
				/*
				 * Send the Data.
				 */
				Status = XIic_MasterSend(&IicInstanceRfid,
							 WriteBufferRfid,
							 ByteCount);
				if (Status == XST_SUCCESS) {
					IicInstanceRfid.Stats.TxErrors = 0;
				}
				else {
				}
			}
		}
	}

	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(&IicInstanceRfid);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
/*****************************************************************************/
/**
* This function reads data from the IIC serial EEPROM into a specified buffer.
*
* @param	BufferPtr contains the address of the data buffer to be filled.
* @param	ByteCount contains the number of bytes in the buffer to be read.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int RfidReadData(u8 *BufferPtr, u16 ByteCount)
{
	int Status;
	/*
	 * Set the Defaults.
	 */
	ReceiveCompleteRfid = 1;

	/*
	 * Position the Pointer in EEPROM.
	 */

	Status = RfidWriteData(2); //Need to write only 2 bytes for EEPROM Read Address i.e. 2320.
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(&IicInstanceRfid);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Receive the Data.
	 */
	Status = XIic_MasterRecv(&IicInstanceRfid, BufferPtr, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till all the data is received.
	 */
	while ((ReceiveCompleteRfid) || (XIic_IsIicBusy(&IicInstanceRfid) == TRUE)) {

	}

	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(&IicInstanceRfid);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
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
******************************************************************************/
static int SetupInterruptSystemRfid(XIic *IicInstPtr)
{
	int Status;

#ifdef XPAR_INTC_0_DEVICE_ID

	/*
	 * Initialize the interrupt controller driver so that it's ready to use.
	 */
	Status = XIntc_Initialize(&IntcRfid, INTC_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(&IntcRfid, IIC_INTR_ID,
				   (XInterruptHandler) XIic_InterruptHandler,
				   IicInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller so interrupts are enabled for all
	 * devices that cause interrupts.
	 */
	Status = XIntc_Start(&IntcRfid, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts for the IIC device.
	 */
	XIntc_Enable(&IntcRfid, IIC_INTR_ID);

#else

	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
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

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Status = XScuGic_Connect(&Intc, IIC_INTR_ID,
				 (Xil_InterruptHandler)XIic_InterruptHandler,
				 IicInstPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	/*
	 * Enable the interrupt for the IIC device.
	 */
	XScuGic_Enable(&Intc, IIC_INTR_ID);

#endif

	/*
	 * Initialize the exception table and register the interrupt
	 * controller handler with the exception table
	 */
	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)INTC_HANDLER, &IntcRfid);

	/* Enable non-critical exceptions */
	Xil_ExceptionEnable();



	return XST_SUCCESS;
}

/*****************************************************************************/
/**
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
******************************************************************************/
static void SendHandlerRfid(XIic *InstancePtr)
{
	TransmitCompleteRfid = 0;
}

/*****************************************************************************/
/**
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
******************************************************************************/
static void ReceiveHandlerRfid(XIic *InstancePtr)
{
	ReceiveCompleteRfid = 0;
}

/*****************************************************************************/
/**
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
******************************************************************************/
static void StatusHandlerRfid(XIic *InstancePtr, int Event)
{

}





