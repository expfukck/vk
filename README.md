<main>
<script type="text/javascript">
    function getQueryString(name) {   
      var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象  
      var r = window.location.search.substr(1).match(reg);  //匹配目标参数
      if( r != null ) return decodeURIComponent( r[2] ); return '';   
    }
    function stripscript(s){ 
      var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]") 
      var rs = ""; 
      for (var i = 0; i < s.length; i++) { 
        rs = rs+s.substr(i, 1).replace(pattern, ''); 
      } 
      return rs; 
    }
    var blogHotWords = stripscript(getQueryString('utm_term')).length > 1 ? stripscript(getQueryString('utm_term')) : ''
</script>
<div class="blog-content-box">
        <div class="article-header-box">
        <div class="article-header">
            <div class="article-title-box">
                <h1 class="title-article" id="articleContentId">Dockerfile配置参数说明、示例</h1>
            </div>
            <div class="article-info-box">
                <div class="article-bar-top">
                    <img class="article-type-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/original.png" alt="">
                    <div class="bar-content">
                    <a class="follow-nickName " href="https://blog.csdn.net/qq_33598419" target="_blank" rel="noopener">Aubrey-J</a>
                    <img class="article-time-img article-heard-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newCurrentTime2.png" alt="">
                    <span class="time">于&nbsp;2020-08-14 14:49:19&nbsp;发布</span>
                    <img class="article-read-img article-heard-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes2.png" alt="">
                    <span class="read-count">1128</span>
                    
                    </div>
                </div>
                <div class="blog-tags-box">
                    <div class="tags-box artic-tag-box">
                            <span class="label">分类专栏：</span>
                                <a class="tag-link" href="https://blog.csdn.net/qq_33598419/category_9013891.html" target="_blank" rel="noopener">学习笔记</a>
                                <a class="tag-link" href="https://blog.csdn.net/qq_33598419/category_10298464.html" target="_blank" rel="noopener">Docker</a>
                            <span class="label">文章标签：</span>
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_626&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4223&quot;,&quot;strategy&quot;:&quot;docker&quot;,&quot;ab&quot;:&quot;new&quot;}" class="tag-link" href="https://so.csdn.net/so/search/s.do?q=docker&amp;t=blog&amp;o=vip&amp;s=&amp;l=&amp;f=&amp;viparticle=" target="_blank" rel="noopener">docker</a>
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_626&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4223&quot;,&quot;strategy&quot;:&quot;运维&quot;,&quot;ab&quot;:&quot;new&quot;}" class="tag-link" href="https://so.csdn.net/so/search/s.do?q=%E8%BF%90%E7%BB%B4&amp;t=blog&amp;o=vip&amp;s=&amp;l=&amp;f=&amp;viparticle=" target="_blank" rel="noopener">运维</a>
                    </div>
                </div>
                <div class="slide-content-box">
                    <div class="article-copyright">
                        <div class="creativecommons">
                            版权声明：本文为博主原创文章，遵循<a href="http://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener"> CC 4.0 BY-SA </a>版权协议，转载请附上原文出处链接和本声明。
                        </div>
                        <div class="article-source-link">
                            本文链接：<a href="https://blog.csdn.net/qq_33598419/article/details/107612891" target="_blank">https://blog.csdn.net/qq_33598419/article/details/107612891</a>
                        </div>
                    </div>
                </div>
                <div class="operating">
                    <a class="href-article-edit slide-toggle">版权</a>
                </div>
            </div>
        </div>
    </div>
    
        <div id="blogColumnPayAdvert">
            <div class="column-group">
                <div class="column-group-item column-group0 ">
                    <div class="item-l">
                        <a class="item-target" href="https://blog.csdn.net/qq_33598419/category_9013891.html" target="_blank" title="学习笔记" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.6332&quot;}">
                            <img class="item-target" src="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="">
                            <span class="title item-target">
                                <span>
                                <span class="tit">学习笔记</span>
                                    <span class="dec more">同时被 2 个专栏收录<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/newArrowDown1White.png" alt=""></span>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="item-m">
                        <span>23 篇文章</span>
                        <span>3 订阅</span>
                    </div>
                    <div class="item-r">
                            <a class="item-target article-column-bt articleColumnFreeBt" data-id="9013891">订阅专栏</a>
                    </div>
                </div>
                <div class="column-group-item column-group1 ">
                    <div class="item-l">
                        <a class="item-target" href="https://blog.csdn.net/qq_33598419/category_10298464.html" target="_blank" title="Docker" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.6332&quot;}">
                            <img class="item-target" src="https://img-blog.csdnimg.cn/20201014180756925.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="">
                            <span class="title item-target">
                                <span>
                                <span class="tit">Docker</span>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="item-m">
                        <span>5 篇文章</span>
                        <span>0 订阅</span>
                    </div>
                    <div class="item-r">
                            <a class="item-target article-column-bt articleColumnFreeBt" data-id="10298464">订阅专栏</a>
                    </div>
                </div>
            </div>
        </div>
    <article class="baidu_pl">
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
<div class="hljs-button {2}" data-title="免登录复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4334&quot;}" onclick="hljs.copyCode(event);setTimeout(function(){$('.hljs-button').attr('data-title', '免登录复制');},3500);"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li><li style="color: rgb(153, 153, 153);">2</li><li style="color: rgb(153, 153, 153);">3</li><li style="color: rgb(153, 153, 153);">4</li><li style="color: rgb(153, 153, 153);">5</li><li style="color: rgb(153, 153, 153);">6</li><li style="color: rgb(153, 153, 153);">7</li><li style="color: rgb(153, 153, 153);">8</li><li style="color: rgb(153, 153, 153);">9</li><li style="color: rgb(153, 153, 153);">10</li><li style="color: rgb(153, 153, 153);">11</li><li style="color: rgb(153, 153, 153);">12</li><li style="color: rgb(153, 153, 153);">13</li><li style="color: rgb(153, 153, 153);">14</li><li style="color: rgb(153, 153, 153);">15</li><li style="color: rgb(153, 153, 153);">16</li><li style="color: rgb(153, 153, 153);">17</li><li style="color: rgb(153, 153, 153);">18</li><li style="color: rgb(153, 153, 153);">19</li><li style="color: rgb(153, 153, 153);">20</li><li style="color: rgb(153, 153, 153);">21</li><li style="color: rgb(153, 153, 153);">22</li><li style="color: rgb(153, 153, 153);">23</li><li style="color: rgb(153, 153, 153);">24</li><li style="color: rgb(153, 153, 153);">25</li><li style="color: rgb(153, 153, 153);">26</li><li style="color: rgb(153, 153, 153);">27</li><li style="color: rgb(153, 153, 153);">28</li><li style="color: rgb(153, 153, 153);">29</li><li style="color: rgb(153, 153, 153);">30</li><li style="color: rgb(153, 153, 153);">31</li><li style="color: rgb(153, 153, 153);">32</li><li style="color: rgb(153, 153, 153);">33</li><li style="color: rgb(153, 153, 153);">34</li><li style="color: rgb(153, 153, 153);">35</li></ul></pre>
                </div><div><div></div></div>
                <link href="https://csdnimg.cn/release/blogv2/dist/mdeditor/css/editerView/markdown_views-3fd7f7a902.css" rel="stylesheet">
                <link href="https://csdnimg.cn/release/blogv2/dist/mdeditor/css/style-49037e4d27.css" rel="stylesheet">
        </div>
        
    </article>
  <script>
  $(function() {
    setTimeout(function () {
      var mathcodeList = document.querySelectorAll('.htmledit_views img.mathcode');
      if (mathcodeList.length > 0) {
        var testImg = new Image();
        testImg.onerror = function () {
          mathcodeList.forEach(function (item) {
            $(item).before('<span class="img-codecogs">\\(' + item.alt + '\\)</span>');
            $(item).remove();
          })
          MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
        }
        testImg.src = mathcodeList[0].src;
      }
    }, 1000)
  })
  </script>
