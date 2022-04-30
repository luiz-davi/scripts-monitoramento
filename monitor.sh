#!/bin/bash

echo Cont MemUsed MemFree MemShared MemBuffer Swap DiskUsed CpuUsr CpuSys CpuSoft CpuIdle Data Hora >  monitor_log.txt
echo Cont MemUSed MemFree MemShared MemBuffer Swap DiskUsed CpuUsr CpuSys CpuSoft CpuIdle Data Hora

count=1

while [ True ]
do
	mem=`free | grep Mem | awk '{print $3, $4, $5, $6}'`
	swap=`free | grep Swap | awk '{print $3}'`
	disco=`df | grep rootfs | awk '{print $3}'`
	cpu=`mpstat 1 1 | grep Average | awk '{print $3, $5, $8, $12}'`
	data=`date --rfc-3339=seconds`

	echo $count $mem $swap $disco $cpu $data >> monitor_log.txt
	echo $count $mem $swap $disco $cpu $data

	count=`expr $count + 1`

	sleep 2

done
