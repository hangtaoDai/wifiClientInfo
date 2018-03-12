<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 重点参数：renderOptions -->
<!doctype html>
<html lang="zh-CN">

<head>
    <!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PathSimplifier/examples/index.html -->
    <%--<base href="//webapi.amap.com/ui/1.0/ui/misc/PathSimplifier/examples/" />--%>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" href="http://localhost:8080/hp-layui/lib/layui/css/layui.css" media="all">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>轨迹展示&巡航</title>
    <style>
        html,
        body,
        #container {
            width: 100%;
            height: 100%;
            margin: 0px;
        }

        #loadingTip {
            position: absolute;
            z-index: 9999;
            top: 0;
            left: 0;
            padding: 3px 10px;
            background: red;
            color: #fff;
            font-size: 14px;
        }
    </style>
</head>

<body>

<script src="http://localhost:8080/hp-layui/lib/layui/layui.js"></script>

<div id="container"></div>

<script src="http://webapi.amap.com/maps?v=1.4.4&key=a3548294e42429a8dbc4910169cbc047&callback=init"></script>
<script src="/static/js/hotAP.js"></script>
<script src="http://localhost:8080/hp-layui/lib/layui/layui.js"></script>


<script src="http://localhost:8080/hp-layui/lib/jquery/jquery-2.1.4.js"></script>
<script type="text/javascript" src='http://webapi.amap.com/maps?v=1.4.4&key=a3548294e42429a8dbc4910169cbc047'></script>
<!-- UI组件库 1.0 -->
<script src="http://localhost:8080/hp-layui/lib/layui/layui.js"></script>

<script src="http://webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<script src="http://localhost:8080/json/big-routes.js"></script>
<div class="button-group">
    <input id="setCenter" type="button" class="button" value="改变地图中心点及缩放级别"/>
</div>
<input type='hidden' id='map_data' value='${data}'/>


<script>
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            test: function(){
                layer.alert('你好么，体验者');
            }
            ,test5: function(){
                layer.open({
                    title:'更新论坛信息',
                    type: 1,
                    skin: 'layui-layer-rim',
                    area: ['500px', '580px'],
                    content: $('#test11111')
                });
            }
            ,test6: function(){
                layer.open({
                    type: 2
                    ,content: '/traces'
                    ,area: ['875px', '300px']
                    ,maxmin: true
                });
            }
            ,test7: function(){
                layer.prompt({title: '输入任何口令，并确认', formType: 1}, function(pass, index){
                    layer.close(index);
                    layer.prompt({title: '随便写点啥，并确认', formType: 2}, function(text, index){
                        layer.close(index);
                        layer.msg('演示完毕！您的口令：'+ pass +'<br>您最后写下了：'+text);
                    });
                });
            }

        };
        $('.demo').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>


<script type="text/javascript">

    var map = new AMap.Map('container', {
        resizeEnable: true,
        center: [108.9848256111, 34.2462376564],
        zoom: 16,
        zooms:[16,18]


    });

    AMap.event.addDomListener(document.getElementById('setCenter'), 'click', function() {
        // 设置缩放级别和中心点
        map.setZoomAndCenter(16, [108.9848256111,  34.2462376564]);

        // 在新中心点添加 marker
        var marker = new AMap.Marker({
            map: map,
            position: [108.9848256111, 34.2462376564]
        });
    });

    function loadTrace(movings) {

        AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function(PathSimplifier, $) {

            if (!PathSimplifier.supportCanvas) {
                alert('当前环境不支持 Canvas！');
                return;
            }
            var pathSimplifierIns=null;
            pathSimplifierIns = new PathSimplifier({
                zIndex: 100,
                autoSetFitView: false,
                map: map, //所属的地图实例

                getPath: function(pathData, pathIndex) {

                    return pathData.path;
                },
                getHoverTitle: function(pathData, pathIndex, pointIndex) {

                    if (pointIndex >= 0) {
                        //point
                        return pathData.name + '，点：' + pointIndex + '/' + pathData.path.length;
                    }

                    return pathData.name + '，点数量' + pathData.path.length;
                },
                renderOptions: {

                    renderAllPointsIfNumberBelow: 100 //绘制路线节点，如不需要可设置为-1
                }
            });

            //  window.pathSimplifierIns = pathSimplifierIns;
            endIdx = 0,
                    data = [{
                        name: movings[0].name,
                        path: movings[0].path.slice(0, 1)
                    }];
            // data=movings;
            pathSimplifierIns.setData(data);
            //对第一条线路（即索引 0）创建一个巡航器
            pathSimplifierIns.clearPathNavigators();
            var navg1 = pathSimplifierIns.createPathNavigator(0, {
                loop: true, //循环播放
                speed: 5 //巡航速度，单位千米/小时
            });

            function expandPath() {

                function doExpand() {

                    endIdx++;

                    if (endIdx >= myPath.length) {
                        return false;
                    }

                    var cursor = navg1.getCursor().clone(), //保存巡航器的位置
                            status = navg1.getNaviStatus();


                    data[0].path = myPath.slice(0, endIdx + 1);
                    pathSimplifierIns.setData(data); //延展路径


                    //重新建立一个巡航器
                    navg1 = pathSimplifierIns.createPathNavigator(0, {
                        loop: true, //循环播放
                        speed: 200 //巡航速度，单位千米/小时
                    });

                    if (status !== 'stop') {
                        navg1.start();
                    }

                    //恢复巡航器的位置
                    if (cursor.idx >= 0) {
                        navg1.moveToPoint(cursor.idx, cursor.tail);
                    }

                    return true;
                }

                if (doExpand()) {

                    setTimeout(expandPath, 1500);
                }
            }


            navg1.start();

            expandPath();
        });
    }

    var data= $("#map_data");

    var movings=JSON.parse(data.val());
    loadTrace(movings);