<br><div class="blog-content-box" id="recommendSwitch" style="text-align: right;"><input type="checkbox" id="toggle-button"> <label for="toggle-button" class="button-label"> <span class="circle"></span> <span class="text on">&nbsp;</span> <span class="text off">&nbsp;</span> </label><p style="margin-top: 5px; font-size: 13px;">显示推荐内容</p></div></div>
<div class="more-toolbox-new" id="toolBarBox">
    <div class="left-toolbox" style="position: relative; z-index: 999; left: 0px; bottom: 0px; width: 1648px;">
        <div class="toolbox-left">
            <div class="profile-box"><a class="profile-href" target="_blank" href="https://blog.csdn.net/qq_33598419"><img class="profile-img" src="https://profile.csdnimg.cn/D/D/2/3_qq_33598419"><span class="profile-name">Aubrey-J</span></a></div>
            <div class="profile-attend">
                    <a class="tool-attend tool-bt-button tool-bt-attend" href="javascript:;">关注</a>
                <a class="tool-item-follow active-animation" style="display:none;">关注</a>
            </div>
        </div>
        <div class="toolbox-middle">
        <ul class="toolbox-list">
            <li class="tool-item tool-item-size tool-active is-like" id="is-like">
            <a class="tool-item-href">
                <img style="display:none;" id="is-like-imgactive-animation-like" class="animation-dom active-animation" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarThumbUpactive.png" alt="">
                <img class="isactive" style="display:none" id="is-like-imgactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newHeart2021Active.png" alt="">
                <img class="isdefault" style="display:block" id="is-like-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newHeart2021White.png" alt="">  
                <span id="spanCount" class="count ">
                        2
                </span>
            </a>
            <div class="tool-hover-tip"><span class="text space">点赞</span></div>
            </li>
            <li class="tool-item tool-item-size tool-active is-unlike" id="is-unlike">
            <a class="tool-item-href">
                <img class="isactive" style="margin-right:0px;display:none" id="is-unlike-imgactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newUnHeart2021Active.png" alt="">
                <img class="isdefault" style="margin-right:0px;display:block" id="is-unlike-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newUnHeart2021White.png" alt="">
                <span id="unlikeCount" class="count "></span>
            </a>
            <div class="tool-hover-tip"><span class="text space">踩</span></div>
            </li>
            <li class="tool-item tool-item-size tool-active tool-item-comment">
            <a class="tool-item-href" href="#commentBox" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.7009&quot;}">
                <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newComment2021White.png" alt="">
                <span class="count">
                    0
                </span>
            </a>
            <div class="tool-hover-tip"><span class="text space">评论</span></div>
            </li>
            <li class="tool-item tool-item-size tool-active is-collection ">
            <a class="tool-item-href" href="javascript:;" data-report-click="{&quot;mod&quot;:&quot;popu_824&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4130&quot;,&quot;ab&quot;:&quot;new&quot;}">
                <img style="display:none" id="is-collection-img-collection" class="animation-dom active-animation" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollectionActive.png" alt="">
                <img class="isdefault" id="is-collection-img" style="display:block" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newCollectWhite.png" alt="">
                <img class="isactive" id="is-collection-imgactive" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newCollectActive.png" alt="">
                <span class="count get-collection " id="get-collection">
                    4
                </span>
            </a>
            <div class="tool-hover-tip"><span class="text space">收藏</span></div>
            </li>
            <li class="tool-item tool-item-size tool-active tool-item-reward">
                <a class="tool-item-href" href="javascript:;" data-report-click="{&quot;mod&quot;:&quot;popu_830&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4237&quot;,&quot;dest&quot;:&quot;&quot;,&quot;ab&quot;:&quot;new&quot;}">
                <img class="isdefault reward-bt" id="rewardBtNew" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newRewardWhite.png" alt="打赏">
                <span class="count"></span>
                </a>
                <div class="tool-hover-tip"><span class="text space">打赏</span></div>
            </li>
            <li class="tool-item tool-item-bar">
            </li>
            <li class="tool-item tool-item-size tool-active tool-QRcode" id="tool-share">
                <a class="tool-item-href" href="javascript:;" data-report-click="{&quot;mod&quot;:&quot;1582594662_002&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4129&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/newShareWhite.png" alt="">
                </a>
                <div class="QRcode" id="tool-QRcode">
                    <p class="title">
                    扫一扫，分享内容
                    </p>
                    <div id="shareCode"></div>
                    <a id="copyPosterUrl" class="url" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.7493&quot;}" data-report-view="{&quot;spm&quot;:&quot;1001.2101.3001.7493&quot;}">点击复制链接</a>
                </div>
            </li>
        </ul>
        </div>
        <div class="toolbox-right">
                <div class="tool-directory">
                    <a class="bt-columnlist-show" data-id="9013891" data-free="true" data-subscribe="false" data-title="学习笔记" data-img="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" data-url="https://blog.csdn.net/qq_33598419/category_9013891.html" data-sum="23" data-people="3" data-price="0" data-oldprice="0" data-join="false" data-studyvip="false" data-studysubscribe="false" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.6334&quot;,&quot;extend1&quot;:&quot;专栏目录&quot;}">专栏目录</a>
                </div>
        </div>
    </div>  
