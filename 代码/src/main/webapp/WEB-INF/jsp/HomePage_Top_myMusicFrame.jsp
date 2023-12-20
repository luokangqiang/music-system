<!--
	"我的音乐"功能的jsp代码
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
    <title>Track Stacking</title>


  </head>

  <body>
   	<div class="container">
      	<h1></h1>
		<!--<h3>标签用于定义一个三级标题，显示的文本内容是"我的音乐"，后面通过嵌入JS表达式${oneDayOneWord}插入了动态的内容-->
      	<h3 style="color: #6f42c1">我的音乐 ${oneDayOneWord}</h3><!--${oneDayOneWord}可能代表一个变量或者从服务器端获取的数据，它会在运行时被实际的值替代-->
      	<div class="row content hot-content">
      	    <!-- 前DIV -->
      	    <div class="col-sm-1">
      	        <!-- 小跳动特效框 -->
      	    	<div class=" ">
                        <span class="musicbar animate bg-empty inline m-r-lg m-t" style="width:50px;height:60px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                </div><!-- 小跳动特效框 End-->
      	    </div><!-- 该前DIV为了中DIV居中 -->
      	    
      		<!--中DIV 歌曲部分-->
            <div class="col-sm-10 h-item" id="mytest"><!-- 中DIV -->
      		  <!-- One of three columns -->
      			

		<div class="row">
		  <div class="col-4">
		    <div class="list-group" id="list-tab" role="tablist">
				<!--点击主界面的“我的音乐”后显示跳转出标签“list-home（我的收藏）”和“list-profile（最近播放）”-->
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">我的收藏</a>
		      <a class="list-group-item list-group-item-action " id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">最近播放</a>
		    </div>
		  </div>
		  <div class="col-8">
			    <div class="tab-content" id="nav-tabContent">
			      <!-- 我的收藏 -->
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      		  <ul class="list-group list-group-flush" >
							<c:forEach items="${myCollectionList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         <%-- <c:if test="${song.whetherCollected}">class="collect m-r-sm text-danger" </c:if> --%>
				                         	onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢">
											<i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 我的收藏 End-->
			      <!-- 最近播放 -->
			      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
			      		<ul class="list-group list-group-flush" >
							<c:forEach items="${myRecentPlayList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songAddress}"  data-duration="${song.songLength}" data-name="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l option fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         	onclick="collectFunc(${song.songId})" id="second${song.songId}" title="喜欢">
											<i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 最近播放 End-->
			      </div>
			    </div>
	  	</div>
	</div>
      		

   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
  	</div>
  	
  	<script>///jQuery.js代码主要处理页面中的标签切换，通过使用 AJAX 的方式加载不同的内容,实现动态刷新页面部分内容的效果
	//$(function(){ ... });：这是 jQuery 的文档就绪函数，表示在文档加载完成后执行其中的代码
	$(function(){//"collectedFrameLoad.do"是一个URL（在controller.MyMusicPageController.java里），
				// 通常用于向服务器发起请求，获取特定内容或数据
				// 但现在是一个服务器端的处理程序，负责处理请求并返回相应的HTML、JSON或其他数据格式。这个处理程序会查询数据库或其他数据源，然后生成用于显示收藏列表的内容
		$('#list-home').load("collectedFrameLoad.do");// 在页面加载完成后，首次加载“list-home(我的收藏)”标签内容,通过 AJAX 请求将 "collectedFrameLoad.do" 的返回内容放入 ID 为 "list-home" 的元素中
		//为 ID 为 "list-tab" 的元素下的链接（a 标签）添加点击事件处理程序。当点击链接时，执行内部的函数
		$('#list-tab a[href="#list-home"]').on('click', function (e) {//处理我的收藏tab切换，响应动作为“click（点击）”。
			$('#list-home').load("collectedFrameLoad.do");// 点击“我的收藏”标签时，再次加载“我的收藏”标签内容，以刷新显示最新的收藏列表
		});
		//为 ID 为 "list-tab" 的元素下的链接（a 标签）添加点击事件处理程序。当点击链接时，执行内部的函数
		$('#list-tab a[href="#list-profile"]').on('click', function (e) {//处理最近播放tab切换，响应动作为“click（点击）”
			$('#list-profile').load("recentFrameLoad.do");  // 点击“最近播放”标签时，加载“最近播放”标签的内容，以刷新显示最新的最近播放列表
		});
	});
	</script>

  </body>
</html>
