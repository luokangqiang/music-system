<!--
	主界面jsp
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 在 JSP 页面中声明歌词数据的 K-V 对数组
	String[][] lyrics = {
			{"00:00.000", "作曲 : 陈志杰"},
			{"00:01.000", "作词 : 陈志杰"},
			{"00:12.62","编 曲：关天天"},
			{"00:17.620","  "},
			{"00:22.030", "窗挡住月色 贪恋的交集"},
			{"00:26.520", "在浮语虚词中交映"},
			{"00:31.150", "忙碌的身影 慢慢的长夜"},
			{"00:35.710", "去匆匆地留下感情"},
			{"00:39.990", "声色太慌张 你眼神逃避"},
			{"00:44.460", "却如此地令人着迷"},
			{"00:48.650", "为何总留恋这种 暧昧的迷离"},
			{"00:57.400", "曾经多少个牵肠拉扯不舍夜晚"},
			{"01:01.910", "到现在热情褪成陌路的感叹"},
			{"01:07.190", "何必拿真心与寂寞去纠缠"},
			{"01:14.660", "几人份的畅谈 道三两句晚安"},
			{"01:19.070", "惹多情的遐想 却轻易地走散"},
			{"01:24.360", "情意绵绵总与见异思迁为难"},
			{"01:32.630", "总是不能抵抗你信手的晚安"},
			{"01:36.720", "执迷与你忽远忽近烂桥段"},
			{"01:41.450", "迂回一句晚安 多情人却自找难堪"},
			{"01:56.500", "  "},
			{"02:08.890", "声色太慌张 你眼神逃避"},
			{"02:13.310", "却如此地令人着迷"},
			{"02:17.470", "为何总留恋这种 暧昧的迷离"},
			{"02:26.330", "曾经多少个牵肠拉扯不舍夜晚"},
			{"02:30.710", "到现在热情褪成陌路的感叹"},
			{"02:35.670", "何必拿真心与寂寞去纠缠"},
			{"02:43.380", "几人份的畅谈 道三两句晚安"},
			{"02:48.050", "惹多情的遐想 却轻易地走散"},
			{"02:53.250", "情意绵绵总与见异思迁为难"},
			{"03:01.220", "总是不能抵抗你信手的晚安"},
			{"03:05.660", "执迷与你忽远忽近烂桥段"},
			{"03:10.280", "迂回一句晚安 多情人却自找难堪"},
			{"03:20.600", "  "},
			{"03:37.230", "几人份的畅谈 道三两句晚安"},
			{"03:41.350", "惹多情的遐想 却轻易地走散"},
			{"03:46.620", "情意绵绵总与见异思迁为难"},
			{"03:54.590", "总是不能抵抗你信手的晚安"},
			{"03:59.360", "执迷与你忽远忽近烂桥段"},
			{"04:03.810", "迂回一句晚安 多情人却自找难堪"},
			{"04:12.540", "迂回一句晚安 多情的人始终难堪"},
			{"04:22.540", "总策划：唐晶晶"},
			{"04:25.910", "制作人：关天天"},
			{"04:28.130", "监 制：姚政、余竑龍"},
			{"04:30.170", "企 划：牛雪吟"},
			{"04:32.390", "统 筹：袁晓童"},
			{"04:33.820", "混 音：刘城函"},
			{"04:34.720", "吉 他：关天天"},
			{"04:36.780", "伴 唱：俞建明"},
			{"04:49.00","  "}
	};
%>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/player_newPage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/HomePage_Bottom_audio.css"><!--播放器css-->
    <!--link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont/demo.css"-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cool.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/note.css">
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