</div>
<script type="text/javascript" crossorigin="" src="https://csdnimg.cn/release/phoenix/production/qrcode-7c90a92189.min.js"></script>
<script src="//g.csdnimg.cn/??sharewx/1.2.1/sharewx.js" type="text/javascript"></script>
<script type="text/javascript" crossorigin="" src="https://g.csdnimg.cn/user-login/3.0.1/user-login.js"></script>
<script type="text/javascript" crossorigin="" src="https://g.csdnimg.cn/collection-box/2.1.0/collection-box.js"></script>
                
            <script src="https://csdnimg.cn/release/blogv2/dist/components/js/pc_wap_commontools-60a48feb57.min.js" type="text/javascript" async=""></script>
            
<a id="commentBox" name="commentBox"></a>
<div id="pcCommentBox" class="comment-box comment-box-new unlogin-comment-box-new"><button class="comment-hidden-text" style="display:none">COPY BUTTON</button>
	<div class="unlogin-comment-model">
			<span class="unlogin-comment-tit">参与评论</span>
			<span class="unlogin-comment-text">您还未登录，请先</span>
			<span class="unlogin-comment-bt">登录</span>
			<span class="unlogin-comment-text">后发表或查看评论</span>
	</div>
</div>
            <div class="recommend-box insert-baidu-box recommend-box-style " style="display: none;">
                <div class="recommend-item-box clearfix no-index" style="display:none"></div><div class="recommend-item-box baiduSearch clearfix" data-type="blog" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-112093232-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.1&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/SunlightDen/article/details/112093232&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;0&quot;}">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a class="tit" href="https://blog.csdn.net/SunlightDen/article/details/112093232" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-112093232-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.1&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/SunlightDen/article/details/112093232&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;0&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-112093232-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.1&amp;utm_relevant_index=1">					                <div class="left ellipsis-online ellipsis-online-1">...的<em>参数</em>详解_进击的大菠萝的博客_<em>dockerfile</em><em>参数</em></div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">6-7</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/SunlightDen/article/details/112093232" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-112093232-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.1&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/SunlightDen/article/details/112093232&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;0&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-112093232-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.1&amp;utm_relevant_index=1">                      <div class="desc ellipsis-online ellipsis-online-1"><em>DockerFile</em> 的<em>参数</em>详解 FORM 功能为指定基础镜像,并且必须是第一条指令。 如果不以任何镜像为基础,那么写法为:FROM scratch。 同时意味着接下来所写的指令将作为镜像的第一层开始 语法: () FROM &lt;image&gt; FROM &lt;image&gt; : &lt;tag&gt; ...</div>                    </a>                  </div>                </div>              </div><div class="recommend-item-box baiduSearch clearfix" data-type="blog" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-121692938-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010389826/article/details/121692938&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;1&quot;}">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a class="tit" href="https://blog.csdn.net/u010389826/article/details/121692938" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-121692938-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010389826/article/details/121692938&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;1&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-121692938-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.2&amp;utm_relevant_index=2">					                <div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em>命令<em>参数</em>_记忆机器的博客_<em>dockerfile</em> 传参</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">6-28</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/u010389826/article/details/121692938" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-121692938-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;0\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010389826/article/details/121692938&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;1&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-121692938-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.2&amp;utm_relevant_index=2">                      <div class="desc ellipsis-online ellipsis-online-1"><em>Dockerfile</em>命令<em>参数</em> <em>Docker</em>通过读取<em>Dockerfile</em>文件的命令生成镜像。<em>Dockerfile</em>是一个文本文件,包含用户构建镜像的所需要的全部命令。执行<em>docker</em> build后,<em>docker</em>通过一系列命令行操作自动构建镜像。本文描述<em>Dockerfile</em>中的命令。</div>                    </a>                  </div>                </div>              </div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/weixin_46309058/article/details/119538189" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.2&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-2-119538189-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_46309058/article/details/119538189&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/weixin_46309058/article/details/119538189" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.2&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-2-119538189-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_46309058/article/details/119538189&quot;}" data-report-query="spm=1001.2101.3001.6650.2&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=3">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em> <em>配置</em>指令详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/weixin_46309058" target="_blank" data-report-query="spm=1001.2101.3001.6650.2&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=3"><span class="blog-title">我有两颗星星</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">08-10</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1863
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/weixin_46309058/article/details/119538189" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.2&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-2-119538189-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_46309058/article/details/119538189&quot;}" data-report-query="spm=1001.2101.3001.6650.2&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-119538189-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=3">
				<div class="desc ellipsis-online ellipsis-online-1">FROM

