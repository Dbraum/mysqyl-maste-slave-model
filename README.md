## ab-mysql with Dockerize

***

### 简介

> `ab-mysql`用docker官方推荐的镜像`mysql:5.7.12`作为基础镜像，让mysql部署不再成为开发者的噩梦，只需一个指令即让mysql完美运行，并且支持mysql主从模式 ^_^.

### 特色

- mysql一键部署
- mysql高可用配置
- mysql数据映射：映射mysql数据文件到宿主机
- mysql优化: 提供优化好的my.cnf文件，高并发
- mysql初始化某个数据库及其数据：提供sql文件即可
- mysql实时dump：定时备份好搭档
- 支持实时日志查阅
- 支持本地GUI远程连接操作

### 项目结构

```tree
.
├── LICENSE
├── README.md
├── data
│   └── ...mysql数据库文件
├── logs
│   └── mysqld.log
├── conf
│   ├── master-slave
│   │   └── my.cnf
│   └── my.cnf
├── sql
│   ├── master
│   │   ├── appbricks_init.sql
│   │   └── create_repl.sql
│   ├── single
│   │   └── appbricks_init.sql
│   └── slave
│       ├── appbricks_init.sql
│       └── change_repl.sql
├── dump-mysql-master.sh
├── dump-mysql-single.sh
├── dump-mysql-slave.sh
├── logs-mysql-master.sh
├── logs-mysql-single.sh
├── logs-mysql-slave.sh
├── start-mysql-master.sh
├── start-mysql-single.sh
├── start-mysql-slave.sh
├── stop-mysql-master.sh
├── stop-mysql-single.sh
└── stop-mysql-slave.sh
```

### 快速开始

##### 克隆`ab-mysql`项目
> 任意选择一种克隆方式，如果没有外部网络也可以下载好代码自行上传到服务器。

```bash
$ cd {your_project}
$ git clone https://git.oschina.net/gdesign/ab-mysql.git
```

##### 修改`ab-mysql`初始化密码
> `ab-mysql`初始化密码为`my-secret-ab`，修改它只需根据当前模式(master、slave)选择对应start脚本，e.g. start-mysql-master.sh文件，定位到如下内容修改即可：

```sh
...
-e "MYSQL_ROOT_PASSWORD=my-secret-ab" \
...

```

##### `ab-mysql`master-slave模式设置
> 部署mysql主从模式，只需编辑`sql/slave/change_repl.sql`脚本并定位到master_host='104.131.143.102'如下位置修改真实的master地址即可：

```sh
...
# 千万不要空格
master_host='104.131.143.102'
...
```

##### 启动`ab-mysql`服务

> 选择好启动模式，执行如下指令：

- 单机模式

	```bash
	$ cd {your_project}
	$ ./start-mysql-single.sh
	```

- 集群模式（`需要多个节点配合启动，必须自行规划好master、slave节点`）

	- 启动master节点

	```bash
	$ cd {your_project}
	$ ./start-mysql-master.sh
	```
	- 启动slave节点

	```bash
	$ cd {your_project}
	$ ./start-mysql-slave.sh
	```


##### 停止`ab-mysql`服务


> 选择好停止模式，执行如下指令：

- 单机模式

	```bash
	$ cd {your_project}
	$ ./stop-mysql-single.sh
	```

- 集群模式（`需要多个节点配合停止，必须自行规划好master、slave节点`）

	- 停止master节点

	```bash
	$ cd {your_project}
	$ ./stop-mysql-master.sh
	```
	- 停止slave节点

	```bash
	$ cd {your_project}
	$ ./stop-mysql-slave.sh
	```

##### 查阅`ab-mysql`实时日志

> 查阅`ab-mysql`实时日志有两种方式，只需执行如下指令（三种选一）即可：

> ps: 根据当前节点模式选择执行脚本:

- docker logs -f mysql-single (mysql-master、mysql-slave)

- ${your_project}/logs-mysql-single.sh (logs-mysql-master、logs-mysql-slave.sh)

- more ${your_project}/logs/mysqld.log

##### 管理`ab-mysql`数据库文件
> `ab-mysql`启动时已经把mysql数据库文件映射到宿主机上，e.g. ${your_project}/data

```bash
$ cd {your_project}
$ ls {your_project}/data
```

##### 备份`ab-mysql`数据库
> 建议生产环境要经常备份数据，当然`ab-mysql`已经考虑到了此运维需求，只需要执行`dump-mysql-xxx.sh`脚本，在`${your_project}/dump/${当前日期}/`目录下即可看到`all-databases.sql`整库备份文件。

> ps: 根据当前节点模式选择执行脚本:

```bash
$ cd {your_project}
$ {your_project}/dump-mysql-single.sh (dump-mysql-matser.sh、dump-mysql-slave.sh)
```

### 参考

- [https://www.centos.bz/2014/12/ha-load-balance-mysql-master-slave-architecture/](https://www.centos.bz/2014/12/ha-load-balance-mysql-master-slave-architecture)

- [http://blog.csdn.net/hguisu/article/details/7325124#t0](http://blog.csdn.net/hguisu/article/details/7325124#t0)

- [https://hub.docker.com/r/_/mysql/](https://hub.docker.com/r/_/mysql/)

- [http://www.innomysql.com/article/21730.html](http://www.innomysql.com/article/21730.html)

- [http://blog.5ibc.net/p/77184.html](http://blog.5ibc.net/p/77184.html)
