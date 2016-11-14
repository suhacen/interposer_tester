
/**
 * @file 	rtc_test.c
 * @brief 	This is the rtc driver on Interposer
 *
 * Revision History:
 *
 * DATE			AUTHOR		COMMENTS
 * ------------------------------------------------------
 * 10-SEP-16	NeerajS		Initial Draft
 * 25-OCT-16	NeerajS		Fix the Time is not running issue
 * 27-OCT-16    C.SU		Fix the time display format error, modify the RTC
 *                          test routine: Display time first, and then set the
 *                          time to a specific value
 *
 */

#include "xparameters.h"
#include "xiic.h"
#include "xil_exception.h"
#include "stdio.h"
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
 * RTC Address
 */
#define RTC_ADDRESS 					0x6f	/* Address for RTC i.e. 1101111R/W. */
#define RTC_RW_DATA_SZ					50
#define RTC_TEST_START_ADDRESS			0


/*
 * Register related to RTC
 */
#define RTC_REG_SECS         0x00
#define RTC_REG_MIN          0x01
#define RTC_REG_HOUR         0x02
#define RTC_REG_WDAY         0x03
#define RTC_REG_MDAY         0x04
#define RTC_REG_MONTH        0x05
#define RTC_REG_YEAR         0x06

typedef u16 AddressType;
/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int IicRtcExample();

int RtcWriteData(u16 ByteCount);

int RtcReadData(u8 *BufferPtr, u16 ByteCount, u16 address);

static int SetupInterruptSystemRtc(XIic *IicInstPtr);

static void SendHandlerRtc(XIic *InstancePtr);

static void ReceiveHandlerRtc(XIic *InstancePtr);

static void StatusHandlerRtc(XIic *InstancePtr, int Event);

/************************** Variable Definitions *****************************/

XIic IicInstanceRtc;	/* The instance of the IIC device. */
INTC IntcRtc; 	/* The instance of the Interrupt Controller Driver */

/*
 * Write buffer for writing a page.
 */
u8 WriteBufferRtc[RTC_RW_DATA_SZ];

u8 ReadBufferRtc[RTC_RW_DATA_SZ];	/* Read buffer for reading a page. */

volatile u8 TransmitCompleteRtc;	/* Flag to check completion of Transmission */
volatile u8 ReceiveCompleteRtc;	/* Flag to check completion of Reception */

u8 RtcIicAddr;		/* Variable for storing Eeprom IIC address */

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
//int rtc_test(void)
//{
//	int Status;
//	u8 ReadBufferRtc[50];
//
//	/*
//	 * Run the Iic RTC interrupt mode example.
//	 */
//
//
//
//
//    Status = IicRtcExample();
//    print_result(Status);
//
//	return Status;
//}

/**
 * Convert a hex value to string
 *
 * @param[in]    hex    hex value
 * @param[out]   str    Desitination address to store converted string
 * @retval       NONE
 */