功能为指定基础镜像，并且必须是第一条指令。

如果不以任何镜像为基础，那么写法为：FROMscratch

同时意味着接下来所写的指令作为镜像的第一层开始

语法：


FROM &lt;image&gt;

FROM &lt;image&gt;:&lt;tag&gt;

FROM &lt;image&gt;:&lt;digest&gt;


三种写法，其中&lt;tag&gt;和&lt;digest&gt;是可选项，如果没有那么默认值为latest

例如：


FRPM centos:7..</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/asenseof/article/details/107891008" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.3&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-3-107891008-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/asenseof/article/details/107891008&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/asenseof/article/details/107891008" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.3&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-3-107891008-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/asenseof/article/details/107891008&quot;}" data-report-query="spm=1001.2101.3001.6650.3&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=4">
					<div class="left ellipsis-online ellipsis-online-1"><em>Docker</em> file <em>参数</em>详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/asenseof" target="_blank" data-report-query="spm=1001.2101.3001.6650.3&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=4"><span class="blog-title">一种感觉的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">08-09</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					696
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/asenseof/article/details/107891008" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.3&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-3-107891008-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/asenseof/article/details/107891008&quot;}" data-report-query="spm=1001.2101.3001.6650.3&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-3-107891008-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=4">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Docker</em> file  <em>参数</em>详解1.<em>参数</em>2.<em>示例</em>
<em>Dockerfile</em> 由一行行命令语句组成，并且支持已 # 开头的注释行。
一般而言，<em>Dockerfile</em> 的内容分为四个部分：
基础镜像信息<em>、</em>
维护者信息<em>、</em>
镜像操作指令<em>、</em>
容器启动时执行指令<em>、</em>
1.<em>参数</em>
This <em>dockerfile</em> demo for project build to <em>docker</em> images
 VERSION 2
 Author: Shawn_xiao
 Command format: Instruction [arguments</div>
			</a>
		</div>
	</div>
</div><div class="recommend-item-box baiduSearch clearfix" data-type="blog" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-104426342-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.3&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_41337034/article/details/104426342&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;4&quot;}">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a class="tit" href="https://blog.csdn.net/qq_41337034/article/details/104426342" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-104426342-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.3&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_41337034/article/details/104426342&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;4&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-104426342-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.3&amp;utm_relevant_index=5">					                <div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em><em>参数</em>简介_赵北北北北北的博客</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">6-22</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/qq_41337034/article/details/104426342" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-104426342-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.3&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_41337034/article/details/104426342&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;4&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-104426342-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.3&amp;utm_relevant_index=5">                      <div class="desc ellipsis-online ellipsis-online-1">COPY: 顾名思义,就是用来来回复制文件的,COPY . /root/workspace/agent表示将当前文件夹(.表示当前文件夹,即<em>Dockerfile</em>所在文件夹)的所以文件拷贝到容器的/root/workspace/agent文件夹中。通过–from<em>参数</em>也可以从前面阶段的镜像中拷贝文...</div>                    </a>                  </div>                </div>              </div><div class="recommend-item-box baiduSearch clearfix" data-type="blog" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-5-82663168-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.4&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tflasd1157/article/details/82663168&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;5&quot;}">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a class="tit" href="https://blog.csdn.net/tflasd1157/article/details/82663168" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-5-82663168-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.4&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tflasd1157/article/details/82663168&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;5&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-5-82663168-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.4&amp;utm_relevant_index=6">					                <div class="left ellipsis-online ellipsis-online-1"><em>dockerfile</em> <em>参数</em>含义_熊猫卡洛斯的博客</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">6-22</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/tflasd1157/article/details/82663168" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-5-82663168-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.4&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tflasd1157/article/details/82663168&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;5&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-5-82663168-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.4&amp;utm_relevant_index=6">                      <div class="desc ellipsis-online ellipsis-online-1"><em>dockerfile</em> <em>参数</em>含义 什么是<em>dockerfile</em>? <em>Dockerfile</em>是一个包含用于组合映像的命令的文本文档。可以使用在命令行中调用任何命令。 <em>Docker</em>通过读取<em>Dockerfile</em>中的指令自动生成映像。 <em>docker</em> build命令用于从<em>Dockerfile</em>构建映像。可以在<em>docker</em> build...</div>                    </a>                  </div>                </div>              </div>
		
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/qq_43568790/article/details/118900582" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.4&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-4-118900582-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_43568790/article/details/118900582&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/qq_43568790/article/details/118900582" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.4&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-4-118900582-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_43568790/article/details/118900582&quot;}" data-report-query="spm=1001.2101.3001.6650.4&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=7">
					<div class="left ellipsis-online ellipsis-online-1"><em>docker</em>部署springcloud项目(使用<em>dockerFile</em>构建)</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/qq_43568790" target="_blank" data-report-query="spm=1001.2101.3001.6650.4&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=7"><span class="blog-title">qq_43568790的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">07-19</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1464
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/qq_43568790/article/details/118900582" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.4&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-4-118900582-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_43568790/article/details/118900582&quot;}" data-report-query="spm=1001.2101.3001.6650.4&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-4-118900582-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=7">
				<div class="desc ellipsis-online ellipsis-online-1">1.编写<em>dockerFile</em>