</script>




<script>
    function getRealPath(){
        var localObj = window.location;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = localObj.protocol + "//" + localObj.host + "/";
        return basePath ;
    };
    var movings;
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){

            var datas=data.field;
            var action=data.form.action;

            $.ajax({
                url:action,
                data:datas,
                type:"POST",
                dataType:"text",
                success:function(msg){

                    movings=msg;
                    var obj = JSON.parse(msg);
                    // alert(obj[0].path);

                    loadTrace(obj);

                },
                error:function(error){
                    //  alert("no data");
                    layer.msg("没有查询到相关的轨迹数据");
                    var msg='[{"name":"????? -\u003e ???B3F","path":[[]]}]';
                    var obj = JSON.parse(msg);
                    loadTrace(obj);
                }
            });

            return false;
        });






    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#mov' //指定元素
        });
    });
</script>








<!--
<script type="text/javascript">
    //创建地图
    var map = new AMap.Map('container', {
        resizeEnable: true,
        center: [108.9848256111, 34.2462376564],
        zoom: 10,


    });

    AMap.event.addDomListener(document.getElementById('setCenter'), 'click', function() {
        // 设置缩放级别和中心点
        map.setZoomAndCenter(16, [108.9848256111,  34.2462376564]);

        // 在新中心点添加 marker
        var marker = new AMap.Marker({
            map: map,
            position: [108.9848256111, 34.2462376564]
        });
    });


    AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function(PathSimplifier, $) {

        if (!PathSimplifier.supportCanvas) {
            alert('当前环境不支持 Canvas！');
            return;
        }

        //just some colors
        var colors = [
            "#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00",
            "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707",
            "#651067", "#329262", "#5574a6", "#3b3eac"
        ];

        var pathSimplifierIns = new PathSimplifier({
            zIndex: 100,
            //autoSetFitView:false,
            map: map, //所属的地图实例

            getPath: function(pathData, pathIndex) {

                return pathData.path;
            },
            getHoverTitle: function(pathData, pathIndex, pointIndex) {

                if (pointIndex >= 0) {
                    //point
                    return pathData.name + '，点：' + pointIndex + '/' + pathData.path.length;
                }

                return pathData.name + '，点数量' + pathData.path.length;
            },
            renderOptions: {
                pathLineStyle: {
                    dirArrowStyle: true
                },
                getPathStyle: function(pathItem, zoom) {

                    var color = colors[pathItem.pathIndex % colors.length],
                        lineWidth = Math.round(2 * Math.pow(1.1, zoom - 3));

                    return {
                        pathLineStyle: {
                            strokeStyle: color,
                            lineWidth: lineWidth
                        },
                        pathLineSelectedStyle: {
                            lineWidth: lineWidth + 1
                        },
                        pathNavigatorStyle: {
                            fillStyle: color
                        }
                    };
                }
            }
        });

        window.pathSimplifierIns = pathSimplifierIns;

        $('<div id="loadingTip">加载数据，请稍候...</div>').appendTo(document.body);

        $.getJSON('http://localhost:8080/json/big-routes.json', function(d) {

            $('#loadingTip').remove();

            var flyRoutes = [];

            for (var i = 0, len = d.length; i < len; i++) {

                if (d[i].name.indexOf('东五舍B3F') >= 0) {

                    d.splice(i, 0, {
                        name: '飞行 - ' + d[i].name,
                        path: PathSimplifier.getGeodesicPath(
                            d[i].path[0], d[i].path[d[i].path.length - 1], 100)
                    });

                    i++;
                    len++;
                }
            }

            d.push.apply(d, flyRoutes);

            pathSimplifierIns.setData(d);

            //initRoutesContainer(d);

            function onload() {
                pathSimplifierIns.renderLater();
            }

            function onerror(e) {
                alert('图片加载失败！');
            }

//            //创建一个巡航器
//            var navg0 = pathSimplifierIns.createPathNavigator(1, {
//                loop: true, //循环播放
//                speed: 1000
//            });
//
//            navg0.start();


            var navg1 = pathSimplifierIns.createPathNavigator(1, {
                loop: true,
                speed: 1000,
                pathNavigatorStyle: {
                    width: 24,
                    height: 24,
                    //使用图片
                    content: PathSimplifier.Render.Canvas.getImageContent('http://webapi.amap.com/ui/1.0/ui/misc/PathSimplifier/examples/imgs/plane.png', onload, onerror),
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 6,
                        strokeStyle: 'black',
                        dirArrowStyle: {
                            stepSpace: 15,
                            strokeStyle: 'red'
                        }
                    }
                }
            });

            navg1.start();


        });
    });
</script>
-->

</body>

</html>