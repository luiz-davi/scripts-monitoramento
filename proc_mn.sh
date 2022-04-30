#!/bin/bash

echo System %Cpu Cpu VSZ RSS Mem Threads > proc_mn_log.txt
echo System %Cpu Cpu VSZ RSS Mem Threads

while [ True ]
do

	pid=`ps aux | grep puma | grep Sl | awk '{print $2}'`
	proc=`pidstat -u -h -p $pid -r 1 1 | grep ruby | awk '{print $5, $8, $9, $12, $13, $14}'`
	threads=`cat /proc/$pid/status | grep Threads | awk '{print $2}'`

	echo $proc $swap $threads >> proc_mn_log.txt
	echo $proc $swap $threads

	sleep 2

done

