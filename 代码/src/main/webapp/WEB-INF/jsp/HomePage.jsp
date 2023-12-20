<!--
	主界面jsp
-->
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

	<!-- 在<head>中添加jQuery库 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" >
	
	<!-- Animate CSS https://daneden.github.io/animate.css/-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css" >
	<!-- simple-line-icons CSS http://www.bootcdn.cn/simple-line-icons/-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont/iconfont.css">

	<!--其他css-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/HomePage.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/player.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/HomePage_Bottom_audio.css">
    <!--link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont/demo.css"-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cool.css">
  </head>

  <body>
 	<!-- 登录Modal -->
	<div class="modal fade" id="SignInModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
			  		<h5 class="modal-title" id="exampleModalCenterTitle">登录</h5>
	          		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  		<span aria-hidden="true">&times;</span>
	          		</button>
	      		</div>
	      		<div class="modal-body">
					<form class="form-signin" id="login-submit">
				  		<!-- <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
				  		<h1 class="h3 mb-3 font-weight-normal">请输入帐号和密码</h1>
		          		<label for="inputEmail" class="sr-only">Email address</label>
				  		<input type="email" id="inputEmail" class="form-control"
					 		placeholder="邮箱帐号" required autofocus oninvalid="this.setCustomValidity('请输入正确的邮箱')"
					 		oninput="setCustomValidity('')">
				  		<label for="inputPassword" class="sr-only">Password</label>
		          		<input type="password" id="inputPassword" class="form-control"
					 		placeholder="密码" required oninvalid="this.setCustomValidity('密码不能为空')"
					 		oninput="setCustomValidity('')">
		      
		          		<div class="collapse" id="collapse-error-hint">
					  		<div class="card card-body">帐号或者密码错误</div>
				  		</div>
		      
				  		<div class="checkbox mb-3">
					  		<label><input type="checkbox" value="remember-me">记住我</label>
				  		</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit" >登录</button>
				  		<!-- <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p> -->
		    		</form>
	        	</div>
	    	</div>
	    </div>
	</div><!-- 登录Modal End-->
	
	<!-- 注册Modal -->
	<div class="modal fade" id="SignUpModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalCenterTitleSignUp">注册</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>

	      		<div class="modal-body">
					<form class="form-signin" id="register-submit">
		      		<!-- <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
		      			<h1 class="h3 mb-3 font-weight-normal">请输入帐号和密码</h1>
		      			<label for="inputEmail" class="sr-only">Email address</label>
		      			<input type="email" id="inputEmail-signup" class="form-control"
							   placeholder="邮箱帐号" required autofocus oninvalid="this.setCustomValidity('请输入正确的邮箱')"
							   oninput="setCustomValidity('')">
		      			<button type="button"  class="btn btn-md btn-primary" id="get-validate-code">获取验证码</button>
		      			<input type="number" class="form-control" id="validate-code-signup"
							   placeholder="验证码" required oninvalid="this.setCustomValidity('请输入验证码')"
							   oninput="setCustomValidity('')">
		      			<label for="inputPassword" class="sr-only">Password</label>
		      			<input type="password" id="inputPassword-signup" class="form-control"
							   placeholder="密码" required oninvalid="this.setCustomValidity('密码不能为空')"
							   oninput="setCustomValidity('')">
 
			  			<label for="inputPasswordAgain" class="sr-only">Password Again</label>
			  			<input type="password" id="inputPasswordAgain-signup" class="form-control"
							   placeholder="再次输入密码" required oninvalid="this.setCustomValidity('密码不能为空')"
							   oninput="setCustomValidity('')">
		      
		      			<div class="collapse" id="collapse-error-hint-signup">
							<div class="card card-body">两次密码不一致</div>
			 			</div>
		      
			  			<button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
		      			<!-- <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p> -->
		    		</form>
	      		</div>
	    	</div>
	    </div>
	</div><!-- 注册Modal End-->

    <header id="HomePage_TopID"></header>

    <div id="hot">
		<!-- 主界面中部的顶部页面滑动 -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
        	<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          		<li data-target="#myCarousel" data-slide-to="1"></li>
          		<li data-target="#myCarousel" data-slide-to="2"></li>
        	</ol>

        	<div class="carousel-inner">
				<div class="carousel-item active">
            		<img class="first-slide" src="${pageContext.request.contextPath}/image/1.png" alt="First slide" >
          		</div>
          		<div class="carousel-item">
            		<img class="second-slide" src="${pageContext.request.contextPath}/image/3.jpg" alt="Second slide" >
          		</div>
				<div class="carousel-item">
					<img class="third-slide" src="${pageContext.request.contextPath}/image/2.png" alt="Third slide" >
			  	</div>
        	</div>

        	<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
          		<span class="sr-only">Previous</span>
        	</a>
        	<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          		<span class="carousel-control-next-icon" aria-hidden="true"></span>
          		<span class="sr-only">Next</span>
        	</a>
      	</div><!-- 页面滑动 End-->
	</div><!-- hot End -->
     
     

	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->
	<div class="container marketing" style="background-color: papayawhip">
		<br>
		<!-- Three columns of text below the carousel 轮播下方三列文本 -->
		<!--每列包含一个图像、一个标题、一个描述和一个按钮。借助 Bootstrap 网格系统，这些列被设计为响应式，根据屏幕尺寸调整其布局。这些专栏在网页上的轮播组件下宣传或突出与音乐推荐相关的不同类别-->
        <div class="row"><!--这个带有“row”类的div是 Bootstrap 网格系统的一部分，用于创建水平行来包含列-->
		<!--这是三个 Bootstrap 网格列class="col-lg-4"，每列在大屏幕上占据 12 列中的 4 个 (col-lg-4)。这将创建一个包含三个等宽列的行-->
			<div class="col-lg-4">
				<!--具有圆角圆圈类的图像 (rounded-circle)-->
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_2.png" alt="Generic placeholder image" width="300" height="300">
            	<h2>热门推荐</h2><!--标题-->
            	<p>聆听潮流的声音</p>
            	<p id="trendingRecId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p><!--带有“查看详情”链接 (<a>) 的按钮-->
          	</div><!-- /.col-lg-4 -->

          	<div class="col-lg-4">
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_1.jpeg" alt="Generic placeholder image" width="300" height="300">
            	<h2>新歌出炉</h2>
            	<p>探索新的世界</p>
            	<p id="newSongComeOutID"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
          	</div><!-- /.col-lg-4 -->

          	<div class="col-lg-4">
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_3.png" alt="Generic placeholder image" width="300" height="300">
            	<h2>个人FM</h2>
            	<p>每天早上6点更新</p><!--personalizedRecommendationId个性化推荐-->
            	<p id="personalizedRecommendationId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
          	</div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
	</div><!-- /.container End-->


	<!-- 流动在整个页面固定位置底部的播放器栏 -->
	<nav class=" fixed-bottom hide" id="playerId">
		<div class="audio-box">
			<div class="audio-container">
				<div class="audio-cover" style="background-image: url(&quot;images/cover.jpg&quot;);"></div>

				<div class="audio-view">
					<h1 class="audio-title">track stacking</h1>
					<!-- 进度条 -->
					<div class="audio-body">
						<div class="audio-backs">
							<div class="audio-this-time">00:00</div>
							<div class="audio-count-time">01:03</div>
							<div class="audio-setbacks">
								<i class="audio-this-setbacks" style="width: 0.0%;">
									<span class="audio-backs-btn"></span>
								</i>
								<span class="audio-cache-setbacks" style="width: 100%;"></span>
							</div>
						</div>
					</div>
					<!-- 控制选项 -->
					<div class="audio-btn">
						<div class="audio-select">
							<div class="audio-prev"></div>
							<!-- <div class="audio-play audio-stop"></div> -->
							<div class="audio-play"></div>
							<div class="audio-next"></div>
							<div class="icon-shuffle icon-loop" id="play-pattern" title="单曲循环"></div>
							<div class="audio-menu"></div>
							<div class="audio-volume"></div>
						</div>
						<div class="audio-set-volume">
							<div class="volume-box">
								<i style="height: 80%;"><span></span></i>
							</div>
						</div>
						<!-- 播放列表 -->
						<div class="audio-list">
							<div class="audio-list-head">
								<p>播放列表</p>
								<span class="menu-close">关闭</span>
							</div>
							<ul class="audio-inline"><li></li></ul>
						</div>
					</div><!-- 控制选项 End-->
				</div>
			</div>
		</div>
	</nav><!-- 播放器栏 End-->

	<!-- 始终固定在主界面数据下最底部，不随页面动而动 -->
      <footer class="container">
        <p class="float-right"><a href="#">返回顶部</a></p>
        <p>&copy; 2023 高八度音乐知识管理系统</p>
      </footer>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<!--相关的库文件的js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<!--功能组件的js-->
	<script src="${pageContext.request.contextPath}webapp/js/HomePage_Bottom_audio.js"></script>
	<script src="${pageContext.request.contextPath}/js/HomePage_MainJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
	
	<script>
	$(function(){
		$('#HomePage_TopID').load("HomePage_TopLoad.do");//更新“HomePage_TopID”标签的内容，即主界面顶部内容
	});
	</script>
  </body>
</html>
