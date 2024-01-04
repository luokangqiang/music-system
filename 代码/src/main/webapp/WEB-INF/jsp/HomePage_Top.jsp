<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>高八度</title>
	
</head>

<body style="background-color: #6f42c1;">
  <!--navbar是 Bootstrap 导航栏的基本类，用于定义一个导航栏组件。
     navbar-expand-md是 Bootstrap 提供的类，用于在中型屏幕及以上设备上启用导航栏的扩展功能。具体来说，在中型设备（md）及以上，导航栏的内容会水平排列，而在小型设备上，导航栏的内容会折叠成一个按钮。
     navbar-light: 这是 Bootstrap 提供的类，用于定义导航栏的颜色方案。在这里，navbar-light 表示导航栏使用浅色的背景和文本。
     fixed-top: 这是 Bootstrap 提供的类，用于使导航栏固定在页面顶部。这意味着当用户滚动页面时，导航栏会保持可见。
     bg-light: 这是 Bootstrap 提供的类，用于定义导航栏的背景颜色。在这里，bg-light 表示导航栏的背景颜色是浅色-->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"><!--所有功能的导航栏-->
      <!--这个代码表示导航栏的品牌是一个链接，点击该链接将跳转到$ {pageContext.request.contextPath}/index.do这个地址，品牌文本显示为"高八度"-->
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do" style="color: #6f42c1">高八度</a><!--navbar-brand"是 Bootstrap 提供的类，用于定义导航栏中的品牌元素-->
      <!--这个代码表示一个用于切换导航栏可见性的按钮，点击该按钮将展开或折叠具有 ID navbarCollapse 的导航栏部分-->
      <!--class="navbar-toggler"是 Bootstrap 提供的类，用于定义导航栏切换按钮的样式
          type="button"：指定按钮的类型为按钮（button）
          data-toggle="collapse"是 Bootstrap 的数据属性，用于指定切换元素的行为，这里表示切换折叠元素的可见性
          data-target="#navbarCollapse"是指定切换的目标元素的 ID，即要切换折叠的导航栏部分
          aria-controls="navbarCollapse"：这是辅助技术使用的属性，表示与该按钮相关联的折叠区域的 ID
          aria-expanded="false"：这是辅助技术使用的属性，表示切换按钮的当前状态，"false" 表示未展开
          aria-label="Toggle navigation"：这是辅助技术使用的属性，提供了一个描述性的标签，用于描述切换按钮的作用
      -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
              aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span><!--<span>元素包含了一个具有类 navbar-toggler-icon 的图标，这是 Bootstrap 提供的默认切换图标-->
      </button>

      <!--collapse是Bootstrap提供的一个类，用于表示元素应该最初处于折叠状态。通过js或用户的交互操作，可以将其展开。
          navbar-collapse: 这是Bootstrap导航栏组件的一部分，表示这是一个导航栏的折叠内容部分。
          id="navbarCollapse": 这是该折叠内容区域的唯一标识符（ID）。通过这个ID可以通过js或链接（例如导航链接）来触发导航栏的展开或折叠-->
      <div class="collapse navbar-collapse" id="navbarCollapse"><!--除了“高八度”之外 的导航栏-->
          <!--navbar-nav是 Bootstrap 提供的类，用于表示这是一个导航栏的导航菜单（nav menu）。
          这个类设置了适当的样式，以使 <ul> 元素在导航栏中呈现为水平菜单。
          mr-auto: 这是 Bootstrap 的 utility 类之一，用于设置右外边距（margin-right）为 auto，从而将导航菜单推到导航栏的右侧。这通常用于将导航菜单推送到导航栏的右侧，以占用剩余的空间。
          在这个导航栏中，<ul> 元素包含了导航链接（<li> 元素），并使用 Bootstrap 提供的样式类来确保良好的外观和行为-->
          <ul class="navbar-nav mr-auto"><!--左边4个功能 的导航栏-->
              <li class="nav-item" id="exploringId"><!--这是一个列表项，具有类 "nav-item" 。"nav-item" 通常用于表示导航栏中的项，而 "exploringId" 可能是用于标识该列表项的唯一标识符-->
                  <a class="nav-link" href="#" style="color: #e7e1cd">发现音乐</a><!--在列表项中的链接元素。它有一个类名 "nav-link"，通常用于定义导航链接的样式。href="#" 表示链接的目标是当前页面，因为 "#" 通常用作空链接。文本内容是 "发现音乐"，它将显示为用户可单击的可点击文本-->
              </li>
              <li class="nav-item" id="rankingId">
                  <a class="nav-link" href="#" style="color: #e7e1cd">排行榜</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#" onclick="myMusicPage()" style="color: #e7e1cd">我的音乐</a>
              </li>
              <li class="nav-item" id="Friends_ActivityId">
                  <a class="nav-link" href="#"  onclick="Friends_Activity_Page()" style="color: #e7e1cd">音乐空间</a>
              </li>
          </ul>

          <form class="form-inline mt-2 mt-md-0" id="searchFormId"><!--管理员搜索去控制 的导航栏-->
          	<c:if test="${sessionScope.isHasPrivilege}">
          	    <select class="custom-select-override " id="inputGroupSelect01" name="mode"><!--管理员可以选择搜索的类型-->
			        <option value="0" selected>音乐管理</option>
			        <option value="1">用户管理</option>
			        <option value="2">评论管理</option>
 		  	    </select>
 		  	</c:if>
            <input class="form-control mr-sm-2" id="searchInputId" type="text"
                   placeholder="音乐" aria-label="Search" name="keyword" required autofocus oninvalid="this.setCustomValidity('搜索内容不能为空')"
                   oninput="setCustomValidity('')">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
          </form>

          <ul class="navbar-nav mr-auto"><!--登录/注册 的导航栏-->
              <li class="nav-item dropdown" <c:if test="${sessionScope.user!=null}">style="display:none;"</c:if> >
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                     role="button"  aria-haspopup="true"
					 aria-expanded="false" data-toggle="modal" data-target="#SignInModalCenter" style="color: #e7e1cd"> 登录 </a>
              </li>
              <li class="nav-item dropdown" <c:if test="${sessionScope.user!=null}">style="display:none;"</c:if>>
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					 role="button"  aria-haspopup="true"
					 aria-expanded="false" data-toggle="modal" data-target="#SignUpModalCenter" style="color: #e7e1cd"> 注册 </a>
              </li>
          </ul>

          <ul class="navbar-nav"><!--退出 的导航栏-->
              <li id="logout" class="nav-item " <c:if test="${sessionScope.user==null}">style="display:none;"</c:if>>
                  <a class="nav-link " href="${pageContext.request.contextPath}/logout.do" role="button" style="color: #dc3545"> 退出 </a>
              </li>
          </ul>
      </div>
  </nav>
      
  <script>
	$(function(){
        //在导航栏里点击“发现音乐”和“热门推荐”时触发同一个explorin(trending rec)
        $('#exploringId,#trendingRecId').on('click', function (e) {
            $('#hot').load("trendingRecFrameLoad.do");
            $('#homepage_3Column').hide();//隐藏底部的3个导航栏
            $("#playerId").show();//显示播放器
            $('#playerId').load("player.do");//启动播放器
            $("#playerId_newPage").hide();
        });
        //在导航栏里点击“排行榜”时触发ranking page;
        $('#rankingId').on('click', function (e) {
            $('#hot').load("rankingFrameLoad.do");
            $('#homepage_3Column').hide();//隐藏底部的3个导航栏
            $("#playerId").show();//显示播放器
            $('#playerId').load("player.do");//启动播放器
            $("#playerId_newPage").hide();
        });

		//在导航栏里点击“搜索”时触发search page
		$("#searchFormId").submit(function(){
			$('#hot').load("searchFrameLoad.do",$('#searchFormId').serialize() );
            $('#homepage_3Column').hide();//隐藏底部的3个导航栏
			$("#playerId").show();//显示播放器
            $('#playerId').load("player.do");//启动播放器
            $("#playerId_newPage").hide();
	        return false;
		});
		//管理员点击搜索框时有3个选项change search Placeholder content
		$('#inputGroupSelect01').on('change', function (e) {
			mode=$('#inputGroupSelect01').val();
			if(mode==0){//音乐管理
				$('#searchInputId').attr('placeholder',"音乐");
			}else if(mode==1){//用户管理
				$('#searchInputId').attr('placeholder',"用户/邮箱");
			}else if(mode=2){//评论管理
				$('#searchInputId').attr('placeholder',"评论");
			}
		});


        //点击“新歌出炉”那里的部分触发new track on shelf rec
        $('#newSongComeOutID').on('click', function (e) {
            $('#hot').load("NewTrackOnShelfFrameLoad.do");
            $('#homepage_3Column').hide();//隐藏底部的3个导航栏
            $("#playerId").show();//显示播放器
            $('#playerId').load("player.do");//启动播放器
            $("#playerId_newPage").hide();
        });
        //点击“个人FM”那里的部分触发personalized rec
        $('#personalizedRecommendationId').on('click', function (e) {
            $('#hot').load("personalizedRecFrameLoad.do");
            $('#homepage_3Column').hide();//隐藏底部的3个导航栏
            $("#playerId").show();//显示播放器
            $('#playerId').load("player.do");//启动播放器
            $("#playerId_newPage").hide();
        });
	});
  </script>
      
</body>
</html>
