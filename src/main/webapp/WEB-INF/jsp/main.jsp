<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="/hp-layui/lib/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/hp-layui/css/hp-layui.css" />
    <link rel="shortcut icon" href="favicon.ico" />
</head>

<body class="layui-layout-body hp-white-theme">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            hp-layui 与你同在
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="">阿里云</a>
            </li>
            <li class="layui-nav-item">
                <a href="">CRM系统</a>
            </li>
            <li class="layui-nav-item">
                <a href="">EHR系统</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">邮件管理</a>
                    </dd>
                    <dd>
                        <a href="">消息管理</a>
                    </dd>
                    <dd>
                        <a href="">授权管理</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><i class="layui-icon"></i>主题<span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child layui-anim layui-anim-upbit">
                    <dd>
                        <a skin="hp-black-theme" class="hp-theme-skin-switch"  href="javascript:;">低调黑</a>
                    </dd>
                    <dd >
                        <a skin="hp-blue-theme" class="hp-theme-skin-switch" href="javascript:;">炫酷蓝</a>
                    </dd>
                    <dd>
                        <a skin="hp-green-theme" class="hp-theme-skin-switch"  href="javascript:;">原谅绿</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side hp-left-menu">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav hp-nav-none">
                <li class="layui-nav-item">
                    <a href="javascript:;"  class="hp-user-name">
                        <img src="/hp-layui/img/1.jpg" class="layui-circle-img"><span class="hp-kd">隐无为</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="">基本资料</a>
                        </dd>
                        <dd>
                            <a href="">安全设置</a>
                        </dd>
                    </dl>
                </li>
            </ul>

            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">基本功能</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/button.html" href="javascript:;">按钮</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/form.html" href="javascript:;">表单</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/table.html" href="javascript:;">表格</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/layout.html" href="javascript:;">布局</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/layer.html" href="javascript:;">弹窗</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/demo/upload.html" href="javascript:;">上传</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">扩展组件</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/hpTab.html" href="javascript:;" >动态选项卡</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/hpRightMenu.html" href="javascript:;">右键菜单项</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/hpLayedit.html"  href="javascript:;">多图编辑器</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/hpFormAll.html"  href="javascript:;">表单全屏层</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/hpWindow.html"  >弹出窗口层</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">示例页面</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a  target="_blank"   href="/hp-layui/pageDemo/login/login1.html" >登录页面</a>
                        </dd>
                        <dd>
                            <a  target="_blank"   href="/hp-layui/pageDemo/404.html" >404页面</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">数据列表</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/list/dataList.html" href="javascript:;" >基础列表</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/list/imgList.html" href="javascript:;" >图文列表</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/list/formList.html" href="javascript:;" >表单列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">数据分析</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/echarts/bar.html" href="javascript:;" >柱状图</a>
                        </dd>
                        <dd>
                            <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/echarts/pie.html" href="javascript:;" >饼图</a>
                        </dd>

                    </dl>
                </li>


                <!-历史mac->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/mac" href="javascript:;" >历史MAC</a>
                </li>
                <!-热点AP->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/map.html" href="javascript:;" >热点AP</a>
                </li>
                <!-运动轨迹->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/route.html" href="javascript:;" >运动轨迹</a>
                </li>
                <!-AP热力图->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/hp-layui/hpDemo/heat.html" href="javascript:;" >AP热图</a>
                </li>
                <!-社交关系->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/relationships" href="javascript:;" >社交关系</a>
                </li>
                <!-会面详情->
                <li class="layui-nav-item">
                    <a class="hp-tab-add" hp-href="/hp-layui/pageDemo/echarts/bar.html" href="javascript:;" >会面详情</a>
                </li>



                <li class="layui-nav-item">
                    <a  target="_blank"   href="https://github.com/hpit-BAT">github组织</a>
                </li>
                <li class="layui-nav-item">
                    <a  target="_blank"   href="https://hpit-bat.github.io/hpit-BAT-home">黑科技</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab hp-tab " style="" lay-filter="hp-tab-filter" lay-allowclose="true">
            <ul class="layui-tab-title" style="">
                <li class="layui-this" lay-id="0">首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div>
                                <div class="layui-bg-green demo-carousel">
                                    <p style="font-size: 30px;">hp-layui 与你同在</p>
                                    <p style="font-size: 28px;">隐无为</p>
                                </div>
                            </div>
                            <div>
                                <div class="layui-bg-red demo-carousel">
                                    <p style="font-size: 30px;">hp-layui 与你同在</p>
                                    <p style="font-size: 28px;">隐无为</p>
                                </div>
                            </div>
                            <div>
                                <div class="layui-bg-blue demo-carousel">
                                    <p style="font-size: 30px;">hp-layui 与你同在</p>
                                    <p style="font-size: 28px;">隐无为</p>
                                </div>
                            </div>
                            <div>
                                <div class="layui-bg-orange demo-carousel">
                                    <p style="font-size: 30px;">hp-layui 与你同在</p>
                                    <p style="font-size: 28px;">隐无为</p>
                                </div>
                            </div>
                            <div>
                                <div class="layui-bg-cyan demo-carousel">
                                    <p style="font-size: 30px;">hp-layui 与你同在</p>
                                    <p style="font-size: 28px;">隐无为</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 源码地址 -->
                    <div style="margin-top: 10px;">
                        <blockquote class="layui-elem-quote">
                            源码地址：<br/><br/>
                            <a target="_blank" href="https://github.com/hpit-BAT/hp-layui"><button class="layui-btn layui-btn-danger  layui-btn-sm">github</button></a>
                        </blockquote>
                        <blockquote class="layui-elem-quote">
                            <h2>hp-layui 厚溥与你同在   @隐无为</h2>
                            如果你有什么疑问欢迎加入qq群讨论交流前端知识<br/>
                            <b>qq群:693291343</b>
                        </blockquote>
                        <blockquote class="layui-elem-quote">
                            计划:<br/>
                            1.运用此模板的后台项目(正在码代码中。。。。)<br/>
                            2.增加更多的事例页面<br/>
                            3.继续美化样式<br/>

                        </blockquote>
                    </div>
                    <!--时间线 -->
                    <div>
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                            <legend>hp-layui 今生前世</legend>
                        </fieldset>
                        <ul class="layui-timeline">
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">
                                        1.增加配置类hpConfig，兼容静态服务器只能get,若要修改post改参数变量isAjaxType='post' 即可
                                    </div>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">
                                        更新layui 版本 2.2.5 并添加了如下功能
                                    </div>
                                    <ul>
                                        <li>
                                            示例页面
                                        </li>
                                        <li>
                                            数据列表页面
                                        </li>
                                        <li>
                                            数据分析(百度图表技术Echarts)
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">
                                        2018-没想到layui已经陪我到了2018年,感叹青春正在奔跑
                                    </div>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">2017末尾,想把学习的layui成果分享->hp-layui-1.0 </div>
                                    <ul>
                                        <li>
                                            基本功能
                                        </li>
                                        <li>
                                            扩展组件(layui 模块写法)
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">2017 中途,更新版本layui-2.x 感觉layui-越来越好</div>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title" style="color: red;">2017伊始,接触 layui-1.x 学习使用 </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © hp-layui-version-1.0
    </div>
