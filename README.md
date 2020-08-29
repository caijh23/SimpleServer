# SimpleServer
一个简单的httpServer，学习用

### Build
```
make
make clean
```

### Run
```
./httpserver [port] [subReactorNum] [workerThreadNum]
```

线程模型：
主IO线程负责Accept,之后将tcp连接挂到多个从Reactor中的一个（Round-Robin）负责读写fd,计算任务由计算线程池负责

![alt model](./pic/model.png)

### 主要学习点：
- 1.使用Reactor分发方案替代用线程池处理一切任务
- 2.学习c++11 thread库相关的一些知识，socket编程、IO复用等等