<%--    <div id="hot" style="background-image: url('/image/sun.png')">--%>
	    <div id="hot">
	<!-- 主界面中部的顶部页面滑动 -->
        <div id="myCarousel" class="carousel slide  " data-ride="carousel"><!--carousel 和 slide 是 Bootstrap 框架中用于创建轮播组件的类。carousel 表示这是一个轮播组件的容器，而 slide 表示每个轮播项都是一张幻灯片-->
        <!--data-ride="carousel"：这是一个 HTML5 自定义数据属性，它在这里用来告诉 Bootstrap 启用轮播功能。data-ride 属性的值为 "carousel"，表示这个容器将作为一个轮播组件进行操作-->
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
			<!--向左切换图片-->
        	<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
          		<span class="sr-only">Previous</span>
        	</a>
			<!--向右切换图片-->
        	<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          		<span class="carousel-control-next-icon" aria-hidden="true"></span>
          		<span class="sr-only">Next</span>
        	</a>
      	</div><!-- 页面滑动 End-->
	</div><!-- hot End -->
     
     

	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->
	<div class="container marketing" id="homepage_3Column" style="background-color: papayawhip">     <!--add if buxingma-->
		<br>
		<!-- Three columns of text below the carousel 轮播下方三列文本 -->
		<!--每列包含一个图像、一个标题、一个描述和一个按钮。借助 Bootstrap 网格系统，这些列被设计为响应式，根据屏幕尺寸调整其布局。这些专栏在网页上的轮播组件下宣传或突出与音乐推荐相关的不同类别-->
        <div class="row"><!--这个带有“row”类的div是 Bootstrap 网格系统的一部分，用于创建水平行来包含列-->
		<!--这是三个 Bootstrap 网格列class="col-lg-4"，每列在大屏幕上占据 12 列中的 4 个 (col-lg-4)。这将创建一个包含三个等宽列的行-->
			<div class="col-lg-4">
				<!--具有圆角圆圈类的图像 (rounded-circle)-->
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_2.png" alt="Generic placeholder image" width="300" height="300">
            	<h2 style="color: #dc3545">热门推荐</h2><!--标题-->
            	<p style="color: #45B6F7">聆听潮流的声音!</p>
            	<p id="trendingRecId"><a class="btn btn-secondary" href="#" role="button" style="color: white">查看详情 &raquo;</a></p><!--带有“查看详情”链接 (<a>) 的按钮-->
          	</div><!-- /.col-lg-4 -->

          	<div class="col-lg-4">
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_1.jpeg" alt="Generic placeholder image" width="300" height="300">
            	<h2 style="color: #1ab667">新歌出炉</h2>
            	<p style="color: #45B6F7">探索新的世界!</p>
            	<p id="newSongComeOutID"><a class="btn btn-secondary" href="#" role="button" style="color: white">查看详情 &raquo;</a></p>
          	</div><!-- /.col-lg-4 -->

          	<div class="col-lg-4">
            	<img class="rounded-circle" src="${pageContext.request.contextPath}/image/show_3.png" alt="Generic placeholder image" width="300" height="300">
            	<h2 style="color: #6f42c1">个人FM</h2>
            	<p style="color: #45B6F7">每天早上6点更新!</p><!--personalizedRecommendationId个性化推荐-->
            	<p id="personalizedRecommendationId"><a class="btn btn-secondary" href="#" role="button" style="color: white">查看详情 &raquo;</a></p>
          	</div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
	</div><!-- /.container End-->


	<!-- 流动在整个页面固定位置底部的播放器栏 -->