</div>
<script src="/hp-layui/lib/layui/layui.js"></script>
<script src="http://webapi.amap.com/maps?v=1.4.4&key=a3548294e42429a8dbc4910169cbc047&callback=init"></script>
<script>
    // 配置
    layui.config({
        base: '/hp-layui/hpModules/' // 扩展模块目录
    }).extend({ // 模块别名
        hpTab: 'hpTab/hpTab',
        hpRightMenu: 'hpRightMenu/hpRightMenu',
        hpFormAll: 'hpFormAll/hpFormAll'
    });
    //JavaScript代码区域
    layui.use(['element', 'carousel','hpTheme', 'hpTab', 'hpLayedit', 'hpRightMenu'], function() {
        var element = layui.element;
        var carousel = layui.carousel; //轮播
        var hpTab = layui.hpTab;
        var hpRightMenu = layui.hpRightMenu;
        var hpTheme=layui.hpTheme;
        $ = layui.jquery;
        // 初始化主题
        hpTheme.init();
        //初始化轮播
        carousel.render({
            elem: '#test1',
            width: '100%', //设置容器宽度
            interval: 1500,
            height: '500px',
            arrow: 'none', //不显示箭头
            anim: 'fade', //切换动画方式
        });

        // 初始化 动态tab
        hpTab.init();
        // 右键tab菜单
        hpRightMenu.init();

    });
</script>


</body>

</html>