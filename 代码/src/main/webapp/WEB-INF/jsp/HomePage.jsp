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
			{"04:49.00",""}
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
	<div id="myCarousel" class="carousel slide" data-ride="carousel"><!--carousel 和 slide 是 Bootstrap 框架中用于创建轮播组件的类。carousel 表示这是一个轮播组件的容器，而 slide 表示每个轮播项都是一张幻灯片-->
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
<nav class=" fixed-bottom hide" id="playerId" style="position: fixed;left: 50%;transform: translateX(-50%);"><!--一个导航栏的容器，具有固定在底部的样式 (fixed-bottom)，并且添加了一个 hide 类，可能是用于控制初始时是否隐藏-->
	<!-- 新增的播放器界面容器 -->
	<div id="playerId_newPage" class="container" style="background-image: url('/image/37.jpg'); ">
		<div id="playerId_newPage_Content" ><!-- 这里放歌词、控制按钮和评论区等内容 -->
			<!--图片在左边，占页面40%-->
			<div class="player_image" id="player_image" style="width:50%; left:50%" >
				<img src="<c:url value="/image/player.jpg"/>"  alt=""><!--图片-->
				<div class="Button_collect_download_share" id="Button_collect_download_share">
					<button class="Button_collect" id="Button_collect">收藏</button>
					<button class="Button_collect" id="Button_download">下载</button>
					<button class="Button_collect" id="Button_share">分享</button>
				</div>
			</div>
			<!--右边歌词歌名-->
			<div class="player_song" style="width:50%;right: 40%" >
				<%--				<h1>${song.songName}</h1><!--顶部是歌名-->--%>
				<h1 style="text-align: center;;color: #6f42c1">晚安</h1><!--顶部是歌名-->
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
			<h1 class="audio-title">${song.songName} -${歌手}</h1><!--音频标题的标题,即显示当前播放的歌曲名字-->
			<div class="audio-view" id="audio-view"><!--包含进度条和控制选项的容器 --> <!-- -->
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
	</div>
</nav><!-- 播放器栏 End-->

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
	$(function(){
		$('#HomePage_TopID').load("HomePage_TopLoad.do");//更新“HomePage_TopID”标签的内容，即主界面顶部内容
	});
</script>

