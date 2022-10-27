/************************************************************************************

�������ƣ���ʱ����(����Ƶ��12MHz)
����˵��: ��ʱ������΢��

************************************************************************************/

#include "stc15f2k60s2.h"	    // ��Ƭ��STC15F2K60S2ͷ�ļ�,���Բ��ټ���reg51.h
#include <intrins.h>			    // �����ͷ�ļ���,��ʹ��_nop_�⺯��
#include <stdio.h>



void Delay1us()		//@18.432MHz
{
	_nop_();
	_nop_();
	_nop_();
	_nop_();
}

void Delay1ms()		//@18.432MHz
{
	unsigned char i, j;

	i = 12;
	j = 169;
	do
	{
		while (--j);
	} while (--i);
}

void DelayMS(int t)
{
	while(t--)
	{
		Delay1ms();
	}
}

void DelayUS(int t)
{
	while(t--)
	{
		Delay1us();
	}
}



