#******************************************************************************
#
# Makefile - Rules for building the stm32f205 example.
#
# Copyright (c) 2013-2014 Texas Instruments Incorporated.  All rights reserved.
# Software License Agreement
# 
# Texas Instruments (TI) is supplying this software for use solely and
# exclusively on TI's microcontroller products. The software is owned by
# TI and/or its suppliers, and is protected under applicable copyright
# laws. You may not combine this software with "viral" open-source
# software in order to form a larger program.
# 
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
# NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
# NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
# CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
# DAMAGES, FOR ANY REASON WHATSOEVER.
# 
# This is part of revision 2.1.0.12573 of the EK-TM4C1294XL Firmware Package.
#
#******************************************************************************

#
# The base directory for TivaWare.
#
ROOT=.

#
# Include the common make definitions.
#
include ${ROOT}/makedefs

#
# Where to find header files that do not live in the source directory.
#
IPATH=./inc
VPATH=./driverlib
#
# The default rule, which causes the stm32f205 example to be built.
#
all: ${COMPILER}
all: ${COMPILER}/stm32f205.axf

#
# The rule to clean out all the build products.
#
clean:
	@rm -rf ${COMPILER} ${wildcard *~}

install:
	jlink.exe burn.txt
#
# The rule to create the target directory.
#
${COMPILER}:
	@mkdir -p ${COMPILER}

#
# Rules for building the stm32f205 example.
#
${COMPILER}/stm32f205.axf: ${COMPILER}/startup_stm32f2xx.o
${COMPILER}/stm32f205.axf: ${COMPILER}/main.o
${COMPILER}/stm32f205.axf: ${COMPILER}/syscalls.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_it.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_rcc.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_syscfg.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_tim.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_usart.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_dma.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_gpio.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm32f2xx_i2c.o
${COMPILER}/stm32f205.axf: ${COMPILER}/misc.o
${COMPILER}/stm32f205.axf: ${COMPILER}/system_stm32f2xx.o
${COMPILER}/stm32f205.axf: ${COMPILER}/stm322xg_eval_i2c_ee.o
${COMPILER}/stm32f205.axf: stm32f2xx_flash.ld
SCATTERgcc_stm32f205=stm32f2xx_flash.ld
ENTRY_stm32f205=Reset_Handler
CFLAGSgcc=-DUSE_STDPERIPH_DRIVER -DSTM32F2XX

#
# Include the automatically generated dependency files.
#
ifneq (${MAKECMDGOALS},clean)
-include ${wildcard ${COMPILER}/*.d} __dummy__
endif
