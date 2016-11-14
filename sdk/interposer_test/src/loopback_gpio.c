/*
 * loopback_gpio.c
 *
 *  Created on: Sep 28, 2016
 *      Author: 502361493
 */

#include "xparameters.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xgpio.h"

#define WRITE_CHANNEL	1
#define READ_CHANNEL 	2

XGpio loopback_io;
XGpio loopback_iob;
XGpio loopback_ioc;
XGpio loopback_iod;


int io_loopback_init()
{
	int Status;

	Status = XGpio_Initialize(&loopback_io, XPAR_TEST_GPIO_A_DEVICE_ID);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//Direction: output
	XGpio_SetDataDirection(&loopback_io, WRITE_CHANNEL, 0x0);

	//Direction: input
	XGpio_SetDataDirection(&loopback_io, READ_CHANNEL, 0xffffffff);

	Status = XGpio_Initialize(&loopback_iob, XPAR_TEST_GPIO_B_DEVICE_ID);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//Direction: output
	XGpio_SetDataDirection(&loopback_iob, WRITE_CHANNEL, 0x0);

	//Direction: input
	XGpio_SetDataDirection(&loopback_iob, READ_CHANNEL, 0xffffffff);

	Status = XGpio_Initialize(&loopback_ioc, XPAR_TEST_GPIO_C_DEVICE_ID);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//Direction: output
	XGpio_SetDataDirection(&loopback_ioc, WRITE_CHANNEL, 0x0);

	//Direction: input
	XGpio_SetDataDirection(&loopback_ioc, READ_CHANNEL, 0xffffffff);

	Status = XGpio_Initialize(&loopback_iod, XPAR_TEST_GPIO_D_DEVICE_ID);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//Direction: output
	XGpio_SetDataDirection(&loopback_iod, WRITE_CHANNEL, 0x0);

	//Direction: input
	XGpio_SetDataDirection(&loopback_iod, READ_CHANNEL, 0xffffffff);

	return XST_SUCCESS;

}

void io_loopback_test()
{
	u32 dat = 0;
	int result;

	xil_printf("*** IO LOOPBACK R/W  Test: ");
	if(io_loopback_init() != XST_SUCCESS)
	{
		print_result(XST_FAILURE);
		return ;
	}

	XGpio_DiscreteWrite(&loopback_io, WRITE_CHANNEL, 0x0);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_io, READ_CHANNEL);

	if((dat & 0xfffffff) != 0)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT A error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_io, WRITE_CHANNEL, 0xffffffff);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_io, READ_CHANNEL);

	if((dat | 0xf8000000) != 0xffffffff)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT A error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_iob, WRITE_CHANNEL, 0x0);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_iob, READ_CHANNEL);

	if((dat & 0x3fffffff) != 0)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT B error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_iob, WRITE_CHANNEL, 0xffffffff);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_iob, READ_CHANNEL);

	if((dat | 0xc0000000) != 0xffffffff)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT B error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_ioc, WRITE_CHANNEL, 0x0);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_ioc, READ_CHANNEL);

	if(dat != 0)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT C error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_ioc, WRITE_CHANNEL, 0xffffffff);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_ioc, READ_CHANNEL);

	if(dat != 0xffffffff)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT C error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_iod, WRITE_CHANNEL, 0x0);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_iod, READ_CHANNEL);

	if((dat & 0x1fffffff) != 0)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT D error: 0x%x\r\n", dat);
		return;
	}

	XGpio_DiscreteWrite(&loopback_iod, WRITE_CHANNEL, 0xffffffff);
	MB_Sleep(50);
	dat = XGpio_DiscreteRead(&loopback_iod, READ_CHANNEL);

	if((dat | 0xE0000000) != 0xffffffff)
	{
		print_result(XST_FAILURE);
		xil_printf(" IO PORT D error: 0x%x\r\n", dat);
		return;
	}

	print_result(XST_SUCCESS);
}
