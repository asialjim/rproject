# 该镜像需要依赖的基础镜像
FROM rust:1.79
ADD rproject /rproject
ADD ufw.deb /ufw.deb
RUN dpkg -i *.deb  &&  ufw allow 9090/tcp
# 声明服务运行在8080端口
EXPOSE 9090
# 指定docker容器启动时运行jar包
ENTRYPOINT ["./rproject"]
# 指定维护者的名字
MAINTAINER macrozheng