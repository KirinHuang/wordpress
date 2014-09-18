#!/bin/sh

if [ $# -eq 0 ]; then
    echo "
    usage: wordpress stop/start
    "
else
    if [ "$1" == "start"  ]; then
        start
    else
        stop
    fi
fi

#wordpress CONTAINERID
wordpress=$(docker ps -a | grep -i wordpress | awk '{print $1}')

start()
{
    #delete CONTAINER
    if [ "$wordpress" ]; then
        echo "stop first!"
        stop
        echo "stop finished!"
    else
        docker run -d --name wordpress -p 80:80 -i -t kirinhuang/wordpress
    fi
}

stop()
{
    #delete CONTAINER
    if [ "$wordpress" ]; then
        docker rm -f $wordpress
        if [ $? -eq 0 ]; then
            echo "delete CONTAINER $wordpress success"
        else
            echo "delete CONTAINER $wordpress failed"
        fi
    else
        echo "wordpress is not running";
    fi
}
