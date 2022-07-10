<div id="article_content" class="article_content clearfix">
        <link rel="stylesheet" href="https://csdnimg.cn/release/blogv2/dist/mdeditor/css/editerView/ck_htmledit_views-bbac9290cd.css">
                <div id="content_views" class="markdown_views prism-atelier-sulphurpool-light" style="user-select: auto;">
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <path stroke-linecap="round" d="M5,0 0,2.5 5,5z" id="raphael-marker-block" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                    </svg>
                    <p></p>
<div class="toc">
 <h3><a name="t0"></a>Dockerfile配置参数说明、示例</h3>
 <ul><li><a href="#_4" target="">概念简述</a></li><li><a href="#_14" target="">常用配置说明</a></li><li><a href="#DockerfileSpring_Boot_40" target="">实践的Dockerfile示例（应用于Spring Boot项目）</a></li></ul>
</div>
<br> 参考于：
<a href="https://www.runoob.com/docker/docker-dockerfile.html" target="_blank">https://www.runoob.com/docker/docker-dockerfile.html</a>
<br> 整理了在学习、实践中的个人理解，内容说的通俗点，就是记录的自己从不懂到怎么理解的，有时间会时不时更新吧。不正确的还望指正！
<p></p> 
<h1><a name="t1"></a><a id="_4"></a>概念简述</h1> 
<ul><li><strong>docker仓库：</strong> 可以在本地、服务器……，一个存放docker镜像的地方，可以提交镜像、拉取镜像</li><li><strong>docker镜像：</strong> 打包好的一个服务，类似war包、ISO镜像这种概念，就是一个可以在docker环境中运行的服务本体吧</li><li><strong>docker容器：</strong> 镜像运行后生成的本地服务，这个服务的运行环境、范围就是个容器</li></ul> 
<blockquote> 
 <p>举个例子不知道准确不，帮助理解吧，<a href="https://so.csdn.net/so/search?q=docker&amp;spm=1001.2101.3001.7020" target="_blank" class="hl hl-1" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.7020&quot;,&quot;dest&quot;:&quot;https://so.csdn.net/so/search?q=docker&amp;spm=1001.2101.3001.7020&quot;}" data-tit="docker" data-pretit="docker">docker</a>镜像相当于一个系统安装盘，然后在一台电脑上安装系统，安装好系统可以使用的电脑，就是个docker容器，这个容器有自己的环境、运行空间、配置……，和镜像就没有关系了，镜像（系统盘）依然可以生成另一个容器（安装另一台电脑的系统），这些容器（电脑）之间是互相独立，又可以互相联通的</p> 
</blockquote> 
<ul><li><strong>docker build：</strong> 使用Dockerfile配置把项目打包成docker镜像的过程，最后生成的是docker镜像。</li><li><strong>docker run：</strong> 使用docker镜像创建相应的容器运行的过程，最后会生成一个docker容器。</li></ul> 
<h1><a name="t2"></a><a id="_14"></a>常用配置说明</h1> 
<ul><li><strong>FROM：</strong> 定制的镜像都是基于FROM的镜像，例如 <code style="user-select: auto;" onclick="mdcp.copyCode(event)">FROM nginx</code> 就是定制需要的基础镜像，后续的操作都是基于nginx。可以理解为在这个镜像里装了一个“系统”，后面的命令都在这个系统中运行。</li><li><strong>RUN &lt;命令行命令&gt;：</strong> 等同于在终端操作的 shell 命令。在docker build期间执行。</li><li><strong>CMD ["&lt;可执行文件或命令&gt;","","",…]：</strong> 在docker run 时运行。</li><li><strong>ENTRYPOINT ["","","",…]：</strong> 等同于在终端操作的 shell 命令。在docker run 时运行。</li></ul> 
<blockquote> 
 <p>注意：<br> 1、如果 Dockerfile 中如果存在多个 ENTRYPOINT 指令，仅最后一个生效。<br> 2、ENTRYPOINT指令指定的程序。在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。如果运行 docker run 时使用了–entrypoint 选项，此选项的参数会覆盖默认配置</p> 
