#!/bin/sh
mainpid=$(lsof -i:8091|grep 'LISTEN'|awk '{print $2}')
echo $mainpid
if [ $mainpid > 0 ];then
    echo "main process id:$mainpid"
    kill -9 $mainpid
    if [ $? -eq 0 ];then
    echo "kill $mainpid success"
    go run . start
    else
    echo "kill $mainpid fail"
    fi
else
    go run . start
fi