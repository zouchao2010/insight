# insight

## build
```shell
docker build -t zouchao2010/insight .

```

## pull
```shell
docker pull zouchao2010/insight

```
  
## run(创建并运行一个容器，退出时删除容器)
```shell
docker run  --name insight \
            -h insight \
            -p 3001:3001 \
            -v /data/insight:/var/lib/insight \
            -e TESTNET=1 \
            -it --rm zouchao2010/insight
            
```

## run(创建并运行一个容器，以守护进程方式)
```shell
docker run  --name insight \
            --restart=always \
            -m 2048m \
            -h insight \
            -p 3001:3001 \
            -v /data/insight:/var/lib/insight \
            -e TESTNET=1 \
            -dt zouchao2010/insight
            
```

## start|stop|restart(已存在的容器)
```shell
docker start|stop|restart insight

```

## exec(使用已运行的容器执行命令)
```shell
docker exec -it insight /bin/bash

```