<script>
	//click 函数来监听class="audio-cover"中的点击事件，就是点击图片那里
	$(".audio-cover").click(function() {
		$("#hot").hide(); //
		$("#playerId_newPage").show(); //显示新播放器界面
		$("#footer_session").hide(); //

//-------加载歌词数据和歌词div的代码--------------------------------------------------------------------------------------------------------
		$(document).ready(function () {
			//用于显示歌词的容器和处理音频播放的对象，同时将歌词数据进行格式化，以便在页面加载完成后进行后续的动态加载和显示
			const lyricsContainer = $("#lyrics-container");//使用 jQuery 选择器选中页面中具有 id 为 "lyrics-container" 的元素，并将其存储在 lyricsContainer 变量中。这个容器显示歌词

			const lyricsData = [
				<% for (String[] line : lyrics) { %>//使用 JSP 的 <-% for (...) { %-> 语法遍历 lyrics 这个二维字符串数组。lyrics 是在 JSP 中声明的歌词数据的 K-V 对数组。
				["<%= line[0] %>", "<%= line[1] %>"],//对于每一行歌词，通过 JSP 表达式 <-%= line[0] %-> 和 <-%= line[1] %-> 获取时间和文本，将其包装成数组 ["时间", "歌词文本"]，并将这些数组存储在 lyricsData 数组中
				<% } %>
			];
			console.log("歌词数据已动态加载:", lyricsData);//测试有没有加载歌曲数据进去
			const linesToShow = 6; // 可见的歌词行数

			// 将歌词数据动态地渲染到 HTML 页面中，并根据 isHidden 控制是否隐藏超过指定行数的歌词
			lyricsData.forEach((line, index) => {//遍历 lyricsData 数组，对于每一行歌词，提取时间和文本
				const time = line[0];//获取每行歌词开始时间
				const text = line[1];//获取每行歌词内容
				const isHidden = index >= linesToShow; // 控制显示的歌词行数
				//lyricsContainer.append(`<div class="lyric-line $ {isHidden ? 'hidden' : ''}" data-start="$ {time}">$ {text}</div>`);
				//如果当前行的索引 index 大于等于 linesToShow，则设置 isHidden 为 true，否则为 false
				lyricsContainer.append('<div id="lyric-line" style="color: orange" class="lyric-line ' + (isHidden ? 'hidden' : '') + '" data-start="' + time + '">' + text + '</div>');
			});

			const lyricLines = $(".lyric-line");//选中页面中所有具有类名 "lyric-line" 的元素，并将它们存储在 lyricLines 变量中。这些元素表示歌词的每一行

			console.log("成功动态加载了 lyric-line 元素");
//----添加歌词滚动事件：歌词容器发生滚动时，执行给定的回调函数-------------------------------------------------
			lyricsContainer.on("scroll", function () {
				const scrollPosition = $(this).scrollTop();//获取歌词容器的滚动位置
				//const lineHeight = lyricLines.first().outerHeight();//获取歌词行的高度
				const lineHeight = $(".lyric-line").outerHeight();
				console.log("Line height:", lineHeight);//检查计算结果,确保 lineHeight 的计算正确，不为零或负数
				const lineNumber = Math.floor(scrollPosition / lineHeight);//根据滚动位置和行高计算当前滚动到的歌词行数
				lyricLines.removeClass("hidden");//移除所有歌词行的 "hidden" 类，确保所有歌词可见

				// 计算起始行和结束行
				const startLine = Math.max(0, lineNumber - Math.floor(linesToShow / 2));
				const endLine = startLine + linesToShow;
				/*for (let i = startLine; i < endLine && i < lyricsData.length; i++) {
					//使用 :lt() 和 :gt() 选择器，将超过当前滚动行数加上可见行数的歌词隐藏，以保持当前滚动行数周围的歌词可见
					$(".lyric-line:lt(" + lineNumber + ")").addClass("hidden");
					$(".lyric-line:gt(" + (lineNumber + linesToShow - 1) + ")").addClass("hidden");
					//console.log("滚动了吗");//检查是否触发了滚动事件
				}*/
				// 遍历歌词行，根据当前滚动位置隐藏超出显示范围的歌词行
				lyricLines.each(function (index) {
					if (index < startLine || index >= endLine) {
						$(this).addClass("hidden");
					}
				});
			});
//-----实现歌曲播放时歌词自动滚动并高亮当前的歌词---------------------------------------------------------------------------------------------
			//const audio = new Audio();//创建一个新的 Audio 对象
			// 确保在使用函数之前完全加载 audio-player.js 脚本

			var myAudioPlayer = window['audioPlay']({
				view : ".audio-view",
				title : ".audio-title",
				cover : ".audio-cover",
				autoPlay : false,//一个布尔值，表示是否在加载页面时自动播放音频
				isLoop	: true,//: 一个布尔值，表示是否开启循环播放功能
				volume : {//一个包含有关音量控制的配置的对象
					volumeView : ".audio-set-volume",
					volumeBox : ".volume-box",
				},

				timeView : {//一个包含有关时间显示的配置的对象
					thisTime : ".audio-this-time",
					countTime : '.audio-count-time',
				},

				setbacks : {//一个包含有关进度条控制的配置的对象
					setbacks : '.audio-setbacks',
					thisSetbacks : '.audio-this-setbacks',
					cacheSetbacks : ".audio-cache-setbacks",
					volumeSetbacks : ".volume-box > i",
					volumeCircular : ".volume-box > i span"
				},

				button : {//包含各种按钮选择器的对象，用于控制音频的播放、音量、前进、后退等
					volume : ".audio-volume",
					backs : ".audio-backs-btn",
					prev : ".audio-prev",
					play : ".audio-play",
					next : ".audio-next",
					loop : ".icon-loop",
					shuffle : ".icon-shuffle",
					model   : ".audio-model",
					menu : ".audio-menu",
					menuClose : ".menu-close"
				},

				menu : {//包含有关菜单视图和列表选择器的对象
					menuView : '.audio-list',
					colse : '.close',
					list : '.audio-inline'
				},

				song : null// 一个数组，用于存储歌曲信息
			});
			// 确保插件已经初始化
			if (myAudioPlayer) {
				// 在这里使用 myAudioPlayer 对象来访问插件提供的属性和方法
				console.log('插件已初始化，当前歌曲：', myAudioPlayer.song);
				//const audio = window['audioPlay'].audio;//控制当前的小播放器
				console.dir(myAudioPlayer.audio);
				//audio里有播放器的所有特效。audio.src = "$ {song.songAddress}";//音频对象的源文件路径，路径是通过 JSP 表达式 $-{song.songAddress} 获取的。
				console.log("获取到播放歌曲路径", myAudioPlayer.audio.src);

				//在音频播放过程中，监听播放时间的更新，然后根据当前播放时间更新进度条的显示，并调用 updateLyrics 函数来更新歌词的显示状态。这样实现一个动态同步的播放进度条和歌词显示效果
				myAudioPlayer.audio.addEventListener("timeupdate", function () {
					var currentTime = myAudioPlayer.audio.currentTime;//获取当前音频的播放时间，以秒为单位，将其存储在 currentTime 变量中
					lyricLines.each(function (index, line) {// 遍历歌词行元素，找到当前播放时间对应的歌词行
						const startTime = parseFloat($(line).data("start"));
						const endTime = index < lyricLines.length - 1 ? parseFloat($(lyricLines[index + 1]).data("start")) : Infinity;
						// 如果当前播放时间在当前歌词行的时间范围内，则滚动歌词
						if (currentTime >= startTime && currentTime < endTime) {
							const offset = lyricsContainer.height() / 2 - $(line).position().top;// 计算歌词容器需要滚动的距离
							lyricsContainer.scrollTop($(line).position().top - offset);// 滚动歌词容器
							// 高亮当前歌词行
							lyricLines.removeClass("highlight"); // 移除所有歌词行的高亮类
							$(line).addClass("highlight"); // 添加高亮类到当前歌词行
							console.log("啊这，播放时在自动滚动歌词了");
							return false; // 跳出循环
						}
					});
				});
//--------点击歌词就高亮，并且进度条和播放音频也跳到相应位置------------------------------------------------------------------------------
				//进度条改变时亮的歌词也改变
				const progressBar = $("#audio-this-setbacks"); // 选择页面中具有 id 为 "audio-this-setbacks" 的进度条长度元素
				const progressBarDuration = myAudioPlayer.audio.duration; // 获取当前播放歌曲的音频总时长
				//为每行歌词添加点击事件监听器:点击哪句歌词就跳到那句歌词的播放开始时间
				lyricLines.click(function () {
					const startTime = parseFloat($(this).data("start"));//获取点击的歌词的开始时间
					myAudioPlayer.audio.currentTime = startTime; // 将当前音频播放时间设置为该值，实现点击歌词时跳转到对应的播放时间
					// 更新进度条
					const progressPercentage = (startTime / myAudioPlayer.audio.duration) * 100;//计算当前播放时间相对于音频总时长的百分比，存储在 progressPercentage 变量中。这里用到了音频的总时长 progressBarDuration
					progressBar.css("width", progressPercentage + "%");//将进度条的宽度设置为计算得到的百分比值，以实现动态更新进度条的效果。这里使用了 jQuery 的 css 方法
					// 高亮当前点击的歌词行
					lyricLines.removeClass("highlight");
					$(this).addClass("highlight");
					console.log("哈，点击歌词就高亮了");
				});

				//为 audio 元素添加了一个 timeupdate 事件监听器，该监听器在音频播放的当前时间更新时(改变进度条)触发
				myAudioPlayer.audio.addEventListener("timeupdate", function () {// 更新进度条
					const currentTime = myAudioPlayer.audio.currentTime;//获取当前音频的播放时间，以秒为单位，存储在 currentTime 变量中
					// 更新进度条
					const progressPercentage = (currentTime / progressBarDuration) * 100;//计算当前播放时间相对于音频总时长的百分比，存储在 progressPercentage 变量中。这里用到了音频的总时长 progressBarDuration
					progressBar.css("width",progressPercentage + "%");//将进度条的宽度设置为计算得到的百分比值，以实现动态更新进度条的效果。这里使用了 jQuery 的 css 方法
					console.log("嘿，更新进度条了");

					lyricLines.each(function (index, line) {// 遍历歌词行元素，找到当前播放时间对应的歌词行
						const startTime = parseFloat($(line).data("start"));
						const endTime = index < lyricLines.length - 1 ? parseFloat($(lyricLines[index + 1]).data("start")) : Infinity;

						// 如果当前播放时间在当前歌词行的时间范围内，则滚动歌词
						if (currentTime >= startTime && currentTime < endTime) {
							const offset = lyricsContainer.height() / 2 - $(line).position().top;
							lyricsContainer.scrollTop($(line).position().top - offset);
							// 高亮当前歌词行
							lyricLines.removeClass("highlight");
							$(line).addClass("highlight");
							console.log("嘿，高亮歌词改变了");
						}
					});
				});
			}else {
				console.log('插件未初始化');
			}
		});
	});


	//click 函数来监听class="player_image"中的点击事件，就是点击图片那里
	$("#player_image").click(function() {
		$("#playerId_newPage").hide();  //关闭新播放器界面
		$("#hot").show(); //
		$("#footer_session").show(); //
	});
</script>


</body>
</html>
