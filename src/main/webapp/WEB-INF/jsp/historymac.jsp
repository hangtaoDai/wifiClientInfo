<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Community Dectection - historymac</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- 
    Visual Admin Template
    #/preview/templatemo_455_visual_admin
    -->

    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <h1>Community Dectection</h1>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
  
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="/index"><i class="fa fa-home fa-fw"></i>首页</a></li>
            <li><a href="/historymac" class="active"><i class="fa fa-bar-chart fa-fw"></i>历史Mac</a></li>
            <li><a href="/maps"><i class="fa fa-database fa-fw"></i>运动轨迹</a></li>
            <li><a href="/communities"><i class="fa fa-map-marker fa-fw"></i>社交关系</a></li>
            <li><a href="/meetings"><i class="fa fa-users fa-fw"></i>会面详情</a></li>
            <li><a href="/login"><i class="fa fa-eject fa-fw"></i>Sign Out</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="" class="active">首页</a></li>
                <li><a href="">社交关系概览</a></li>
                <li><a href="">热点AP</a></li>
                <li><a href="login.jsp">登录/退出</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
		<!-- search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="username" id="username">
          </div>
        </form>
        <div class="templatemo-content-container">         
          <div class="templatemo-content-widget white-bg">
           
           
            <div class="panel panel-default no-border">
             <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase" align="center">用户历史Mac信息</h2></div>
                <div class="table-responsive">
                  <table class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <td align="center">No.</td>
                        <td align="center">用户名</td>
                        <td align="center">历史Mac</td>
                        <td align="center">设备类型</td>
                      </tr>
                    </thead>
                    <tbody>
                      <c:if test="${usermacs!=null}">
                        <c:forEach items="${usermacs}" var="usermacs" varStatus="vs">
                          <tr>
                            <td align="center">${vs.count}</td>
                            <td align="center"><c:out value="${username}" /></td>
                            <td align="center"><c:out value="${usermacs.userMac}" /></td>
                            <td align="center"><c:out value="${usermacs.macType}" /></td>
                          </tr>
                        </c:forEach>
                      </c:if>
<%--

                      <c:if test="${usermacs.size()==0}">
                        <tr>
                          <td>该用户名不存在</td>
                        </tr>
                      </c:if>
--%>

                    </tbody>
                  </table>    
                </div>                          
               </div>
             </div>           
            </div> <!-- Second row ends -->
     
          </div>  
        </div>
          <footer class="text-right">
            <p>Copyright &copy; 2084 Company Name 
            | Designed by <a href="#" target="_parent">templatemo</a></p>
          </footer>         
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->


    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>