注册中心,registery-center

FROM java:8

COPY registry-center-1.0-SNAPSHOT.jar /register.jar

ENTRYPOINT ["java","-jar","register.jar"]

EXPOSE 9000

①使用jdk8
②把打包好的registry-center-1.0-SNAPSHOT.jar 复制到容器中并命名为register.jar
③使用命令启动jar包
④暴露9000端口
剩下的</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/zhong_jay/article/details/108668166" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.5&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-5-108668166-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zhong_jay/article/details/108668166&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/zhong_jay/article/details/108668166" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.5&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-5-108668166-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zhong_jay/article/details/108668166&quot;}" data-report-query="spm=1001.2101.3001.6650.5&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=8">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em><em>参数</em>详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/zhong_jay" target="_blank" data-report-query="spm=1001.2101.3001.6650.5&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=8"><span class="blog-title">--雪飘时吻你--</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">09-18</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1587
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/zhong_jay/article/details/108668166" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.5&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-5-108668166-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zhong_jay/article/details/108668166&quot;}" data-report-query="spm=1001.2101.3001.6650.5&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-5-108668166-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=8">
				<div class="desc ellipsis-online ellipsis-online-1">FROM



功能为指定基础镜像，并且必须是第一条指令。

如果不以任何镜像为基础，那么写法为：FROM scratch。

同时意味着接下来所写的指令将作为镜像的第一层开始



语法：


FROM &lt;image&gt;
FROM &lt;image&gt;:&lt;tag&gt;
FROM &lt;image&gt;:&lt;digest&gt;

三种写法，其中&lt;tag&gt;和&lt;digest&gt; 是可选项，如果没有选择，那么默认值为latest





RUN
...</div>
			</a>
		</div>
	</div>
</div><div class="recommend-item-box baiduSearch clearfix" data-type="blog" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-8-80941390-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;5\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.5&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_25611295/article/details/80941390&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;8&quot;}">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a class="tit" href="https://blog.csdn.net/qq_25611295/article/details/80941390" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-8-80941390-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;5\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.5&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_25611295/article/details/80941390&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;8&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-8-80941390-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.5&amp;utm_relevant_index=9">					                <div class="left ellipsis-online ellipsis-online-1">...file用法和<em>参数</em>详解_超级大饭粒的博客_<em>dockerfile</em> <em>参数</em></div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">7-1</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/qq_25611295/article/details/80941390" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-8-80941390-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;,\&quot;parent_index\&quot;:\&quot;5\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242.5&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_25611295/article/details/80941390&quot;,&quot;strategy&quot;:&quot;2~default~baidujs_baidulandingword~default&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;8&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-8-80941390-blog-107612891.pc_relevant_aa2&amp;spm=1001.2101.3001.4242.5&amp;utm_relevant_index=9">                      <div class="desc ellipsis-online ellipsis-online-1">将本地的一个文件或目录拷贝到容器的某个目录里。 其中src为<em>Dockerfile</em>所在目录的相对路径,它也可以是一个url。比如 ADD <em>Dockerfile</em>创建镜像 – <em>Dockerfile</em><em>示例</em>(安装nginx) mkdir /root/<em>docker</em> &amp;&amp;cd/root/<em>docker</em> ...</div>                    </a>                  </div>                </div>              </div>
<div class="recommend-item-box type_blog clearfix" data-url="https://kayer.blog.csdn.net/article/details/124442311" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.6&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-6-124442311-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://kayer.blog.csdn.net/article/details/124442311&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://kayer.blog.csdn.net/article/details/124442311" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.6&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-6-124442311-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://kayer.blog.csdn.net/article/details/124442311&quot;}" data-report-query="spm=1001.2101.3001.6650.6&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=10">
					<div class="left ellipsis-online ellipsis-online-1"><em>DockerFile</em><em>参数</em>详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/adminkeys" target="_blank" data-report-query="spm=1001.2101.3001.6650.6&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=10"><span class="blog-title">我就吃一口的BLOG</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">04-27</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					130
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://kayer.blog.csdn.net/article/details/124442311" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.6&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-6-124442311-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://kayer.blog.csdn.net/article/details/124442311&quot;}" data-report-query="spm=1001.2101.3001.6650.6&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-6-124442311-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=10">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Dockerfile</em><em>参数</em>详解
From XXX（基于什么镜像）
WORKDIR（指定shell语句运行在那个路径下）
COPY（将宿主机的文件拷贝到某路径下）
RUN（运行shell语句，只要构建就会运行，如echo 321 &gt;&gt; 1.txt）
CMD （指定镜像启动运行的脚本，只有容器真正运行的时候才会运行的脚本，执行后容器的生命周期即结束，且一般为阻塞式语句，如tail语句）
「阻塞操作」 tail -f
一般语句为：
FROM WORKDIR COPY-ADD RUN CMD-ENTRYP</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/yinni11/article/details/81699773" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.7&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-7-81699773-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/yinni11/article/details/81699773&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/yinni11/article/details/81699773" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.7&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-7-81699773-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/yinni11/article/details/81699773&quot;}" data-report-query="spm=1001.2101.3001.6650.7&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=11">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em>文件详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/yinni11" target="_blank" data-report-query="spm=1001.2101.3001.6650.7&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=11"><span class="blog-title">yinni11的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">08-15</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					296
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/yinni11/article/details/81699773" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.7&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-7-81699773-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/yinni11/article/details/81699773&quot;}" data-report-query="spm=1001.2101.3001.6650.7&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-7-81699773-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=11">
				<div class="desc ellipsis-online ellipsis-online-1">什么是<em>dockerfile</em>?

