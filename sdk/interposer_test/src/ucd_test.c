/*
 * ucd_test.c
 *
 *  Created on: Sep 4, 2016
 *      Author: 502361493
 */


#include "xparameters.h"
#include "xiic.h"
#include "xil_exception.h"

#ifdef XPAR_INTC_0_DEVICE_ID
 #include "xintc.h"
#else
 #include "xscugic.h"
#endif

#include "ucd_test.h"
#include "math.h"

XIic IicInstance;

static UCD_VOLTAGE ucd_voltage[RAIL_NUM] =
{
	{"VCC_INT  ", 1.05, 0.95, TRUE},
	{"VCC_AUX  ", 1.89, 1.71, TRUE},
	{"V1D8     ", 0, 0, FALSE},
	{"V1D1     ", 0, 0, FALSE},
	{"VCC_MGTA ", 1.23, 1.17, TRUE},
	{"V2D5     ", 0, 0, FALSE},
	{"VCCO_3D3 ", 3.45, 3.15, TRUE},
	{"V12D0    ", 0, 0, FALSE},
	{"V5D0     ", 5.5, 4.5, TRUE},
	{"VBATT_RTC", 0, 0, FALSE},
	{"VBATT_FPGA", 0, 0, FALSE},
	{"VCC_IO   ", 3.45, 3.15, TRUE}
};

int ucd_test()
{
	u32 Index=0;
	int Status;
	XIic_Config *ConfigPtr;	/* Pointer to configuration data */
//	AddressType Address = EEPROM_TEST_START_ADDRESS;
//	EepromIicAddr = UCD_ADDR;
	u8 buf[10], i;
	char exponent;
	double volt,full_volt;

	xil_printf("*** UCD90160 voltage monitor Test:\r\n");

	/*
	 * Initialize the IIC driver so that it is ready to use.
	 */
	ConfigPtr = XIic_LookupConfig(XPAR_AXI_IIC_0_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&IicInstance, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Send random data to initiate the I2C module
	XIic_Send(XPAR_IIC_0_BASEADDR,UCD_ADDR, buf, 2, XIIC_STOP);

	for(i=0; i<RAIL_NUM; i++)
	{
		//Send PAGE command to select rail
		buf[0] = PAGE;
		buf[1] = i;
		XIic_Send(XPAR_IIC_0_BASEADDR,UCD_ADDR, buf, 2, XIIC_STOP);

		//Check exponent value
		buf[0] = VOUT_MODE;
		XIic_Send(XPAR_IIC_0_BASEADDR, UCD_ADDR, buf, 1, XIIC_REPEATED_START);
		XIic_Recv(XPAR_IIC_0_BASEADDR, UCD_ADDR, buf, 2, XIIC_STOP);
		exponent = (7 << 5) | buf[0];
		MB_Sleep(5);

		//Get voltage
		buf[0] = READ_VOUT;
		XIic_Send(XPAR_IIC_0_BASEADDR, UCD_ADDR, buf, 1, XIIC_REPEATED_START);
		XIic_Recv(XPAR_IIC_0_BASEADDR,UCD_ADDR, buf, 2, XIIC_STOP);

		//Calculate the voltage
		full_volt = buf[1]*256 + buf[0];
		volt = full_volt * pow(2, exponent);

		sprintf(buf, "%.3f", volt);
		if(ucd_voltage[i].need_check == TRUE)
		{
			if((ucd_voltage[i].max_vol > volt) && (ucd_voltage[i].min_vol < volt))
			{
				xil_printf("%s: %sV", ucd_voltage[i].name, buf);
				print_result(XST_SUCCESS);
			}
			else
			{
				xil_printf("%s: %sV", ucd_voltage[i].name, buf);
				print_result(XST_FAILURE);
			}
		}
	}

	return Status;
}
