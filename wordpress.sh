#!/bin/sh

start_wordpress()
{
    #delete CONTAINER
    if [ "$wordpress" ]; then
        echo "stop first!"
    else
        docker run -d --name wordpress -p 80:80 -i -t kirinhuang/wordpress
    fi
}

stop_wordpress()
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

#wordpress CONTAINERID
wordpress=$(docker ps -a | grep -i wordpress | awk '{print $1}')

if [ $# -eq 0 ]; then
    echo "
    usage: wordpress stop/start
    "
else
    if [ "$1" = "start" ]; then
        start_wordpress;
    else
        stop_wordpress;
    fi
fi