<em>Dockerfile</em>是一个包含用于组合映像的命令的文本文档。可以使用在命令行中调用任何命令。 <em>Docker</em>通过读取<em>Dockerfile</em>中的指令自动生成映像。

<em>docker</em> build命令用于从<em>Dockerfile</em>构建映像。可以在<em>docker</em> build命令中使用-f标志指向文件系统中任何位置的<em>Dockerfile</em>。

例：<em>docker</em> build -f /path...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/u010570288/article/details/124018039" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.8&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-8-124018039-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010570288/article/details/124018039&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/u010570288/article/details/124018039" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.8&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-8-124018039-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010570288/article/details/124018039&quot;}" data-report-query="spm=1001.2101.3001.6650.8&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=12">
					<div class="left ellipsis-online ellipsis-online-1">【<em>docker</em>】<em>Dockerfile</em>常用<em>参数</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/u010570288" target="_blank" data-report-query="spm=1001.2101.3001.6650.8&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=12"><span class="blog-title">u010570288的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">04-08</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					130
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/u010570288/article/details/124018039" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.8&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-8-124018039-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u010570288/article/details/124018039&quot;}" data-report-query="spm=1001.2101.3001.6650.8&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-8-124018039-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=12">
				<div class="desc ellipsis-online ellipsis-online-1">FROM
指定基础镜像
LABEL
设置key=value键值对
LABEL maintainer=“yzchen engyzchen@foxmail.com”
RUN
执行shell指令
 - 设置本地时间
 RUN  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &amp;&amp; echo $TZ &gt; /etc/timezone

WORKDIR
WORKDIR  容器内的相对位置
例如：
	WORKDIR /app
	COPY File1 Fi</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/u014736082/article/details/103883407" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.9&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-9-103883407-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u014736082/article/details/103883407&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/u014736082/article/details/103883407" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.9&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-9-103883407-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u014736082/article/details/103883407&quot;}" data-report-query="spm=1001.2101.3001.6650.9&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=13">
					<div class="left ellipsis-online ellipsis-online-1"><em>dockerfile</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/u014736082" target="_blank" data-report-query="spm=1001.2101.3001.6650.9&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=13"><span class="blog-title">痞子王的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">01-07</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					55
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/u014736082/article/details/103883407" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.9&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-9-103883407-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/u014736082/article/details/103883407&quot;}" data-report-query="spm=1001.2101.3001.6650.9&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-9-103883407-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=13">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Dockerfile</em>




关键字
作用
备注




FROM
指定父镜像
指定<em>dockerfile</em>基于那个image构建


MAINTAINER
作者信息
用来标明这个<em>dockerfile</em>谁写的


LABEL
标签
用来标明<em>dockerfile</em>的标签 可以使用Label代替Maintainer 最终都是在<em>docker</em> image基本信息中可以查看


RUN
执行命令
执行一段命令 默认...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://tenten.blog.csdn.net/article/details/106198418" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.10&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-10-106198418-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://tenten.blog.csdn.net/article/details/106198418&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://tenten.blog.csdn.net/article/details/106198418" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.10&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-10-106198418-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://tenten.blog.csdn.net/article/details/106198418&quot;}" data-report-query="spm=1001.2101.3001.6650.10&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=14">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em> 的常见<em>参数</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/sunt2018" target="_blank" data-report-query="spm=1001.2101.3001.6650.10&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=14"><span class="blog-title">_Tsun 的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">05-18</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					155
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://tenten.blog.csdn.net/article/details/106198418" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.10&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-10-106198418-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://tenten.blog.csdn.net/article/details/106198418&quot;}" data-report-query="spm=1001.2101.3001.6650.10&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-10-106198418-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=14">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Docker</em> File 常用指令


FROM   指定基础镜像
FROM centos:7



MAINTAINER: 指定作者/维护着
MAINTAINER Tian Go &lt;tiango@aliyun.com&gt;



RUN  执行的命令
RUN ["yum", "install", "httpd"]
RUN yum install redis
RUN ln -s /opt/bin/python3 /bin/python



WORKDIR： 指定工作目录
WORKDIR /data
</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/weixin_42513448/article/details/111889769" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.11&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-11-111889769-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_42513448/article/details/111889769&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/weixin_42513448/article/details/111889769" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.11&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-11-111889769-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_42513448/article/details/111889769&quot;}" data-report-query="spm=1001.2101.3001.6650.11&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=15">
					<div class="left ellipsis-online ellipsis-online-1"><em>docker</em>设置jvm<em>参数</em>_<em>dockerfile</em>指定jvm<em>参数</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/weixin_42513448" target="_blank" data-report-query="spm=1001.2101.3001.6650.11&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=15"><span class="blog-title">weixin_42513448的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">12-23</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1856
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/weixin_42513448/article/details/111889769" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.11&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-11-111889769-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_42513448/article/details/111889769&quot;}" data-report-query="spm=1001.2101.3001.6650.11&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11-111889769-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=15">
				<div class="desc ellipsis-online ellipsis-online-1">实例FROM java:8VOLUME /tmpADD app.jar app.jarRUN bash -c 'touch /app.jar'EXPOSE 9001ENV JAVA_OPTS="\-server \-Xmx4g \-Xms4g \-Xmn2g \-XX:SurvivorRatio=8 \-XX:MetaspaceSize=256m \-XX:MaxMetaspaceSize=512...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/ben_na_/article/details/121634819" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.12&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-12-121634819-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/ben_na_/article/details/121634819&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/ben_na_/article/details/121634819" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.12&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-12-121634819-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/ben_na_/article/details/121634819&quot;}" data-report-query="spm=1001.2101.3001.6650.12&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=16">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em><em>配置</em>详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/ben_na_" target="_blank" data-report-query="spm=1001.2101.3001.6650.12&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=16"><span class="blog-title">ben_na_的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">12-07</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					741
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/ben_na_/article/details/121634819" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.12&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~CTRLIST~default-12-121634819-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;2~default~CTRLIST~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/ben_na_/article/details/121634819&quot;}" data-report-query="spm=1001.2101.3001.6650.12&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-12-121634819-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=16">
				<div class="desc ellipsis-online ellipsis-online-1">暂无