</blockquote> 
<ul><li><strong>ENV &lt;key&gt;=&lt; value&gt;：</strong> 设置环境变量，定义了环境变量，那么在后续的指令中，就可以使用这个环境变量。</li><li><strong>ARG &lt;key&gt;=&lt; value&gt;：</strong> 设置环境变量，环境变量只作用于Dockerfile内。</li><li><strong>VOLUME ["&lt;路径1&gt;", “&lt;路径2&gt;”…]：</strong> 定义匿名数据卷。在启动容器时忘记挂载数据卷，会自动挂载到匿名卷。避免重要的数据，因容器重启而丢失，这是非常致命的。避免容器不断变大。</li><li><strong>EXPOSE &lt;端口1&gt; [&lt;端口2&gt;…]：</strong> 在运行时使用随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口到一个随机分配的外部端口号。</li><li><strong>USER &lt;用户名&gt;[:&lt;用户组&gt;]：</strong> 用于指定执行后续命令的用户和用户组，这边只是切换后续命令执行的用户（用户和用户组必须提前已经存在）。</li><li><strong>WORKDIR &lt;工作目录路径&gt;：</strong> 指定工作目录。用 WORKDIR 指定的工作目录，会在构建镜像的每一层中都存在。（WORKDIR 指定的工作目录，必须是提前创建好的）。</li><li><strong>LABEL：</strong> 指令将元数据添加到镜像</li><li><strong>COPY [–chown=:] &lt;源路径1&gt;… &lt;目标路径&gt;</strong> 复制指令，从上下文目录中复制文件或者目录到容器里指定路径。<br> &lt;目标路径&gt;：容器内的指定路径，该路径不用事先建好，路径不存在的话，会自动创建。</li><li><strong>ADD</strong><br> ADD 指令和 COPY 的使用格式一致（同样需求下，官方推荐使用 COPY）。功能也类似，不同之处如下：<br> <strong>ADD 的优点：</strong> 在执行 &lt;源文件&gt; 为 tar 压缩文件的话，压缩格式为 gzip, bzip2 以及 xz 的情况下，会自动复制并解压到 &lt;目标路径&gt;。<br> <strong>ADD 的缺点：</strong> 在不解压的前提下，无法复制 tar 压缩文件。会令镜像构建缓存失效，从而可能会令镜像构建变得比较缓慢。具体是否使用，可以根据是否需要自动解压来决定。</li></ul> 
<h1><a name="t3"></a><a id="DockerfileSpring_Boot_40"></a>实践的Dockerfile示例（应用于Spring Boot项目）</h1> 
<p>按照自己实际需要书写Dockerfile即可，Vue项目可以使用nginx镜像作为基础，然后将nginx配置和打包的vue文件放到镜像中就可以了，这里主要是为了体现结构、用法。</p> 
<pre data-index="0" class="prettyprint" style="user-select: auto;"><code class="prism language-bash has-numbering" onclick="mdcp.copyCode(event)" style="position: unset; user-select: auto;"><span class="token comment"># 使用标准openjdk环境</span>
FROM openjdk:latest

<span class="token comment"># dockerfile build 环境变量 按需使用</span>
ARG <span class="token assign-left variable">NAME</span><span class="token operator">=</span>test-docker-image
ARG <span class="token assign-left variable">VERSION</span><span class="token operator">=</span><span class="token number">0.0</span>.1
ARG <span class="token assign-left variable">PROFILES</span><span class="token operator">=</span>test
<span class="token comment"># 项目打包后的包名</span>
ENV <span class="token assign-left variable">JAR_FILE</span><span class="token operator">=</span>test-server-0.0.1-SNAPSHOT.jar
<span class="token comment"># 项目服务目录</span>
ENV <span class="token assign-left variable">PROJECT_DIR</span><span class="token operator">=</span>project
<span class="token comment"># 服务根目录</span>
ENV <span class="token assign-left variable">ROOT_DIR</span><span class="token operator">=</span>/home/testserver

<span class="token comment">#在容器运行时声明一个 volume, 在容器中创建目录</span>
VOLUME <span class="token variable">$ROOT_DIR</span>
VOLUME /usr/local/src/soft/template

<span class="token comment"># 添加镜像属性</span>
LABEL <span class="token assign-left variable">name</span><span class="token operator">=</span><span class="token variable">$NAME</span> <span class="token assign-left variable">version</span><span class="token operator">=</span><span class="token variable">$VERSION</span> <span class="token assign-left variable">email</span><span class="token operator">=</span><span class="token string">"j1y1p1@hotmail.com"</span>

<span class="token comment"># maven 构建项目 先构建项目jar包，然后用copy或add将jar包导入镜像，是两步操作</span>

<span class="token comment"># 导入 JAR 到镜像中的指定目录</span>
COPY target/<span class="token variable">$JAR_FILE</span> <span class="token variable">$ROOT_DIR</span>

<span class="token comment"># Create a script 由于ENTRYPOINT无法使用dockerfile中定义的环境变量</span>
<span class="token comment"># 所以需要按照指定的环境变量生成运行脚本，并输出到文件，之后ENTRYPOINT运行脚本文件就行了</span>
RUN <span class="token builtin class-name">echo</span> <span class="token string">"java -Xms1024m -Xmx1024m -jar <span class="token variable">$ROOT_DIR</span>/<span class="token variable">$JAR_FILE</span> --spring.profiles.active=<span class="token variable">$PROFILES</span>"</span> <span class="token operator">&gt;</span> /run_module.sh

<span class="token comment"># run 执行命令</span>
ENTRYPOINT <span class="token punctuation">[</span><span class="token string">"/bin/bash"</span>, <span class="token string">"/run_module.sh"</span><span class="token punctuation">]</span>

<span class="token comment"># 指定默认暴露端口, 这样在容器运行时可以知道应该映射哪些端口</span>
EXPOSE <span class="token number">8888</span>

        </div>
