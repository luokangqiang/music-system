<!--
    搜索功能的jsp
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/note.css">
    <title>高八度</title>
	
  </head>
  <body>
  
    <div class="container">
      	<h1></h1>
      	<h3>搜索结果 ${oneDayOneWord}</h3>
      	<div class="row content hot-content">
      	    <!-- 前DIV -->
      	    <div class="col-sm-1">
                <div class="note">
                    <i class="fas fa-music"></i>
                </div><!-- 跳动特效框 End-->
            </div><!-- 该前DIV为了中DIV居中 -->
      	    
      		<!--中DIV 歌曲部分-->
            <div class="col-sm-10 h-item <c:if test="${not empty searchSongList}">border</c:if>"><!-- 中DIV -->
               
      		  <!-- One of three columns 三列中的一列-->
      		  <ul class="list-group list-group-flush" >
				
				<c:forEach items="${searchSongList}" var="song" varStatus="status">
				
                      <li class="list-group-item list-group-item-light " style="background-color: rgba(255, 255, 255, 0); color: #000;" id="${song.songId}" title="${song.songName}">
                      	<!-- 歌曲信息区 -->
                      	<!-- 歌曲信息区 -->
                      	<div class="clear text-ellipsis">
                          <span><a href="#" class="ahover" style="color: #1b1e21">${status.index+1}.${song.songName}</a></span>
                          <span class="badge badge-pill badge-primary badge-pill">${song.trendingCoefficient}</span>
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
	                         onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢"><i class="icon-heart"></i>
	                         </a>
                            <a href="#" onclick="reviewLoad(${song.songId})" style="color: #1b1e21">评论</a>
                        </div>
                        
                      </li>
                      
                   </c:forEach>
                      
                 </ul>
                 
   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
      	</div>
		
	  </div><!-- /.container -->

  </body>
</html>
