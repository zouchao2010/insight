# insight

## build
```shell
docker build -t zouchao2010/insight:0.3.2 .

```

## pull
```shell
docker pull zouchao2010/insight:0.3.2

```
  
## run(创建并运行一个容器，退出时删除容器)
```shell
docker run  --name insight-0.3.2 \
            -h insight-032 \
            -p 3001:3001 \
            -v /data/insight-0.3.2:/var/lib/insight \
            -e TESTNET=1 \
            -it --rm zouchao2010/insight:0.3.2
            
```

## run(创建并运行一个容器，以守护进程方式)
```shell
docker run  --name insight-0.3.2 \
            --restart=always \
            -m 2048m \
            -h insight-032 \
            -p 3001:3001 \
            -v /data/insight-0.3.2:/var/lib/insight \
            -e TESTNET=1 \
            -dt zouchao2010/insight:0.3.2
            
```

## start|stop|restart(已存在的容器)
```shell
docker start|stop|restart insight-0.3.2

```

## exec(使用已运行的容器执行命令)
```shell
docker exec -it insight-0.3.2 /bin/bash

```
