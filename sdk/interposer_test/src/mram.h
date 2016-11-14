/*
 * mram.h
 *
 *  Created on: Sep 9, 2016
 *      Author: 502361493
 */

#ifndef MRAM_H_
#define MRAM_H_

#define MRAM_IO_CHANNEL1	 1	//Control
#define MRAM_IO_CHANNEL2	 2	//Data

typedef union
{
	u8 stat;
	struct
	{
		u8 g:1;
		u8 ub:1;
		u8 lb:1;
		u8 w:1;
		u8 e:1;
		u8 bit_unused:3;
	}bit;
}CNTL_STATUS;


#endif /* MRAM_H_ */
