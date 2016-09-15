#!/bin/bash
from=$1
to=$2
if [ -z "$to" ];then
	to="./"
fi
echo copy from $from to $to.
scp -r $from middle:~/shared/
~/Projects/GotoCluster/copyToCluster/c.sh $to

