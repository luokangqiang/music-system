<!--
 	每一首歌曲的信息框 的jsp
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>高八度</title>
</head>

<body>
	<div class="col-12 <c:if test="${ (not empty myRecentPlayList) }">border</c:if>">
		<ul class="list-group list-group-flush">
			<c:forEach items="${myRecentPlayList}" var="song" varStatus="status">
				<li class="list-group-item list-group-item-light style="background-color: rgba(255, 255, 255, 0); color: #000;""
					idd="${song.songId}" title="${song.songName}">
					<!-- 歌曲信息区 -->
					<div class="clear text-ellipsis">
						<span><a href="#" class="ahover" onclick="reviewLoad(${song.songId})" style="color: #1b1e21">${status.index+1}.${song.songName}</a></span>
				 		<span class="text-danger icon-fire"></span>
					</div> <!-- 播放控制区 downloadFun(${song.songAddress})-->

					<div class="pull-right m-l fr"><!--Bootstrap 的样式类（ pull-right、m-l、fr），用于设置该元素的样式和位置-->
						<a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}">
							<i class="icon-control-play text  "></i> <!-- <i class="icon-control-pause text-active"></i> -->
						</a>
						<a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}"
							class="m-r-sm" title="下载"><i class="icon-cloud-download"></i>
						</a>
						<a href="javascript:;"
							<c:choose>
								<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
								<c:otherwise>class="collect m-r-sm"</c:otherwise>
							</c:choose>
							onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢"
							<i class="icon-heart"></i><!-- 创建一个图标元素，用于显示一个心形图标--->
						</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>