<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <script type="text/javascript" src="/group-explorer/js/plugins/d3/d3.v3.min.js"></script>
  <script type="text/javascript" src="/group-explorer/js/plugins/jquery/jquery-1.9.1.js"></script>
  <link rel="stylesheet" href="/group-explorer/css/demo.css"/>
  <link rel="stylesheet" href="http://localhost:8080/hp-layui/lib/layui/css/layui.css" media="all">

  <script src="http://localhost:8080/hp-layui/lib/layui/layui.js"></script>



  <style>
    .getdata{
      position: absolute;
      top:0px;
      right: 30px;
    }
  </style>
</head>
<body>

<form class="layui-form  layui-form-pane" action="/traces">

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">日期选择</label>
      <div class="layui-input-block">
        <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
      </div>
    </div>



    <div class="layui-inline">
      <select id="usertype" name="type">
        <option value="">请选择查询类型</option>
        <option value="mac" >Mac地址</option>
        <option value="username">用户名</option>
      </select>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <input type="text" id="querystr" name="querystr" autocomplete="off" class="layui-input">
      </div>
    </div>

    <div class="layui-inline">
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>

    </div>



  </div>
</form>
<button class="layui-btn demo getdata" data-type="test6">查询会面</button>












<script>
  function getRealPath(){
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/";
    return basePath ;
  };

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

//            $.ajax({
//                url:action,
//                data:datas,
//                type:"POST",
//                dataType:"text",
//                success:function(msg){
//
//                    movings=msg;
//                    var obj = JSON.parse(msg);
//                   // alert(obj[0].path);
//
//                    loadTrace(obj);
//
//                },
//                error:function(error){
//                  //  alert("no data");
//                    layer.msg("没有查询到相关的轨迹数据");
//                }
//            });

      return true;
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


<script>
  layui.use('layer', function(){
    var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

    //触发事件
    var active = {
      test6: function(){
        var option=$("#usertype option:selected");

        if(option.val()=="" || $("#date1").val()=="" || $("#querystr").val()=="")
        {
          layer.msg('查询条件不完整,无法查询,请填充完整');
        }else {
          $.ajax({
            url:encodeURI('/meets?date=' + $("#date1").val() + '&type=' + option.val() + '&querystr=' + $("#querystr").val()),
//                        data:datas,
            type:"POST",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType:"text",
            success:function(obj){
              var msg = JSON.parse(obj);
              if (!msg.code){

                layer.msg('该查询条件下,无返回的运动轨迹数据');
              }else{

                  loaddata('/meets?date=' + $("#date1").val() + '&type=' + option.val() + '&querystr=' + $("#querystr").val());
              }


            },
            error:function(error){
              //  alert("no data");
              layer.msg("没有查询到相关的轨迹数据");
            }
          });


        }
      }

    };
    $('.demo').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  });
</script>



