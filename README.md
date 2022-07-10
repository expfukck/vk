Dockerfile配置参数说明、示例
概念简述
常用配置说明
实践的Dockerfile示例（应用于Spring Boot项目）

参考于： https://www.runoob.com/docker/docker-dockerfile.html
整理了在学习、实践中的个人理解，内容说的通俗点，就是记录的自己从不懂到怎么理解的，有时间会时不时更新吧。不正确的还望指正！
概念简述
docker仓库： 可以在本地、服务器……，一个存放docker镜像的地方，可以提交镜像、拉取镜像
docker镜像： 打包好的一个服务，类似war包、ISO镜像这种概念，就是一个可以在docker环境中运行的服务本体吧
docker容器： 镜像运行后生成的本地服务，这个服务的运行环境、范围就是个容器
举个例子不知道准确不，帮助理解吧，docker镜像相当于一个系统安装盘，然后在一台电脑上安装系统，安装好系统可以使用的电脑，就是个docker容器，这个容器有自己的环境、运行空间、配置……，和镜像就没有关系了，镜像（系统盘）依然可以生成另一个容器（安装另一台电脑的系统），这些容器（电脑）之间是互相独立，又可以互相联通的

docker build： 使用Dockerfile配置把项目打包成docker镜像的过程，最后生成的是docker镜像。
docker run： 使用docker镜像创建相应的容器运行的过程，最后会生成一个docker容器。
常用配置说明
FROM： 定制的镜像都是基于FROM的镜像，例如 FROM nginx 就是定制需要的基础镜像，后续的操作都是基于nginx。可以理解为在这个镜像里装了一个“系统”，后面的命令都在这个系统中运行。
RUN <命令行命令>： 等同于在终端操作的 shell 命令。在docker build期间执行。
CMD ["<可执行文件或命令>","","",…]： 在docker run 时运行。
ENTRYPOINT ["","","",…]： 等同于在终端操作的 shell 命令。在docker run 时运行。
注意：
1、如果 Dockerfile 中如果存在多个 ENTRYPOINT 指令，仅最后一个生效。
2、ENTRYPOINT指令指定的程序。在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。如果运行 docker run 时使用了–entrypoint 选项，此选项的参数会覆盖默认配置

ENV <key>=< value>： 设置环境变量，定义了环境变量，那么在后续的指令中，就可以使用这个环境变量。
ARG <key>=< value>： 设置环境变量，环境变量只作用于Dockerfile内。
VOLUME ["<路径1>", “<路径2>”…]： 定义匿名数据卷。在启动容器时忘记挂载数据卷，会自动挂载到匿名卷。避免重要的数据，因容器重启而丢失，这是非常致命的。避免容器不断变大。
EXPOSE <端口1> [<端口2>…]： 在运行时使用随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口到一个随机分配的外部端口号。
USER <用户名>[:<用户组>]： 用于指定执行后续命令的用户和用户组，这边只是切换后续命令执行的用户（用户和用户组必须提前已经存在）。
WORKDIR <工作目录路径>： 指定工作目录。用 WORKDIR 指定的工作目录，会在构建镜像的每一层中都存在。（WORKDIR 指定的工作目录，必须是提前创建好的）。
LABEL： 指令将元数据添加到镜像
COPY [–chown=:] <源路径1>… <目标路径> 复制指令，从上下文目录中复制文件或者目录到容器里指定路径。
<目标路径>：容器内的指定路径，该路径不用事先建好，路径不存在的话，会自动创建。
ADD
ADD 指令和 COPY 的使用格式一致（同样需求下，官方推荐使用 COPY）。功能也类似，不同之处如下：
ADD 的优点： 在执行 <源文件> 为 tar 压缩文件的话，压缩格式为 gzip, bzip2 以及 xz 的情况下，会自动复制并解压到 <目标路径>。
ADD 的缺点： 在不解压的前提下，无法复制 tar 压缩文件。会令镜像构建缓存失效，从而可能会令镜像构建变得比较缓慢。具体是否使用，可以根据是否需要自动解压来决定。
实践的Dockerfile示例（应用于Spring Boot项目）
按照自己实际需要书写Dockerfile即可，Vue项目可以使用nginx镜像作为基础，然后将nginx配置和打包的vue文件放到镜像中就可以了，这里主要是为了体现结构、用法。

# 使用标准openjdk环境
FROM openjdk:latest

# dockerfile build 环境变量 按需使用
ARG NAME=test-docker-image
ARG VERSION=0.0.1
ARG PROFILES=test
# 项目打包后的包名
ENV JAR_FILE=test-server-0.0.1-SNAPSHOT.jar
# 项目服务目录
ENV PROJECT_DIR=project
# 服务根目录
ENV ROOT_DIR=/home/testserver

#在容器运行时声明一个 volume, 在容器中创建目录
VOLUME $ROOT_DIR
VOLUME /usr/local/src/soft/template

# 添加镜像属性
LABEL name=$NAME version=$VERSION email="j1y1p1@hotmail.com"

# maven 构建项目 先构建项目jar包，然后用copy或add将jar包导入镜像，是两步操作

# 导入 JAR 到镜像中的指定目录
COPY target/$JAR_FILE $ROOT_DIR

# Create a script 由于ENTRYPOINT无法使用dockerfile中定义的环境变量
# 所以需要按照指定的环境变量生成运行脚本，并输出到文件，之后ENTRYPOINT运行脚本文件就行了
RUN echo "java -Xms1024m -Xmx1024m -jar $ROOT_DIR/$JAR_FILE --spring.profiles.active=$PROFILES" > /run_module.sh

# run 执行命令
ENTRYPOINT ["/bin/bash", "/run_module.sh"]

# 指定默认暴露端口, 这样在容器运行时可以知道应该映射哪些端口
EXPOSE 8888
