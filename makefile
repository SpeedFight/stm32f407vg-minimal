system_stm32f4xx.o: system_stm32f4xx.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -DSTM32F407xx -Os -c system_stm32f4xx.c -o system_stm32f4xx.o

main.o: main.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -DSTM32F407xx -Os -c main.c -o main.o

startup_stm32f407xx.o: startup_stm32f407xx.s
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -DSTM32F407xx -Os -c startup_stm32f407xx.s -o startup_stm32f407xx.o

main.elf: main.o system_stm32f4xx.o
	arm-none-eabi-gcc -mcpu=cortex-m4 -mlittle-endian -mthumb -DSTM32F407xx -TSTM32F407VG_FLASH.ld -Wl,--gc-sections system_stm32f4xx.o main.o startup_stm32f407xx.o -o main.elf

main.hex: main.elf
	arm-none-eabi-objcopy -Oihex main.elf main.hex
