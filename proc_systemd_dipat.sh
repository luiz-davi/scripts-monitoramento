#!/bin/bash

echo System %Cpu Cpu VSZ RSS Mem Swap Threads > systemd_dispat_log.txt
echo System %Cpu Cpu VSZ RSS Mem Swap Threads

while [ True ]
do

	pid=`ps aux | grep systemd-dispat | grep ? | awk '{print $2}'`
	proc=`pidstat -u -h -p $pid -r 1 1 | grep systemd-dispat | awk '{print $5, $8, $9, $12, $13, $14}'`
	swap=`cat /proc/$pid/status | grep VmSwap | awk '{print $2}'`
	threads=`cat /proc/$pid/status | grep Threads | awk '{print $2}'`

	echo $proc $swap $threads >> proc_mn_log.txt
	echo $proc $swap $threads

	sleep 2

done

