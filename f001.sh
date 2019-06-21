#!/bin/bash
echo '本机网卡信息为：'
Elist=`ifconfig | grep ^[a-z]| awk -F":" '{print $1}'`
for Eth in $Elist
do
    IP=`ifconfig $Eth | grep -w inet | awk '{print $2,$3,$4}'`
    echo '    '$Eth:$IP
done

echo '本机的默认网关为：'
route -n | grep ^0 | awk '{print "    "$2}'

echo '本机的主机名为：'
echo '    '`hostname`

echo '本机的DNS为：'
grep nameserver /etc/resolv.conf | awk '{print "    "$2}' 
