/*
 * ucd_test.h
 *
 *  Created on: Sep 4, 2016
 *      Author: 502361493
 */

#ifndef UCD_TEST_H_
#define UCD_TEST_H_

#include "xil_types.h"

/** define PMBUS command, details reference to TI doc SLVA285 */
#define PAGE 		0x00 ///< Select rail
#define VOUT_MODE	0X20 ///< Establish Range and revolution
#define READ_VOUT	0x8B ///< Read voltage
#define READ_IOUT	0x8C ///< Read current
#define READ_TEMP	0x8E ///< Read temperature

/** Board related parameters*/
#define RAIL_NUM 	12
#define UCD_ADDR	65

typedef struct{
	unsigned char name[10];
	double max_vol;
	double min_vol;
	char need_check;
}UCD_VOLTAGE;

extern int ucd_test();

#endif /* UCD_TEST_H_ */