</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://weishihuai.blog.csdn.net/article/details/105230536" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.13&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-13-105230536-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://weishihuai.blog.csdn.net/article/details/105230536&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://weishihuai.blog.csdn.net/article/details/105230536" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.13&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-13-105230536-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://weishihuai.blog.csdn.net/article/details/105230536&quot;}" data-report-query="spm=1001.2101.3001.6650.13&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=17">
					<div class="left ellipsis-online ellipsis-online-1"><em>Docker</em>部署SpringCloud项目</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/Weixiaohuai" target="_blank" data-report-query="spm=1001.2101.3001.6650.13&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=17"><span class="blog-title">weixiaohuai的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">03-31</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1063
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://weishihuai.blog.csdn.net/article/details/105230536" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.13&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-13-105230536-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://weishihuai.blog.csdn.net/article/details/105230536&quot;}" data-report-query="spm=1001.2101.3001.6650.13&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-13-105230536-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=17">
				<div class="desc ellipsis-online ellipsis-online-1">一<em>、</em>简介

本篇文章将总结如何使用<em>Docker</em>部署SpingCloud项目，这里的内容也是之前学习<em>Docker</em>时候自己花了不少时间一点一点摸索出来的，小伙伴们可以参考着自己操作一遍，期间肯定会踩坑，然后一个一个解决就学会了。

主要涉及到的服务有：

Eureka服务注册和发现；
	Config<em>配置</em>中心；
api-gateway网关服务；
	punishment-service服务；
	stude...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/m0_69879853/article/details/125062116" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.14&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-14-125062116-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_69879853/article/details/125062116&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/m0_69879853/article/details/125062116" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.14&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-14-125062116-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_69879853/article/details/125062116&quot;}" data-report-query="spm=1001.2101.3001.6650.14&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=18">
					<div class="left ellipsis-online ellipsis-online-1"><em>dockerfile</em>的<em>配置</em></div>
					<div class="tag">最新发布</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/m0_69879853" target="_blank" data-report-query="spm=1001.2101.3001.6650.14&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=18"><span class="blog-title">m0_69879853的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">05-31</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					41
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/m0_69879853/article/details/125062116" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.14&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-14-125062116-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_69879853/article/details/125062116&quot;}" data-report-query="spm=1001.2101.3001.6650.14&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14-125062116-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=18">
				<div class="desc ellipsis-online ellipsis-online-1"><em>dockerfile</em>的运行</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/KW__jiaoq/article/details/123185681" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.15&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-15-123185681-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/KW__jiaoq/article/details/123185681&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/KW__jiaoq/article/details/123185681" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.15&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-15-123185681-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/KW__jiaoq/article/details/123185681&quot;}" data-report-query="spm=1001.2101.3001.6650.15&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=19">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em><em>配置</em>指令详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/KW__jiaoq" target="_blank" data-report-query="spm=1001.2101.3001.6650.15&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=19"><span class="blog-title">MKC__jiaoq的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">03-01</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					530
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/KW__jiaoq/article/details/123185681" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.15&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-15-123185681-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/KW__jiaoq/article/details/123185681&quot;}" data-report-query="spm=1001.2101.3001.6650.15&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-15-123185681-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=19">
				<div class="desc ellipsis-online ellipsis-online-1">1<em>、</em><em>Dockerfile</em>的编写结构












基本构建如下：

基础镜像信息
镜像操作指令
容器启动时执行指令


2<em>、</em>FROM


作用：指定基础镜像，用于继承其他镜像使用的




[root@<em>Docker</em>1 ~]# vim <em>Dockerfile</em>              #文件名，必须是<em>Dockerfile</em>