<%--	<nav class=" fixed-bottom hide" id="playerId"><!--一个导航栏的容器，具有固定在底部的样式 (fixed-bottom)，并且添加了一个 hide 类，可能是用于控制初始时是否隐藏-->--%>
	 <!--div class="allPlayer"--><!--播放界面抱在一起-->
		<!-- 新增的播放器界面容器 -->
		<div id="playerId_newPage" style="background-color: #1b1e21;margin-top: 0">
			<div id="playerId_newPage_Content" ><!-- 这里放歌词、控制按钮和评论区等内容 -->
				<div  style="width:40%; left:50%;height: 100%; margin-left:100px;">
				<!--图片在左边，占页面40%-->
				<div class="player_image" id="player_image" style="align-items: center;">
					<br><br><br><br><br><br><br><br><br>
					<img src="<c:url value="/image/player.jpg"/>"  alt=""><!--图片-->
				</div>
					<div class="Button_collect_download_share" id="Button_collect_download_share" >
						<button class="Button_share" id="Button_share" style="color: #6f42c1">分享</button>
					</div>

					<div id="overlay"></div><!--为了防止用户在弹出框显示时与其他页面元素进行交互-->
					<!--分享按钮弹出框--->
					<div id="shareModal" style="color: #e4606d;background-color: #e7e1cd">
						<span id="closeButton">&times;</span>
						<h2 style="color:purple;">在这里分享新鲜事吧</h2>
						<form id="shareForm">
							<label for="comment">评论:</label>
							<textarea id="comment" name="comment"></textarea><br>
							<button type="button" id="sharebutton" >发布</button>
						</form>
					</div>
					<br><br><br><br><br>
				</div>
				<!--右边歌词歌名-->
				<div class="player_song" style="width:60%;right: 50%;" >
					<br><br><br><br><br>
					<%--				<h1>${song.songName}</h1><!--顶部是歌名-->--%>
					<h1 style="color: #6f42c1;text-align: center; position: absolute;left: 45%;transform: translateX(-50%);width: 100px; /* 设置内层 div 的宽度，可以根据需要调整 */;">晚安</h1><!--顶部是歌名-->
					<br><br><br>
					<div id="lyrics-container"><!--歌词容器-->
						<!--歌词都有一个 data-start 属性，表示该行歌词的开始时间。当音频播放到相应时间时，对应的歌词行将高亮显示，并通过 CSS 的 transform 属性使其滑动到屏幕中央-->
						<!--这是js里会动态加载进来的每行歌词div class="lyric-line" data-start="$ {每句歌词开始时间}">$ {每句歌词}</div-->
					</div>
				</div>
			</div>
		</div>
		<!--小播放器--->
		<div class="audio-box" style="background-color: #6f42c1"><!--包含整个音频播放器的盒子-->
			<div class="audio-container"><!--包含播放器的所有内容，包括封面、标题、进度条、控制按钮等 -->
				<!--音频封面的容器，通过 background-image 设置封面图片 -->
				<div class="audio-cover" style="background-image: url(&quot;image/player.jpg&quot;);"></div>
				<!--div class="audio-cover">
					<img class="rounded-circle" src="$ {pageContext.request.contextPath}/image/player.jpg" alt="Generic placeholder image" width="20" height="20" >
				</div-->
				<div class="audio-view" id="audio-view"><!--包含进度条和控制选项的容器 --> <!-- -->
					<h1 class="audio-title" id="songName">${song.songName} -${歌手}</h1><!--音频标题的标题,即显示当前播放的歌曲名字-->
					<!-- 进度条 -->
					<div class="audio-body" id="progress-bar"><!--包含整个进度条的容器,包含了进度条的背景和其他子元素 -->
						<div class="audio-backs"><!--进度条的背景容器，包含了当前播放时间、音频总时长、进度条的整体容器以及已缓冲部分的显示 -->
							<div class="audio-this-time" id="audio-this-time">00:00</div><!--当前播放时间 -->
							<div class="audio-count-time" id="audio-count-time">${歌的总时间}</div><!--音频总时长:在服务器端获取歌曲总时长并在页面中动态渲染 -->
							<div class="audio-setbacks"><!--进度条的的整体容器，来表示实际进度，包括当前播放时间的显示 -->
								<i class="audio-this-setbacks" id="audio-this-setbacks" style="width: 0.0%;"><!--表示当前播放进度的元素。audio-this-setbacks 类的宽度通过内联样式 (style) 设置为 0%，表示初始时没有播放进度-->
									<span class="audio-backs-btn"></span><!--用于显示当前播放进度的按钮。在进度条上移动时，这个按钮会随着播放进度的变化而移动-->
								</i>
								<span class="audio-cache-setbacks" style="width: 100%;"></span><!-- 表示已缓冲部分的元素。audio-cache-setbacks 类的宽度通过内联样式 (style) 设置为 100%，表示整个进度条已经缓冲完毕-->
							</div>
						</div>
					</div>
					<!-- 控制选项 -->
					<div class="audio-btn"><!--包含所有控制按钮的容器 -->
						<div class="audio-select"><!--包含上一曲、播放/暂停、下一曲等按钮 -->
							<div class="audio-prev"></div><!--上一曲 -->
							<!-- <div class="audio-play audio-stop"></div> -->
							<div class="audio-play"></div><!--播放/暂停 -->
							<div class="audio-next"></div><!--下一曲按钮 -->
							<div class="icon-shuffle icon-loop" id="play-pattern" title="单曲循环"></div><!--单曲循环按钮 -->
							<div class="audio-menu"></div><!--播放列表按钮 -->
							<div class="audio-volume"></div><!--音量按钮 -->
						</div>
						<div class="audio-set-volume"><!--音量调节的容器 -->
							<div class="volume-box"><!--实际用于显示音量调节的元素 -->
								<i style="height: 80%;"><!-- 表示当前音量的元素，通过设置内联样式 (style) 中的高度来表示音量的大小。在这里，设置为 80%，表示初始时音量为 80% -->
									<span></span><!--用于显示当前音量的按钮或指示器-->
								</i>
							</div>
						</div>
						<!-- 播放列表 -->
						<div class="audio-list"><!--播放列表的容器，包含播放列表的头部和列表项 -->
							<div class="audio-list-head"><!--播放列表的头部，包含标题和关闭按钮 -->
								<p>播放列表</p>
								<span class="menu-close">关闭</span><!--播放列表的列表项容器 -->
							</div>
							<ul class="audio-inline"><li></li></ul><!--播放列表的列表项容器 -->
						</div>
					</div><!-- 控制选项 End-->
				</div>
			</div>
		</div><!---小播放器-->
	 <!--/div--><!--播放界面抱在一起-->

	<!-- 始终固定在主界面数据下最底部，不随页面动而动 -->
     <footer class="container" id="footer_session" style="color: #6f42c1">
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
	<script src="${pageContext.request.contextPath}/js/HomePage_Bottom_audio.js"></script>
	<script src="${pageContext.request.contextPath}/js/HomePage_MainJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
	<script>
		$("#playerId_newPage").hide(); //显示新播放器界面
	</script>
	<script>
	$(function(){
		$('#HomePage_TopID').load("HomePage_TopLoad.do");//更新“HomePage_TopID”标签的内容，即主界面顶部内容
	});
	</script>
	<script>
		$('#sharebutton').click(function() {
			var comment = $("#comment").val();
			var songName = document.getElementById("songName").innerText;
			console.log(songName);
			var jsonStr = comment + "@" + songName;
			console.log('分享内容：',jsonStr);
			if (jsonStr) {
				$.ajax({
					url: 'postFriendActivity.do',
					type: 'POST',
					contentType: 'application/json;charset=UTF-8',
					data: JSON.stringify({ activityContent: jsonStr }),
					success: function(backEndResponse) {
						alert(backEndResponse);
						$('#shareForm').hide();
					},
					error: function(xhr, status, error) {
						alert("发动态失败");
					}
				});
			} else {
				alert("动态内容不能为空");
				return;
			}
		});
	</script>

    <script>
		//click 函数来监听class="audio-cover"中的点击事件，就是点击图片那里
		$(".audio-cover").click(function() {
			$("#hot").hide(); //
			$('#homepage_3Column').hide();//隐藏底部的3个导航栏
			$("#footer_session").hide(); //
			$("#playerId_newPage").show(); //显示新播放器界面

		$(document).ready(function () {
			$('#Button_share').click(function() {//为“分享添加点击事件”
				$('#shareModal, #overlay').fadeIn();//点击“分享”按钮时，$('#shareModal, #overlay').fadeIn(); 会使分享框和遮罩层渐显
			});

			$('#closeButton').click(function() {//“关闭”点击事件
				$('#shareModal, #overlay').fadeOut();//点击关闭按钮或发布按钮时，$('#shareModal, #overlay').fadeOut(); 会使它们渐隐
			});

			$('#submitButton').click(function() {//"发布"点击事件
				const username = $('#username').val();//获取用户名输入
				const comment = $('#comment').val();//获取评论输入
				const imageInput = $('#imageInput').val();//获取图片输入
				const currentTime = new Date().toLocaleString();//获取当前时间
				// 控制台显示数据，需要更改传递方式
				// console.log('用户名:', username);//
				// console.log('评论:', comment);//
				// console.log('图片路径:', imageInput);//
				// console.log('当前时间:', currentTime);//
				$('#shareModal, #overlay').fadeOut();// 提交后自动关闭分享框
			});
			//const audio = new Audio();//创建一个新的 Audio 对象
			// 确保在使用函数之前完全加载 audio-player.js 脚本
			// 保存原始的 window['audioPlay'] 函数
			const originalAudioPlay = audioFn;
			// 将函数分配给 myAudioPlayer
			const myAudioPlayer = originalAudioPlay;
			//const myAudioPlayer = window['audioPlay']();
			// 确保插件已经初始化
				if (myAudioPlayer) {
//-------加载歌词数据和歌词div的代码--------------------------------------------------------------------------------------------------------
					const lyricsData = [
						<% for (String[] line : lyrics) { %>//使用 JSP 的 <-% for (...) { %-> 语法遍历 lyrics 这个二维字符串数组。lyrics 是在 JSP 中声明的歌词数据的 K-V 对数组。
						["<%= line[0] %>", "<%= line[1] %>"],//对于每一行歌词，通过 JSP 表达式 <-%= line[0] %-> 和 <-%= line[1] %-> 获取时间和文本，将其包装成数组 ["时间", "歌词文本"]，并将这些数组存储在 lyricsData 数组中
						<% } %>
					];
					console.log("歌词数据已动态加载:", lyricsData);//测试有没有加载歌曲数据进去
					function parseTimeToSeconds(timeString) {
						const [minutes, seconds] = timeString.split(":").map(parseFloat);
						const milliseconds = seconds * 1000 + minutes * 60 * 1000;
						return milliseconds / 1000; // 转换为秒
					}

					const linesToShow = 6; // 可见的歌词行数

					//用于显示歌词的容器和处理音频播放的对象，同时将歌词数据进行格式化，以便在页面加载完成后进行后续的动态加载和显示
					const lyricsContainer = $("#lyrics-container");//使用 jQuery 选择器选中页面中具有 id 为 "lyrics-container" 的元素，并将其存储在 lyricsContainer 变量中。这个容器显示歌词

					// 将歌词数据动态地渲染到 HTML 页面中，并根据 isHidden 控制是否隐藏超过指定行数的歌词
					lyricsData.forEach((line, index) => {//遍历 lyricsData 数组，对于每一行歌词，提取时间和文本
						const time = line[0];//获取每行歌词开始时间
						const text = line[1];//获取每行歌词内容
						const isHidden = index >= linesToShow; // 控制显示的歌词行数,如果当前行的索引 index 大于等于 linesToShow，则设置 isHidden 为 true，否则为 false
						const isHighlighted = false; // 这里的 endTime 需要根据你的逻辑计算
						// 生成 class 字符串
						let classString = 'lyric-line';
						if (isHidden) {
							//classString += ' hidden';
						}
						if (isHighlighted) {
							classString += ' highlight';
						}
						//lyricsContainer.append(`<div class="lyric-line $ {isHidden ? 'hidden' : ''}" data-start="$ {time}">$ {text}</div>`);
						// 使用生成的 class 字符串创建元素
						lyricsContainer.append('<div id="lyric-line" style="color: #e7e1cd" class="' + classString + '" data-start="' + time + '">' + text + '</div>');
					});

					const lyricLines = $(".lyric-line");//选中页面中所有具有类名 "lyric-line" 的元素，并将它们存储在 lyricLines 变量中。这些元素表示歌词的每一行

					console.log("成功动态加载了 lyric-line 元素");
					/*for (let i = 0; i < lyricLines.length; i++) {
						console.log(lyricLines[i]);
					}*/

					// 在这里使用 myAudioPlayer 对象来访问插件提供的属性和方法
					console.log('插件已初始化，当前歌曲：', originalAudioPlay.song);
					//const audio = window['audioPlay'].audio;//控制当前的小播放器
					console.dir(originalAudioPlay.audio);
					//audio里有播放器的所有特效。audio.src = "$ {song.songAddress}";//音频对象的源文件路径，路径是通过 JSP 表达式 $-{song.songAddress} 获取的。
					console.log("获取到播放歌曲路径", originalAudioPlay.audio.src);

					myAudioPlayer.audio.addEventListener("timeupdate", function () {
						const lyricContainer = $("#lyrics-container"); // 歌词容器选择器
						const currentTime = myAudioPlayer.audio.currentTime;//获取当前播放时间
						// 判断音频是否从头开始播放
						console.log("其他歌曲播放时间currentTime:",currentTime,"myAudioPlayer.audio.currentTime:",myAudioPlayer.audio.currentTime);
						if (currentTime === 0) {
				//---刚开始播放时自动从头开始滚动歌词----------------------------------------------------------
							const currentTime = myAudioPlayer.audio.currentTime;//获取当前播放时间
							console.log("音频已经从头开始播放currentTime:",currentTime,"myAudioPlayer.audio.currentTime:",myAudioPlayer.audio.currentTime);

							//lyricLines.removeClass("hidden");
							const lyricLines = $(".lyric-line");
							lyricContainer.scrollTop=0; // 将歌词容器滚动到顶部
							// 遍历歌词行，找到当前播放的歌词行
							lyricLines.removeClass("highlight");// 先移除全部歌词行的高亮样式
							$(lyricLines[0]).addClass("highlight");//高亮第一句歌词
							lyricContainer.animate({ scrollTop: 0  }, 300);//在 300 毫秒内将歌词容器的滚动位置平滑地滚动到顶部第一句歌词位置，实现了一个视觉上平滑的滚动效果
						}else{//当前音频播放时间不是开始时

							/* 进度条改变时亮的歌词也改变
							const progressBar = $("#audio-this-setbacks"); // 选择页面中具有 id 为 "audio-this-setbacks" 的进度条长度元素
							const progressBarDuration = myAudioPlayer.audio.duration; // 获取当前播放歌曲的音频总时长*/

				//----在播放过程中自动滚动并高亮当前播放歌词-------------------------------------------------
							myAudioPlayer.audio.addEventListener("timeupdate", function () {
								let currentTime = myAudioPlayer.audio.currentTime;//获取当前播放时间

								const lyricLines = $(".lyric-line"); // 选中页面中所有具有类名 "lyric-line" 的元素
								//lyricLines.removeClass("hidden");
								lyricLines.removeClass("highlight"); // 先移除全部歌词行的高亮样式
								/* 更新进度条
								const progressPercentage = (currentTime / progressBarDuration) * 100;//计算当前播放时间相对于音频总时长的百分比，存储在 progressPercentage 变量中。这里用到了音频的总时长 progressBarDuration
								progressBar.css("width",progressPercentage + "%");//将进度条的宽度设置为计算得到的百分比值，以实现动态更新进度条的效果。这里使用了 jQuery 的 css 方法
								*/
								for (let i = 0; i < lyricLines.length; i++) {
									const startTime = parseTimeToSeconds($(lyricLines[i]).data("start"));// 获取歌词行的开始时间
									const endTime = i < lyricLines.length - 1 ? parseTimeToSeconds($(lyricLines[i + 1]).data("start")) : Infinity;// 获取下一行歌词的开始时间，最后一行歌词的结束时间为无穷大
									// 判断当前播放时间是否在当前歌词行的时间范围内
									if (currentTime >= startTime && currentTime < endTime) {
										$(lyricLines[i]).addClass("highlight");// 高亮当前播放的歌词行，可以添加自定义的高亮样式
										//console.log("嘿，在不停播放时高亮歌词改变了");
										//console.log("这句歌词startTime:", startTime);
										//console.log("这句歌词currentTime:", currentTime);
										//console.log("这句歌词endTime:", endTime);
										//console.log("lyricLines:", lyricLines);
										//console.log("这句歌词是lyricLines[i]:", lyricLines[i]);
										console.log("其他地方的offsetTop是:", lyricLines[i].offsetTop);
										// 滚动到当前播放的歌词行
										const lineHeight = lyricLines.first().outerHeight();//lyricLines 是通过 $(".lyric-line") 选择的所有歌词行元素。lyricLines.first() 返回的是第一个匹配元素，然后使用 outerHeight() 获取该元素的外部高度，包括上下边距
										const lyricContainerOffset = lyricContainer.offset().top;
										const scrollTo = lyricLines[i].offsetTop - lyricContainerOffset - lyricContainer.height() / 2 + lineHeight / 2;
										lyricContainer.scrollTop=scrollTo;
										// console.log("lyricContainer.height():", lyricContainer.height());
										// console.log("lineHeight:", lineHeight);
										// console.log("scrollTo:", scrollTo);

										const linesToShow = 9;//设置可见的歌词行数
										//const lineNumber = Math.floor(currentTime / lineHeight); // 计算当前滚动行数：currentTime 是 500 毫秒，而 lineHeight 是 50 像素，那么 lineNumber 就是 Math.floor(500 / 50)，结果是 10。这意味着经过 500 毫秒后，你大约在内容顶部向下移动了 10 行
										// 计算起始行和结束行
										const startLine = Math.max(0, i - Math.floor(linesToShow / 2));
										const endLine = startLine + linesToShow;
										// 遍历歌词行，只显示起始行到结束行的歌词
										lyricLines.each(function (index) {
											if (index >= startLine && index < endLine) {
												$(this).removeClass("hidden");
											} else {
												$(this).addClass("hidden");
											}
										});
										break;// 跳出循环，因为已经找到了当前播放的歌词行
									} else {
										$(lyricLines[i]).removeClass("highlight");// 移除其他歌词行的高亮样式
									}
								}
							});

				//--当前歌词被点击时触发------------------------------------------
							lyricLines.on("click", function () {//为每行歌词添加点击事件监听器:点击哪句歌词就跳到那句歌词的播放开始时间
								const lyricLines = $(".lyric-line");
								lyricLines.removeClass("hidden");
								const startTime = parseTimeToSeconds($(lyricLines[i]).data("start"));// 获取歌词行的开始时间
								const endTime = i < lyricLines.length - 1 ? parseTimeToSeconds($(lyricLines[i + 1]).data("start")) : Infinity;// 获取下一行歌词的开始时间，最后一行歌词的结束时间为无穷大

								myAudioPlayer.audio.currentTime = startTime; // 将当前音频播放时间设置为该值，实现点击歌词时跳转到对应的播放时间
								/* 更新进度条
								const progressPercentage = (startTime / myAudioPlayer.audio.duration) * 100;//计算当前播放时间相对于音频总时长的百分比，存储在 progressPercentage 变量中。这里用到了音频的总时长 progressBarDuration
								progressBar.css("width", progressPercentage + "%");//将进度条的宽度设置为计算得到的百分比值，以实现动态更新进度条的效果。这里使用了 jQuery 的 css 方法

								let currentTime = myAudioPlayer.audio.currentTime;//获取当前播放时间
								const linesToShow = 6;// 设置可见的歌词行数
								const lineHeight = lyricLines.first().outerHeight();// .first() 选择器用于获取第一个匹配元素，即第一行歌词,outerHeight() 方法用于获取第一个匹配元素的外部高度，包括元素的高度和（如果有的话）上下边距,即获取歌词行的高度
								const lineNumber = Math.floor(currentTime / lineHeight);// 计算当前滚动行数
								// 计算起始行和结束行
								const startLine = Math.max(0, lineNumber - Math.floor(linesToShow / 2));
								const endLine = startLine + linesToShow;
								// 遍历歌词行，只显示起始行到结束行的歌词
								lyricLines.each(function (index) {
									if (index >= startLine && index < endLine) {
										$(this).removeClass("hidden");
									} else {
										$(this).addClass("hidden");
									}
								});*/
								// 判断当前播放时间是否在当前歌词行的时间范围内
								if (currentTime >= startTime && currentTime < endTime) {
									lyricLines.removeClass("highlight");//清除所有高亮歌词
									$(lyricLines[i]).addClass("highlight");// 高亮当前播放的歌词行，可以添加自定义的高亮样式
									console.log("哈，点击这句歌词就高亮了");
								}
							});

						}<!--if (currentTime === 0) {}结束-->
					});<!--myAudioPlayer.audio.addEventListener("timeupdate", function () {}结束-->
				}else {
					console.log('插件未初始化');
				}<!--if (myAudioPlayer) {}结束-->
			});<!--$(document).ready(function () {}结束-->
		});<!--$(".audio-cover").click(function() {}结束-->


		//click 函数来监听class="player_image"中的点击事件，就是点击图片那里
		$("#player_image").click(function() {
			$("#playerId_newPage").hide();  //关闭新播放器界面
			$("#hot").show(); //
			$("#footer_session").show(); //
		});
	</script>


  </body>
</html>
