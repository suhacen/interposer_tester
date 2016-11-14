/**
 * @file    unit_test.c
 * @brief   This file is to call cutest framework to conduct
 *          unit test for this project.
 *
 * DATE			AUTHOR		COMMENTS
 * ------------------------------------------------------
 * 01-NOV-16	C.SU		test hextostring()
 */

#include "xparameters.h"
#include "xiic.h"
#include "xil_exception.h"
#include "cutest.h"

void Testhextostring(CuTest * tc)
{
	u8 buf[10];

	hextostring(0x19, buf, 2);
	CuAssertStrEquals(tc, "19", buf);
	hextostring(0xab, buf, 2);
	CuAssertStrEquals(tc, "ab", buf);
	hextostring(0xcc, buf, 2);
	CuAssertStrEquals(tc, "cc", buf);
	hextostring(0x11, buf, 2);
	CuAssertStrEquals(tc, "11", buf);
	hextostring(0x1111, buf, 4);
	CuAssertStrEquals(tc, "1111", buf);
	hextostring(0xbbb, buf, 3);
	CuAssertStrEquals(tc, "bbb", buf);
	hextostring(0xabcde, buf, 5);
	CuAssertStrEquals(tc, "abcde", buf);
	hextostring(0xaaaaaa, buf, 6);
	CuAssertStrEquals(tc, "aaaaaa", buf);
	hextostring(0x1, buf, 1);
	CuAssertStrEquals(tc, "1", buf);
	hextostring(0xf, buf, 1);
	CuAssertStrEquals(tc, "f", buf);
	hextostring(0x1234abc, buf, 7);
	CuAssertStrEquals(tc, "1234abc", buf);
	hextostring(0xffffffff, buf, 8);
	CuAssertStrEquals(tc, "ffffffff", buf);
	hextostring(0x11111111, buf, 8);
	CuAssertStrEquals(tc, "11111111", buf);
}


void unit_test()
{
	CuString *output = CuStringNew();

	if(output == NULL)
	{
		return;
	}

	CuSuite* suite = CuSuiteNew();

	if(suite == NULL)
	{
		return;
	}

	SUITE_ADD_TEST(suite, Testhextostring);
	CuSuiteRun(suite);
	CuSuiteSummary(suite, output);
	CuSuiteDetails(suite, output);
	xil_printf("Unit test rusult:\r\n%s\r\n", output->buffer);
	CuSuiteDelete(suite);
	CuStringDelete(output);
}
