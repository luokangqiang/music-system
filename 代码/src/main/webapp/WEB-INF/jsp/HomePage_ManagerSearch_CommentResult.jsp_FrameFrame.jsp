<!--
	管理员在搜索框中搜索特定评论内容跳转出的 管理评论内容界面的jsp
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
  
	  <!-- 评论模块 -->
	  <div class="container">
	  	<h1></h1>
	  	<h3 style="color: #6f42c1">搜索结果 ${oneDayOneWord}</h3>
	  	
	  	<c:if test="${not empty reviewManageSearchList}">
	  	<div>
 	    		<button id="deleteSelectId" class="btn btn-outline-success my-2 my-sm-0">删除选中</button>
      	</div>
      	</c:if>
	  	
	  	<div class="row content">
			<!-- 前DIV -->
			<!-- 小跳动特效框 -->
			<div class="col-sm-1">
				<div class="note">
					<i class="fas fa-music"></i>
				</div><!-- 跳动特效框 End-->
			</div><!-- 该前DIV为了中DIV居中 -->
      	    
      	    <!--中DIV -->
            <div class="col-sm-10">
            	<h6>&nbsp;</h6>
            	<h3 class="border-line" style="color: #dc3545">评论管理</h3>
            	<div class="container">
            		<div class="row content">
						  <ul class="list-group list-group-flush">
							<c:forEach items="${reviewManageSearchList}" var="review" varStatus="status">
								<li class="media list-group-item list-group-item-light" style="background-color: rgba(255, 255, 255, 0); color: #000;">
								 	<input type="checkbox" value="${review.reviewId}" aria-label="Checkbox for following text input">
					                <div class="media-left">
					                    <a href="#">
					                        <img class="rounded img-logo" src="${pageContext.request.contextPath}/image/defaultUserLogo.jpg" alt="菜鸟" >
					                    </a>
					                </div>
					                <div class="media-body">
					                    <h6 class="media-heading text-primary">${review.userName}</h6>
					
					                    <p style="color: #1b1e21">${review.review}</p>
					                    <div class="ds-comment-footer">
					                        <span class="ds-time" title="${review.reviewTime}" style="color: #1b1e21">${review.reviewTime}</span>&nbsp;
					                    </div>
					                </div>
           						  </li>
								
							</c:forEach>
						 </ul>
            		</div>
            	</div><!-- container  End-->
            	
              </div><!-- 中DIV End-->
            	
            </div><!-- row -->
            
            <!-- 后DIV -->
   		    <div class="col-sm-1">
   		    </div><!-- 该后DIV为了中DIV居中 -->
   		    
	  </div><!-- 评论模块 End-->
	  
	  <script>
	  $(function(){
		//处理删除选中
		$('#deleteSelectId').on('click', function (e) {
			var selectedIds = [];
			$('input:checkbox:checked').each(function() {
				selectedIds.push($(this).val());
	         });
			//删除
			var data = {        
			        "reviewIds": selectedIds,
			 };
		    url = "deleteReview.do";
		    $.ajax({
		    	//traditional: true[https://www.cnblogs.com/ybyi/p/6297600.html]
		    	traditional: true,
		        type:"POST",
		        url:url,
		        data:data
		    });
		    //删除后变成禁止选中状态
		    $('input:checkbox:checked').each(function() {
                $(this).attr("disabled", "disabled");
			});
		    
			
		});
	});
	</script>
      	
  </body>
</html>
