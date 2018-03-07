<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>表格操作 - layui</title>

    <link rel="stylesheet" href="/hp-layui/lib/layui/css/layui.css">


</head>
<body>




<script src="/hp-layui/lib/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;
        //方法级渲染
        window.demoTable = table.render({
            elem: '#demo'
            //,url: 'json/table/demo1.json'
            ,data: [{
                "id": "10001"
                ,"username": "杜甫"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "116"
                ,"ip": "192.168.0.8"
                ,"logins": "108"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10002"
                ,"username": "李白"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "12"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
                ,"LAY_CHECKED": true
            }, {
                "id": "10003"
                ,"username": "王勃"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "65"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10004"
                ,"username": "贤心"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "666"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10005"
                ,"username": "贤心"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "86"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10006"
                ,"username": "贤心"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "12"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10007"
                ,"username": "贤心"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "16"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }, {
                "id": "10008"
                ,"username": "贤心"
                ,"email": "xianxin@layui.com"
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "人生恰似一场修行"
                ,"experience": "106"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
            }]
            ,width: 900
            //,height: 274
            ,cols: [[ //标题栏
                {space: true, fixed: true}
                ,{checkbox: true, LAY_CHECKED: true}
                ,{field: 'id', title: 'ID', width: 80, sort: true}
                ,{field: 'username', title: '用户名', width: 120}
                ,{field: 'email', title: '邮箱', width: 150}
                ,{field: 'sign', title: '签名', width: 150}
                ,{field: 'sex', title: '性别', width: 80}
                ,{field: 'city', title: '城市', width: 100}
                ,{field: 'experience', title: '积分', width: 80, sort: true}
            ]]

            ,id:'test111'
            ,skin: 'row' //表格风格
            ,even: true
            //,size: 'lg' //尺寸

            ,page: true //是否显示分页
            ,limits: [3,5,10]
            ,limit: 3 //每页默认显示的数量
            //,loading: false //请求数据时，是否显示loading
            //,id: 'demo' //ID
        });

        // 表格刷新
        $("#refrsh").click(function(){
            //执行重载
            table.reload('test', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    // 参数
                    kd:'kd'
                }
            });

        })


        // 表格刷新
        $("#refrsh-1").click(function(){
            //执行重载
            table.reload('idTest', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    // 参数
                    kd:'kd'
                }
            });

        })




        //监听表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        //监听单元格编辑
        table.on('edit(test)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段

        });

        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.username
                }, function(value, index){
                    obj.update({
                        username: value
                    });
                    layer.close(index);
                });
            }
        });

        //监听排序
        table.on('sort(test)', function(obj){
            console.log(this, obj.field, obj.type)

            return;
            table.reload('test', {
                initSort: obj
                ,where: { //重新请求服务端
                    key: obj.field //排序字段
                    ,order: obj.type //排序方式
                }
                //,height: 300
            });
        });


        var $ = layui.jquery, active = {
            getCheckData: function(){
                var checkStatus = table.checkStatus('test')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){
                var checkStatus = table.checkStatus('test')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){
                var checkStatus = table.checkStatus('test');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
            ,parseTable: function(){
                table.init('parse-table-demo');
            }
        };

        $('.layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>


<div class="demoTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload2" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/macs'
            ,cols: [[
               {checkbox: true, fixed: true}
                ,{field:'id', title: 'No.', width:80, sort: true,fixed: true}
                ,{field:'usermacId', title: '用户MAC编号', width:220, sort: true}
                ,{field:'userId', title: '用户id', width:120}
                ,{field:'username', title: '用户名', width:180, sort: true}
                ,{field:'userMac', title: 'MAC地址', width:180, sort: true}

             ]]
            ,id: 'testReload'
            ,page: true
            ,height: 415
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload2');
                console.log(demoReload.val())
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        username:demoReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>


</body>
</html>

