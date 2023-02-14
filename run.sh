#!/bin/sh
function close_port() {
    let port=$1
    pid=$(lsof -i:$port|grep 'LISTEN'|awk '{print $2}')
    echo "this pid of $port is ${pid}"
    if [ $pid > 0 ]; then
        if [ $pid > 0 ];then
            kill -9 $pid
            if [ $? -eq 0 ];then
                echo "kill $pid success"
            else
                echo "kill $pid fail"
                return 0
            fi
        fi
    fi
    return 1
}
rm -rf log
rm -rf 0
close_port 8091
if [ $? > 0 ]; then
    echo "close 8091 success"
else
    echo "close 8091 fail"
    exit 1
fi
close_port 8090
if [ $? > 0 ]; then
    echo "close 8090 success"
else
    echo "close 8090 fail"
    exit 1
fi
go run . start