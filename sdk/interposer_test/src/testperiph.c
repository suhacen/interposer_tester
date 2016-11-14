/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "intc_header.h"
#include "ucd_test.h"

#define VERSION_STR			"00.00.01"

void print_banner()
{
	print("\n\r~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	print("\n\r~~         GE Transportation - Interposer TESTER      ~~");
	print("\n\r~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n");
	xil_printf("Version: %s\n\r", VERSION_STR);
	xil_printf("Compile Date: %s %s\n\r", __DATE__, __TIME__);
	print("\r\n");
}

void print_result(int Status)
{
    if (Status == XST_SUCCESS)
	{
		xil_printf("        [\033[32mPASSED\033[0m]\r\n");
	}
    else
    {
    	xil_printf("        [\033[31mFAILED\033[0m]\r\n");
	}
}

int main()
{
   static XIntc intc;

   Xil_ICacheEnable();
   Xil_DCacheEnable();

//   unit_test();
   print_banner();
   io_loopback_test();
   mram_test();
   rtc_test();
   eeprom_test();
   ucd_test();
   temp_sensor_test();
   rfid_test();

   while(1);
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
