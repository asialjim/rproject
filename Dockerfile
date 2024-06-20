# 该镜像需要依赖的基础镜像
FROM ubuntu
RUN apt update && apt upgrade -y   && apt install libssl-dev  &&  apt install -y -q build-essential curl
# 将当前目录下的jar包复制到docker容器的/目录下
ADD rproject /rproject
# 声明服务运行在8080端口
EXPOSE 9090
# 指定docker容器启动时运行jar包
ENTRYPOINT ["./rproject"]
# 指定维护者的名字
MAINTAINER macrozheng