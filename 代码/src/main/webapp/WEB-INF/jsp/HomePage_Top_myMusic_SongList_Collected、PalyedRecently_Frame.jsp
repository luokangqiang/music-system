<!--
	用于渲染用户的歌曲收藏和最近播放列表的jsp
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<!-- 这是一个包含歌曲列表的 div，具有动态的边框样式 -->
	<!--一个包含歌曲列表的 div 元素，具有动态的边框样式。如果用户的歌曲收藏列表不为空，将添加 border 类-->
	<div class="col-12 <c:if test="${ (not empty myCollectionList) }">border</c:if>">
		<ul class="list-group li	st-group-flush"><!--一个无序列表，使用 Bootstrap 的样式，用于显示歌曲列表-->
			<!--一个 JSTL 标签库的 forEach 循环，用于迭代用户的歌曲收藏列表-->
			<c:forEach items="${myCollectionList}" var="song" varStatus="status">
				<!--每个歌曲的列表项，包含歌曲的 ID 和标题。列表项使用 Bootstrap 样式-->
				<li class="list-group-item list-group-item-light " style="background-color: rgba(255, 255, 255, 0); color: #000;" idd="${song.songId}" title="${song.songName}">
					<!-- 这是歌曲信息区的 div，包含歌曲的一些文本信息 -->
					<div class="clear text-ellipsis">
						<span><!-- 这是歌曲的链接，点击链接会执行 reviewLoad 函数，并显示歌曲的名称 -->
							<a href="#" class="ahover" onclick="reviewLoad(${song.songId})" style="color: #1b1e21">${status.index+1}.${song.songName}</a></span>
						<span class="text-muted"> -- _ _ -- </span>
						<span class="text-danger icon-fire"></span>
					</div> <!-- 播放控制区 downloadFun(${song.songAddress})-->
					<div class="pull-right m-l fr">
						<!-- 这是一个播放链接，用户点击后可以播放歌曲 -->
						<a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}">
							<i class="icon-control-play text  "></i> <!-- <i class="icon-control-pause text-active"></i> -->
						</a>
						<!-- 这是一个下载链接，用户点击后可以下载歌曲 -->
						<a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载">
							<i class="icon-cloud-download"></i>
						</a>
						<!-- 这是一个喜欢按钮，用户点击后可以收藏歌曲。按钮的样式和行为会根据歌曲是否已被收藏进行动态设置 -->
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
		</ul><!-- 歌曲列表结束 -->
	</div>
</body>
</html>