void hextostring(u32 hex, u8 * str, u8 width)
{
	u8 temp, i;

	for(i=0; i<width; i++)
	{
		temp = (hex>>(4*i)) & 0x0f;

		if((temp >= 0xa) && (temp <= 0xf))
		{
			str[width-i-1] = 'a' + (temp - 0xa);
		}
		else
		{
			str[width-i-1] = '0' + temp;
		}
	}

	str[width] = '\0';
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
int rtc_test()
{
	int Status;
	char input_buf[10] = {0x0,0x1,0x2,0x3,0x4,0x5,0x6,0x7}; //RTC Write and verify buffer with RTC address register
	u8 day[2], month[2], year[4], sec[2], min[2], hour[2];

	XIic_Config *ConfigPtr;	/* Pointer to configuration data */
	RtcIicAddr = RTC_ADDRESS;

	/*
	 * Initialize the IIC driver so that it is ready to use.
	 */
	ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&IicInstanceRtc, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the Interrupt System.
	 */
	Status = SetupInterruptSystemRtc(&IicInstanceRtc);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	/*
	 * Set the Handlers for transmit and reception.
	 */
	XIic_SetSendHandler(&IicInstanceRtc, &IicInstanceRtc,
				(XIic_Handler) SendHandlerRtc);
	XIic_SetRecvHandler(&IicInstanceRtc, &IicInstanceRtc,
				(XIic_Handler) ReceiveHandlerRtc);
	XIic_SetStatusHandler(&IicInstanceRtc, &IicInstanceRtc,
				  (XIic_StatusHandler) StatusHandlerRtc);

	/*
	 * Set the Slave address.
	 */
	Status = XIic_SetAddress(&IicInstanceRtc, XII_ADDR_TO_SEND_TYPE,
				 RtcIicAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Initialize the data to write and the read buffer.
	 */
	memset(WriteBufferRtc, 50, 0x0);
	memset(ReadBufferRtc, 50, 0x0);

	//memcpy(WriteBufferRtc,input_buf,8);

	RtcReadData(ReadBufferRtc, 1 , 0);
	WriteBufferRtc[0] = 0x00;
	WriteBufferRtc[1] = 0x80 | ReadBufferRtc[0];
	RtcWriteData(2);

	RtcReadData(ReadBufferRtc, 1 , 3);
	WriteBufferRtc[0] = 0x03;
	WriteBufferRtc[1] = 0x08 | ReadBufferRtc[0];
	RtcWriteData(2);

	memset(WriteBufferRtc, 50, 0x0);
	memset(ReadBufferRtc, 50, 0x0);

	memcpy(WriteBufferRtc,input_buf,8);

	//Read current time from RTC
	xil_printf("*** Read RTC Current Time:");

	Status = RtcReadData(ReadBufferRtc, 8 , 0);
	if (Status != XST_SUCCESS)
	{
		print_result(Status);
		return Status;
	}

	//Convert read out time format to display
	hextostring(ReadBufferRtc[4] & 0x3f, day, 2);
	hextostring(ReadBufferRtc[5] & 0x1f, month, 2);
	hextostring(((ReadBufferRtc[6] & 0x3f) + 0x2000), year, 4);
	hextostring(ReadBufferRtc[2] & 0x3f, hour, 2);
	hextostring(ReadBufferRtc[1] & 0x7f, min, 2);
	hextostring(ReadBufferRtc[0] & 0x7f, sec, 2);

	xil_printf(" %2.2s/%2.2s/%4.4s  %2.2s:%2.2s:%2.2s\r\n",
			day, month, year, hour, min, sec);

	xil_printf("*** Set RTC time to 18/12/2016  20:17:08");

	WriteBufferRtc[0] = 0x04;
	WriteBufferRtc[1] = 0x18;
	WriteBufferRtc[2] = 0x12;
	WriteBufferRtc[3] = 0x16;
	Status = RtcWriteData(4);
	if (Status != XST_SUCCESS)
	{
		print_result(Status);
		return XST_FAILURE;
	}

	WriteBufferRtc[0] = 0;
	WriteBufferRtc[1] = (0x8 | 0x80);
	WriteBufferRtc[2] = 0x17;
	WriteBufferRtc[3] = 0x20;
	Status = RtcWriteData(4);
	print_result(Status);

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
int RtcWriteData(u16 ByteCount)
{
	int Status;

	/*
	 * Set the defaults.
	 */
	TransmitCompleteRtc = 1;
	IicInstanceRtc.Stats.TxErrors = 0;

	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(&IicInstanceRtc);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Send the Data.
	 */
	Status = XIic_MasterSend(&IicInstanceRtc, WriteBufferRtc, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till the transmission is completed.
	 */
	while ((TransmitCompleteRtc) || (XIic_IsIicBusy(&IicInstanceRtc) == TRUE)) {
		/*
		 * This condition is required to be checked in the case where we
		 * are writing two consecutive buffers of data to the EEPROM.
		 * The EEPROM takes about 2 milliseconds time to update the data
		 * internally after a STOP has been sent on the bus.
		 * A NACK will be generated in the case of a second write before
		 * the EEPROM updates the data internally resulting in a
		 * Transmission Error.
		 */
		if (IicInstanceRtc.Stats.TxErrors != 0) {


			/*
			 * Enable the IIC device.
			 */
			Status = XIic_Start(&IicInstanceRtc);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}


			if (!XIic_IsIicBusy(&IicInstanceRtc)) {
				/*
				 * Send the Data.
				 */
				Status = XIic_MasterSend(&IicInstanceRtc,
							 WriteBufferRtc,
							 ByteCount);
				if (Status == XST_SUCCESS) {
					IicInstanceRtc.Stats.TxErrors = 0;
				}
				else {
				}
			}
		}
	}

	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(&IicInstanceRtc);
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
int RtcReadData(u8 *BufferPtr, u16 ByteCount, u16 address)
{
	int Status;

	/*
	 * Set the Defaults.
	 */
	ReceiveCompleteRtc = 1;

	/*
	 * Position the Pointer in EEPROM.
	 */
	WriteBufferRtc[0] = (u8)address;// (RTC_TEST_START_ADDRESS);

	Status = RtcWriteData(1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(&IicInstanceRtc);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Receive the Data.
	 */
	Status = XIic_MasterRecv(&IicInstanceRtc, BufferPtr, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till all the data is received.
	 */
	while ((ReceiveCompleteRtc) || (XIic_IsIicBusy(&IicInstanceRtc) == TRUE)) {

	}

	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(&IicInstanceRtc);
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
static int SetupInterruptSystemRtc(XIic *IicInstPtr)
{
	int Status;

#ifdef XPAR_INTC_0_DEVICE_ID

	/*
	 * Initialize the interrupt controller driver so that it's ready to use.
	 */
	Status = XIntc_Initialize(&IntcRtc, INTC_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(&IntcRtc, IIC_INTR_ID,
				   (XInterruptHandler) XIic_InterruptHandler,
				   IicInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller so interrupts are enabled for all
	 * devices that cause interrupts.
	 */
	Status = XIntc_Start(&IntcRtc, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts for the IIC device.
	 */
	XIntc_Enable(&IntcRtc, IIC_INTR_ID);

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
			 (Xil_ExceptionHandler)INTC_HANDLER, &IntcRtc);

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
static void SendHandlerRtc(XIic *InstancePtr)
{
	TransmitCompleteRtc = 0;
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
static void ReceiveHandlerRtc(XIic *InstancePtr)
{
	ReceiveCompleteRtc = 0;
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
static void StatusHandlerRtc(XIic *InstancePtr, int Event)
{

}
