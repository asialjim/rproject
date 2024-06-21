# 该镜像需要依赖的基础镜像
FROM rust:1.79
RUN cp -rf /etc/apt/sources.list /etc/apt/sources.list.bak && url=https://mirrors.aliyun.com && sed -i "s@http.*\(com\|org\|cn\)@$url@g" /etc/apt/sources.list
RUN apt update &&  apt install -y ufw  &&  ufw allow 9090
# 将当前目录下的jar包复制到docker容器的/目录下
ADD rproject /rproject
# 声明服务运行在8080端口
EXPOSE 9090
# 指定docker容器启动时运行jar包
ENTRYPOINT ["./rproject"]
# 指定维护者的名字
MAINTAINER macrozheng