<script type="text/javascript">
  function loaddata(url) {
    d3.json(url, function(json) {
      function GroupExplorer(wrapper,config){
        var defaultConfig={
          data:{"nodes":[],"links":[]},
          width:window.innerWidth,
          height:window.innerHeight-17,
          distance:200
        };
        $.extend(true,defaultConfig,config);
        defaultConfig.data.links.forEach(function (e) {
          if(typeof e.source!="number"&&typeof e.target!="number"){
            var sourceNode = defaultConfig.data.nodes.filter(function (n) {
                      return n.name === e.source;
                    })[0],
                    targetNode = defaultConfig.data.nodes.filter(function (n) {
                      return n.name === e.target;
                    })[0];
            e.source = sourceNode;
            e.target = targetNode;
          }
        });
        var _this=this,highlighted=null,dependsNode=[],dependsLinkAndText=[];
        this.color = d3.scale.category20();
        var zoom = d3.behavior.zoom()
                .scaleExtent([0.2,10])
                .on("zoom",function(){
                  _this.zoomed();
                });

        this.vis = d3.select("body").append("svg:svg")
                .attr("width", defaultConfig.width)
                .attr("height", defaultConfig.height)
                .call(zoom).on("dblclick.zoom", null);

        this.vis=this.vis.append('g').attr('class','all')
                .attr("width", defaultConfig.width)
                .attr("height", defaultConfig.height)


        this.force = d3.layout.force()
                .nodes(defaultConfig.data.nodes)
                .links(defaultConfig.data.links)
                .gravity(.0001)
                .distance(defaultConfig.distance)
                .charge(function(d){
                  return (-10* d.index)
                })
                .size([defaultConfig.width,defaultConfig.height])
                .start();
        this.vis.append("svg:defs").selectAll("marker")
                .data(["end"])
                .enter().append("svg:marker")
                .attr("id","arrow")
                .attr('class','arrow')
                .attr("viewBox", "0 -5 10 10")
                .attr("refX", 27)
                .attr("refY", 0)
                .attr("markerWidth", 9)
                .attr("markerHeight", 16)
                .attr("markerUnits","userSpaceOnUse")
                .attr("orient", "auto")
                .append("svg:path")
                .attr("d", "M0,-5L10,0L0,5")
                .attr('fill','#666');

        this.link = this.vis.selectAll("line.link")
                .data(defaultConfig.data.links)
                .enter().append("svg:line")
                .attr("class", "link")
                .attr('stroke-width',1)
                .attr("x1", function(d) {
                  return d.source.x;
                })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; })
                .attr("marker-end","url(#arrow)")
                .attr('stroke','#999');

        var dragstart=function(d, i) {
          _this.force.stop();
          d3.event.sourceEvent.stopPropagation();
        };

        var dragmove=function(d, i) {
          d.px += d3.event.dx;
          d.py += d3.event.dy;
          d.x += d3.event.dx;
          d.y += d3.event.dy;
          _this.tick();
        };

        var dragend=function(d, i) {
          d.fixed = true;
          _this.tick();
          _this.force.resume();
        };

        this.nodeDrag = d3.behavior.drag()
                .on("dragstart", dragstart)
                .on("drag", dragmove)
                .on("dragend", dragend);


        this.highlightObject=function(obj){
          if (obj) {
            var objIndex= obj.index;
            dependsNode=dependsNode.concat([objIndex]);
            dependsLinkAndText=dependsLinkAndText.concat([objIndex]);
            defaultConfig.data.links.forEach(function(lkItem){
              if(objIndex==lkItem['source']['index']){
                dependsNode=dependsNode.concat([lkItem.target.index])
              }else if(objIndex==lkItem['target']['index']){
                dependsNode=dependsNode.concat([lkItem.source.index])
              }
            });
            _this.node.classed('inactive',function(d){
              return (dependsNode.indexOf(d.index)==-1)
            });
            _this.link.classed('inactive', function(d) {

              return ((dependsLinkAndText.indexOf(d.source.index)==-1)&&(dependsLinkAndText.indexOf(d.target.index)==-1))
            });

            _this.linetext.classed('inactive',function(d){
              return ((dependsLinkAndText.indexOf(d.source.index)==-1)&&(dependsLinkAndText.indexOf(d.target.index)==-1))
            });
          } else {
            _this.node.classed('inactive', false);
            _this.link.classed('inactive', false);
            _this.linetext.classed('inactive', false);
          }
        };

        this.highlightToolTip=function(obj){
          if(obj){
            _this.tooltip.html("<div class='title'>"+obj.name+"的资料</div><table class='detail-info'><tr><td class='td-label'>地点：</td><td>"+obj.ap_address+"</td></tr>" +
                    "<tr><td class='td-label'>开始时间：</td><td>"+obj.start_time+"</td></tr>" +
                    "<tr><td class='td-label'>结束时间：</td><td>"+obj.last_time+"</td></tr>" +
                    "</table>")
                    .style("left",(d3.event.pageX+20)+"px")
                    .style("top",(d3.event.pageY-20)+"px")
                    .style("opacity",1.0);
          }else{
            _this.tooltip.style("opacity",0.0);
          }
        };

        this.tooltip=d3.select("body").append("div")
                .attr("class","tooltip")
                .attr("opacity",0.0)
                .on('dblclick',function(){
                  d3.event.stopPropagation();
                })
                .on('mouseover',function(){
                  if (_this.node.mouseoutTimeout) {
                    clearTimeout(_this.node.mouseoutTimeout);
                    _this.node.mouseoutTimeout = null;
                  }
                })
                .on('mouseout',function(){
                  if (_this.node.mouseoutTimeout) {
                    clearTimeout(_this.node.mouseoutTimeout);
                    _this.node.mouseoutTimeout = null;
                  }
                  _this.node.mouseoutTimeout=setTimeout(function() {
                    _this.highlightToolTip(null);
                  }, 300);
                });

        this.node = this.vis.selectAll("g.node")
                .data(defaultConfig.data.nodes)
                .enter().append("svg:g")
                .attr("class", "node")
                .call(_this.nodeDrag)
                .on('mouseover', function(d) {
                  if (_this.node.mouseoutTimeout) {
                    clearTimeout(_this.node.mouseoutTimeout);
                    _this.node.mouseoutTimeout = null;
                  }
                  _this.highlightToolTip(d);
                })
                .on('mouseout', function() {
                  if (_this.node.mouseoutTimeout) {
                    clearTimeout(_this.node.mouseoutTimeout);
                    _this.node.mouseoutTimeout = null;
                  }
                  _this.node.mouseoutTimeout=setTimeout(function() {
                    _this.highlightToolTip(null);
                  }, 300);
                })
                .on('dblclick',function(d){
                  _this.highlightObject(d);
                  d3.event.stopPropagation();
                });
        d3.select("body").on('dblclick',function(){
          dependsNode=dependsLinkAndText=[];
          _this.highlightObject(null);
        });


        this.node.append("svg:image")
                .attr("class", "circle")
                .attr("xlink:href", "/group-explorer/images/male.png")
                .attr("x", "-15px")
                .attr("y", "-15px")
                .attr("width", "30px")
                .attr("height", "30px");

        this.node.append("svg:text")
                .attr("class", "nodetext")
                .attr("dy", "30px")
                .attr('text-anchor','middle')
                .text(function(d) { return d.name })
                .attr('fill',function(d,i){
                  return _this.color(i);
                });

        this.linetext=this.vis.selectAll('.linetext')
                .data(defaultConfig.data.links)
                .enter()
                .append("text")
                .attr("class", "linetext")
                .attr("x",function(d){ return (d.source.x + d.target.x) / 2})
                .attr("y",function(d){ return (d.source.y + d.target.y) / 2})
                .text(function (d) {
                  return d.relation
                })
                .attr('fill',function(d,i){
                  return _this.color(i);
                })
                .call(this.force.drag);

        this.zoomed=function(){
          _this.vis.attr("transform","translate("+d3.event.translate+") scale("+d3.event.scale+")")
        };


        var findMaxWeightNode=function(){
          var baseWeight= 1,baseNode;
          defaultConfig.data.nodes.forEach(function(item){
            if(item.weight>baseWeight){
              baseWeight=item.weight
              baseNode=item
            }
          });
          return baseNode;
        };

        this.tick=function() {
          var findMaxWeightNodeIndex=findMaxWeightNode().index;
          defaultConfig.data.nodes[findMaxWeightNodeIndex].x = defaultConfig.width / 2;
          defaultConfig.data.nodes[findMaxWeightNodeIndex].y = defaultConfig.height / 2;
          _this.link.attr("x1", function(d) { return d.source.x; })
                  .attr("y1", function(d) { return d.source.y; })
                  .attr("x2", function(d) { return d.target.x})
                  .attr("y2", function(d) { return d.target.y;});
          _this.linetext.attr("x",function(d){ return (d.source.x + d.target.x) / 2})
                  .attr("y",function(d){ return (d.source.y + d.target.y) / 2});
          _this.node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
        };
        _this.force.on("tick", this.tick);

      }
      new GroupExplorer('body',{
        data:json
      });
    });
  }

</script>
</body>
</html>