FROM scratch                   #不指定任何镜像为基础 scratch（注意需要从0开始进行编辑）
FROM centos              </div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/weixin_34223655/article/details/92177825" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.16&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-16-92177825-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_34223655/article/details/92177825&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/weixin_34223655/article/details/92177825" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.16&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-16-92177825-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_34223655/article/details/92177825&quot;}" data-report-query="spm=1001.2101.3001.6650.16&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=20">
					<div class="left ellipsis-online ellipsis-online-1"><em>dockerfile</em><em>参数</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/weixin_34223655" target="_blank" data-report-query="spm=1001.2101.3001.6650.16&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=20"><span class="blog-title">weixin_34223655的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">11-19</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					1718
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/weixin_34223655/article/details/92177825" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.16&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-16-92177825-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_34223655/article/details/92177825&quot;}" data-report-query="spm=1001.2101.3001.6650.16&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-16-92177825-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=20">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Docker</em> 镜像使用当运行容器时，使用的镜像如果在本地中不存在，<em>docker</em>就会自动从 <em>docker</em>镜像仓库中下载，默认是从<em>Docker</em> Hub公共镜像源下载。使用<em>docker</em> images来列出本地主机上的镜像。[root@test01 ~]# <em>docker</em> imagesREPOSITORY          TAG        I...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/qq_39458487/article/details/123418861" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.17&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-17-123418861-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_39458487/article/details/123418861&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/qq_39458487/article/details/123418861" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.17&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-17-123418861-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_39458487/article/details/123418861&quot;}" data-report-query="spm=1001.2101.3001.6650.17&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=21">
					<div class="left ellipsis-online ellipsis-online-1"><em>dockerfile</em>中指定Spring项目启动<em>配置</em></div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/qq_39458487" target="_blank" data-report-query="spm=1001.2101.3001.6650.17&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=21"><span class="blog-title">qq_39458487的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">03-11</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					729
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/qq_39458487/article/details/123418861" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.17&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-17-123418861-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/qq_39458487/article/details/123418861&quot;}" data-report-query="spm=1001.2101.3001.6650.17&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-123418861-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=21">
				<div class="desc ellipsis-online ellipsis-online-1">以nacos<em>配置</em>为例，如果nacos<em>配置</em>是在项目启动时指定，则

解决方案1，将<em>配置</em>到K8S的configmap，<em>dockerfile</em>中指定${configmap的key}.此方式灵活


-Dspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848 
-Dspring.cloud.nacos.config.server-addr=127.0.0.1:8848

解决方案2

直接将命令设置到启动方法,但是这种不灵活


java -Dfile.enc.</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/m0_46571920/article/details/121721240" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.18&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-18-121721240-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;18&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_46571920/article/details/121721240&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/m0_46571920/article/details/121721240" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.18&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-18-121721240-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;18&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_46571920/article/details/121721240&quot;}" data-report-query="spm=1001.2101.3001.6650.18&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=22">
					<div class="left ellipsis-online ellipsis-online-1"><em>Docker</em>-Compose + Nginx 部署前后端分离项目</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/m0_46571920" target="_blank" data-report-query="spm=1001.2101.3001.6650.18&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=22"><span class="blog-title">[爪洼ing]的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">12-04</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					2235
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/m0_46571920/article/details/121721240" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.18&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-18-121721240-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;18&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/m0_46571920/article/details/121721240&quot;}" data-report-query="spm=1001.2101.3001.6650.18&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18-121721240-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=22">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Docker</em>-Compose + Nginx 部署前后端分离项目

项目是采用Vue +Springboot 的前后端分离项目

一<em>、</em>预处理
1<em>、</em>项目打包前，先去File–&gt;Setting–&gt; File Encoding 中 改为UTF-8,防止乱码错误！

注意：此时如果修改为UTF8后我们的properties<em>配置</em>文件中文乱码：不要慌没问题，直接把中文删除再写即可！
2<em>、</em>由于后端项目是使用SpringBoot编写的，我们打包需要一个打包插件，记得导入包！不然可能出现打出的包中没东西
			&amp;</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/lkr_lkr/article/details/106215837" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.19&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-19-106215837-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;19&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/lkr_lkr/article/details/106215837&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/lkr_lkr/article/details/106215837" class="tit" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.19&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-19-106215837-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;19&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/lkr_lkr/article/details/106215837&quot;}" data-report-query="spm=1001.2101.3001.6650.19&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=23">
					<div class="left ellipsis-online ellipsis-online-1"><em>Dockerfile</em> <em>配置</em>和构建详解</div>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/lkr_lkr" target="_blank" data-report-query="spm=1001.2101.3001.6650.19&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=23"><span class="blog-title">lkr_lkr的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">05-19</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="">
					119
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/lkr_lkr/article/details/106215837" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;spm&quot;:&quot;1001.2101.3001.6650.19&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;highlightScore\&quot;:0.0,\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~default-19-106215837-blog-107612891.pc_relevant_aa2\&quot;,\&quot;dist_request_id\&quot;:\&quot;1657434725298_58146\&quot;}&quot;,&quot;dist_request_id&quot;:&quot;1657434725298_58146&quot;,&quot;ab_strategy&quot;:&quot;featuressortv1&quot;,&quot;index&quot;:&quot;19&quot;,&quot;strategy&quot;:&quot;2~default~BlogCommendFromBaidu~default&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/lkr_lkr/article/details/106215837&quot;}" data-report-query="spm=1001.2101.3001.6650.19&amp;utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-19-106215837-blog-107612891.pc_relevant_aa2&amp;utm_relevant_index=23">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Dockerfile</em> <em>配置</em>和构建详解<em>Dockerfile</em> <em>配置</em><em>Dockerfile</em> 构建
<em>Dockerfile</em> <em>配置</em>
# 基础镜像
FROM java:8

#在镜像内添加文件，可在镜像运行容器内查看到文件。本地文件和<em>Dockerfile</em>同级目录即可
ADD test.jar test.jar
#在镜像内添加文件夹
ADD config/app.xml config/app.xml

<em>Dockerfile</em> 构建
命令：
$ <em>docker</em> build [OPTIONS] PATH | URL | - 
#PA</div>
			</a>
		</div>
	</div>
</div>
            </div>
            

<script src="https://g.csdnimg.cn/common/csdn-footer/csdn-footer.js" data-isfootertrack="false" type="text/javascript"></script>
<script type="text/javascript">
    window.csdn.csdnFooter.options = {
        el: '.blog-footer-bottom',
        type: 2
    }
</script>        </main>
