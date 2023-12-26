<!--
	每一个评论的模板 的jsp
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
	
  </head>
  <body><!--实现了一个点赞的功能，根据评论的点赞状态动态设置链接的样式，并在点击时调用js函数执行相应的操作-->
	<div class="container"><!---一个包含页面内容的容器，用于对内容进行布局和样式化-->
      		<div class="row content"><!--另一个包含页面内容的容器，用于对内容进行排列和分组-->
				  <ul class="list-group list-group-flush"><!--无序列表的标签，使用了Bootstrap的样式。list-group和list-group-flush是Bootstrap类，用于样式化列表-->
					  <!--${newReviewList}是从服务器端提交的评论列表，var="review" 允许表示每次迭代时将当前评论对象存储在名为 review 的变量中，而 varStatus="status" 则你访问迭代的状态信-->
					  <c:forEach items="${newReviewList}" var="review" varStatus="status">
						  <!--一个列表项，使用了Bootstrap的样式，包含了评论的媒体（media）元素。list-group-item 和 list-group-item-light 是 Bootstrap 类，用于样式化列表项-->
						  <li class="media list-group-item list-group-item-light" style="background-color: rgba(255, 255, 255, 0); color: #000;"><!--包含评论作者头像的媒体左侧容器-->
							  <!--评论的用户头像-->
							  <div class="media-left">
			                    <a href="#"><!--一个包含头像图片的超链接，其中href="#"表示点击头像时没有具体的链接行为-->
									<!--评论作者头像的图片，使用了Bootstrap的rounded类来添加圆角效果。${pageContext.request.contextPath}是获取应用上下文路径的EL表达式-->
			                        <img class="rounded img-logo" src="${pageContext.request.contextPath}/image/defaultUserLogo.jpg" alt="菜鸟" >
			                    </a>
			                  </div>
							  <!--评论框相关信息-->
			                  <div class="media-body"><!--评论媒体主体容器-->
								<!--显示评论作者的用户名，使用了Bootstrap的样式和EL表达式来显示评论作者-->
			                    <h6 class="media-heading text-primary">${review.userName}</h6>
								<!--评论的文本内容，使用了EL表达式来评论内容-->
			                    <p>${review.review}</p>
								<!--评论的页面脚容器，包含评论时间和点赞操作-->
			                    <div class="ds-comment-footer">
									<!--评论的时间，使用了EL表达式来显示评论时间-->
			                        <span class="ds-time" title="${review.reviewTime}">${review.reviewTime}</span>&nbsp;
									<!--用于点赞的链接(一个空的js超链接)，用于执行一些js代码而不导航到新页面-->
			                        <a href="javascript:;"/>
										<!--如果 review.whetherLiked 为真，添加 text-danger 类，表示点赞是活跃状态-->
				                        class="<c:if test="${review.whetherLiked}">text-danger</c:if>"
										<!--点击时调用JavaScript函数"likeFunc(${review.reviewId})",其中${review.reviewId}是评论的唯一标识符，用于识别是哪一条评论被点赞-->
										onclick="likeFunc(${review.reviewId})" id="newReviewLike${review.reviewId}" <!--id"newReviewLike${review.reviewId}"为链接设置唯一的标识符，通常用于在js中引用该元素-->
										title="点赞" <!--当鼠标在链接上显示悬停时，出现一个提示，提示内容为“点赞”-->
										<!--包含点赞图标的<span>元素，id属性用于在js中引用该元素，${review.likeCoefficient}显示当前评论的点赞数量-->
										<span class="icon-like" id="newReviewLikeNum${review.reviewId}">${review.likeCoefficient}</span>
									</a>
			                    </div>
			                  </div>
						</li>
						
					</c:forEach>
				 </ul>
        	 </div>
      </div><!-- 最新评论  End-->

  </body>
</html>
