# 该镜像需要依赖的基础镜像
FROM rust:1.79
RUN cp -rf /etc/apt/sources.list /etc/apt/sources.list.bak && tee /etc/apt/sources.list <<-'EOF'
deb http://mirrors.aliyun.com/debian/ buster main contrib non-free
deb-src http://mirrors.aliyun.com/debian/ buster main contrib non-free
deb http://mirrors.aliyun.com/debian-security/ buster/updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian-security/ buster/updates main contrib non-free
deb http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free
deb http://mirrors.aliyun.com/debian/ buster-backports main contrib non-free
deb-src http://mirrors.aliyun.com/debian/ buster-backports main contrib non-free
EOF
RUN apt update &&  apt install -y ufw  &&  ufw allow 9090
# 将当前目录下的jar包复制到docker容器的/目录下
ADD rproject /rproject
# 声明服务运行在8080端口
EXPOSE 9090
# 指定docker容器启动时运行jar包
ENTRYPOINT ["./rproject"]
# 指定维护者的名字
MAINTAINER macrozheng