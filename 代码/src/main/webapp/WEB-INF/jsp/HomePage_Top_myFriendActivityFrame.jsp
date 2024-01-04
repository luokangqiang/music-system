<!--
FriendActivityExample
文件结构：
1. 仅一个文件，全部内容都在这个文件中。
2. 前一半都是css。
3. 后一半都是html和js，其中js按书写位置分为两类：
    a. 如果这段js代码是某个组件马上要用的，就紧跟在组件后。
    b. 其余的js代码，做的设置是对全局生效的，都会写在结尾。
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="top.stu.musicsystem.model.FriendActivity" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Track Stacking</title>

    <title>Component</title>
    <style> /* 前半是 css */
        /* 用户名样式 */
        .username {
            color: blue;
            text-decoration: none; /* 去除链接默认下划线 */
        }

        .username:hover {
            text-decoration: underline; /* 鼠标悬停时显示下划线 */
        }

        /* 用户头像和用户名布局样式 */
        .avatar-container {
            display: flex;
            align-items: center;
            margin-right: 10px;
        }

        .user-info {
            margin-left: 10px; /* 设置用户名和头像的间距 */
        }

        /* 设置字体大小和颜色 */
        .text-sm {
            font-size: 12px; /* 较小的字体大小 */
        }

        .text-xs {
            font-size: 10px; /* 更小的字体大小 */
        }

        .text-lg {
            font-size: 16px; /* 较大的字体大小 */
        }

        /* 创建一个浅灰色的框 */
        .gray-box {
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 5px;
        }

        /* 设置歌曲详情的样式 */
        .song-details {
            display: flex;
            align-items: center;
        }

        /* 设置歌曲封面的样式 */
        .song-cover {
            border-radius: 50%;
            overflow: hidden;
            width: 50px;
            height: 50px;
        }

        /* 给按钮设置样式 */
        .activity-like-button {
            background: none;
            border: none;
            cursor: pointer;
            color: #3498db;
            margin-left: auto;
        }

        /* 设置按钮之间的间距 */
        .activity-like-button + .activity-like-button {
            margin-left: 10px;
        }

        .header-text {
            text-align: left;
            font-size: 1.5em;
            margin-top: 20px;
            float: left;
        }

        /* 定义图标样式 */
        .icon-pencil {
            display: inline-block;
            width: 20px; /* 图标宽度 */
            height: 20px; /* 图标高度 */
            background-image: url('${pageContext.request.contextPath}/friend-activity-resources/pencil.svg'); /* 图标路径 */
            background-size: cover; /* 图标大小适应 */
            background-repeat: no-repeat; /* 不重复显示图标 */
            margin-right: 10px; /* 调整图标与按钮文本间的间距 */
            vertical-align: middle; /* 垂直居中对齐 */
        }

        /* 按钮样式 */
        .circle-button {
            width: 120px; /* 按钮宽度 */
            height: 50px; /* 按钮高度 */
            border-radius: 25px; /* 使按钮变成椭圆形 */
            background-color: #3498db; /* 按钮背景颜色 */
            color: white; /* 按钮文字颜色 */
            border: none;
            float: right;
            padding-left: 10px; /* 调整按钮文本与图标之间的间距 */
        }

        .divider-brown-red {
            border: none;
            border-top: 2px solid #8b0000; /* 红色边框 */
            margin-top: 10px;
            clear: both; /* 清除浮动元素 */
        }

        .divider {
            border: none;
            border-top: 1px solid #808080; /* 深灰色分隔线 */
            margin-top: 2px;
        }

        .divider-grew {
            border: none;
            border-top: 2px solid #c5c5c5; /* 白灰色分隔线 */
            margin-top: 2px;
        }


        /* post框样式 */
        .post-box {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 480px;
            height: 270px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* post框的头部样式 */
        .header {
            background-color: #654321; /* 深褐色 */
            color: white;
            font-weight: bold;
            padding: 5px;
        }

        /* 文本框样式 */
        .text-area {
            width: 100%;
            height: 120px;
            margin-top: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        /* 音乐选择框样式 */
        .music-select {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .music-icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            background: red; /* 红色音符logo */
            margin-right: 5px;
        }

        /* 按钮样式 */
        .buttons {
            margin-top: 10px;
        }

        /* 隐藏元素样式 */
        .hidden {
            display: none;
        }

        /* 评论区域样式 */
        .comments {
            background-color: #f0f0f0; /* 灰色背景 */
            padding: 10px;
            margin-top: 10px;
        }

        .comment-textarea {
            width: 100%;
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .post-comment-button {
            background-color: blue;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            float: right;
        }

        .word-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .word {
            margin-bottom: 5px; /* 调整词和分隔线之间的间距 */
        }

        .underline {
            width: 100px; /* 分隔线的宽度 */
            border: none;
            border-top: 1px solid #000; /* 分隔线样式 */
        }

        .avatar {
            width: 45px;
            height: 45px;
            overflow: hidden; /* 裁剪超出尺寸的部分 */
            margin-right: 10px;
        }
        .avatar img {
            width: 100%; /* 图片宽度占满容器 */
            height: auto; /* 自动调整高度 */
            display: block; /* 块级显示，避免底部空白问题 */
        }

        .username {
            color: blue;
            margin: 0;
        }

        .username a {
            text-decoration: none;
        }

        .username a:hover {
            text-decoration: underline;
        }

        .comment-text {
            margin: 2px;
            margin-top: 0; /* 添加这行样式 */
            margin-right: 10px;
        }

        .review-like-button {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
            margin-left: auto;
            display: flex;
            align-items: center;
        }

        .comment {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-top: 5px;
            /* 其他样式属性 */
        }


        .review-time {
            font-size: 12px;
            color: #888;
            /* 其他样式属性 */
        }

    </style>
</head>

<body>
<div class="container">
    <!--
// v0 by Vercel.
// https://v0.dev/t/lFKjx4brhqn
-->

    <div class="bg-white p-4 shadow rounded-lg">
        <!-- 标题大字... -->
        <h3 class="header-text" style="color: #6f42c1">音乐空间</h3>
        <!-- 发动态按钮... -->
        <button class="circle-button" id="createPostButton">
            <span class="icon-pencil"></span>
            发动态
        </button>
        <!-- 发动态post框（初始时是隐藏的） -->
        <div id="postBox" class="post-box hidden">
            <div class="header">
                <span class="share-text">分享</span>
            </div>
            <textarea class="text-area" id="postActivityTextArea" placeholder="一起聊聊吧"></textarea>
            <div class="music-select">
                <span class="music-icon"></span>
                <span>任意新建一行，用'@'开头紧跟歌名，给动态配上音乐</span>
            </div>
            <div class="buttons">
                <button class="share-button" id="shareButton">分享</button>
                <button class="cancel-button" id="cancelButton">取消</button>
            </div>
        </div>
        <script>
            // 当点击发动态按钮时显示post框
            $('#createPostButton').click(function() {
                $('#postBox').toggle('hidden');
            });
            // 当点击分享按钮时发送post框中文本框的内容到项目URL:postFriendActivity.do
            $('#shareButton').click(function() {
                var postActivityTextArea = document.getElementById("postActivityTextArea");
                var jsonStr = postActivityTextArea.value;
                if (jsonStr) {
                    $.ajax({
                        url: 'postFriendActivity.do',
                        type: 'POST',
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify({ activityContent: jsonStr }),
                        success: function(backEndResponse) {
                            alert(backEndResponse);
                        },
                        error: function(xhr, status, error) {
                            alert("发动态失败");
                        }
                    });
                } else {
                    alert("动态内容不能为空");
                    return;
                }
                $('#postBox').toggle('hidden');
            });
            // 当点击取消按钮时隐藏post框
            $('#cancelButton').click(function() {
                $('#postBox').toggle('hidden');
            });
        </script>
        <!-- 红棕色的分割线... -->
        <hr class="divider-brown-red">


<%--    将后端传来的 myFriendsActivities 用forEach展示出来。--%>
<%--    用 FriendActivity 类的属性，以下是 FriendActivity 类的属性;--%>
<%--    class FriendsActivity {--%>
<%--        private String userName;--%>
<%--        private String reviewTime;--%>
<%--        private String content;--%>
<%--        private String songName;--%>
<%--        private boolean whetherLiked;--%>
<%--        private int likeCoefficient;--%>
<%--        private String userAvatarPath;--%>
<%--        private String songCoverPath;--%>
<%--        private List<FriendActivityReview> reviews;--%>
<%--        private List<FriendActivityReview> popularReviews;--%>
<%--    } 复制粘贴使用，避免手写出错。--%>
        <!-- 第一层循环遍历动态列表，将动态在页面中从上到下展示 -->
        <ul>
            <c:forEach items="${myFriendsActivities}" var="fa" varStatus="loop">
                <!-- 用户头像和用户名，评论时间 -->
                <div>
                    <div class="avatar-container">
                        <div class="avatar">
                            <img src="${pageContext.request.contextPath}${fa.userAvatarPath}?height=40&width=40" alt="User profile picture" onerror="setDefaultAvatar(this)" />
                        </div>
                        <div class="user-info">
                            <a href="#" class="username">${fa.userName}</a>
                            <p class="text-xs text-gray-500">${fa.reviewTime}</p>
                        </div>
                    </div>
                </div>
                <!-- 动态内容 -->
                <p class="text-xs mb-3">${fa.content}</p>
                <!-- 动态配上的音乐信息 -->
                <div class="gray-box p-3 rounded-lg song-details">
                    <img class="rounded song-cover" src="${pageContext.request.contextPath}${fa.songCoverPath}" alt="Album cover" onerror="setDefaultCover(this)" />
                    <div>
                        <p class="text-lg font-semibold">${fa.songName}</p>
                        <p class="text-xs text-gray-500">Kirara Magic/PIKASONIC</p>
                    </div>
                </div>
                <!-- 点赞评论分享三个按钮 -->
                <div class="activity flex items-center justify-between mt-4">
                    <div class="flex space-x-2">
                        <button class="activity-like-button" id="activityLikeButton_${fa.friendActivityId}">
                            <script>
                                document.getElementById("activityLikeButton_${fa.friendActivityId}").innerText = ("${fa.whetherLiked}" === "true" ?  'Liked' : 'Like');
                                document.getElementById("activityLikeButton_${fa.friendActivityId}").style.color = ("${fa.whetherLiked}" === "true" ?  '#fb7299' : '#56bafd');
                            </script>
                        </button>
                        <span id="activityLikeView_${fa.friendActivityId}">
                            (<span id="activityLikeCoefficient_${fa.friendActivityId}">${fa.likeCoefficient}</span>)
                            <script>
                                $('#activityLikeView_${fa.friendActivityId}').css('color', ("${fa.whetherLiked}" === "true" ? '#fb7299' : '#56bafd'));
                            </script>
                        </span>
                        <button class="text-lg activity-like-button" id="viewCommentButton_${loop.index}">Comments (${fa.reviews.size()})</button>
                        <button class="text-lg activity-like-button" id="notImplementShareButton_${fa.friendActivityId}">Share</button>
                        <script>
                            $('#activityLikeButton_${fa.friendActivityId}').click(function() {
                                let alc = document.getElementById("activityLikeCoefficient_${fa.friendActivityId}");
                                toggleActivityLike(${fa.friendActivityId}, alc.textContent);
                            });
                            <!-- 给动态点赞 -->
                            function toggleActivityLike(friendActivityIdStr, oldLikeCoefficientStr) {
                                $.ajax({
                                    url: 'likeFriendActivity.do',
                                    type: 'GET',
                                    data: {
                                        friendActivityId: parseInt(friendActivityIdStr)
                                    },
                                    success: function(response) {
                                        let oldLikeCoefficient = parseInt(oldLikeCoefficientStr)
                                        let newLikeCoefficient = parseInt(response);
                                        let rlc = document.getElementById('activityLikeCoefficient_'+friendActivityIdStr);
                                        rlc.textContent = response;
                                        let rlv = document.getElementById('activityLikeView_'+friendActivityIdStr);
                                        rlv.style.color = (newLikeCoefficient > oldLikeCoefficient ? '#fb7299' : '#56bafd');
                                        let alb = document.getElementById('activityLikeButton_'+friendActivityIdStr);
                                        alb.innerText = (newLikeCoefficient > oldLikeCoefficient ? "Liked" : "Like");
                                        alb.style.color = (newLikeCoefficient > oldLikeCoefficient ?  '#fb7299' : '#56bafd');
                                        (newLikeCoefficient > oldLikeCoefficient ? alert("点赞成功") : alert("取消点赞成功"));
                                    },
                                    error: function(xhr, status, error) {
                                        alert('请求失败：' + error);
                                    }
                                });
                            }

                            $('#viewCommentButton_${loop.index}').click(function() {
                                $('#commentsHidden_${loop.index}').toggle('hidden');
                            });

                            $('#notImplementShareButton_${fa.friendActivityId}').click(function () {
                                alert('#快去和别人分享今天的所思所想吧。');
                            });
                        </script>
                    </div>
                </div>


                <!-- 动态的评论区（以下在点击“评论按钮”前，初始时是隐藏的） -->
                <div class="comments hidden" id="commentsHidden_${loop.index}">
                    <!-- 评论post框 -->
                    <textarea class="comment-textarea" id="commentTextarea_${loop.index}" placeholder="评论"></textarea>
                    <button class="post-comment-button" id="postCommentButton_${loop.index}">评论</button>
                    <script>
                        // 当点击评论按钮时，发送评论文本框的内容到项目URL: postFriendActivityReview.do 交予处理。
                        $('#postCommentButton_${loop.index}').click(function() {
                            var postActivityReviewTextArea = document.getElementById("commentTextarea_${loop.index}");
                            var activityReviewContent = postActivityReviewTextArea.value;
                            if (activityReviewContent) {
                                $.ajax({
                                    url: 'postFriendActivityReview.do',
                                    type: 'POST',
                                    contentType: 'application/json;charset=UTF-8',
                                    data: JSON.stringify({ activityReviewContent: activityReviewContent, friendActivityId: "${fa.friendActivityId}" }),
                                    success: function(backEndResponse) {
                                        alert(backEndResponse);
                                        Friends_Activity_Page();
                                    },
                                    error: function(xhr, status, error) {
                                        alert("发评论失败");
                                    }
                                });
                            } else {
                                alert("评论内容不能为空");
                            }
                        });
                    </script>
                    <hr>

                    <!-- 评论分两类，“精彩”和“最新”（这个分类学自网易云web上的关注和动态页面：https://music.163.com/#/friend） -->
                    <!-- 评论 -->
                    <span class="word">评论</span>
                    <hr class="underline">
                    <!-- 精彩评论 -->
                    <span class="word">精彩评论</span>
                    <hr class="underline">
                    <!-- 第二层循环遍历这条动态的精彩评论列表，将评论在评论区从上到下显示 -->
                    <c:forEach items="${fa.popularReviews}" var="far" varStatus="subLoop">
                        <div class="comment">
                            <div class="avatar-container">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}${far.userAvatarPath}" onerror="setDefaultAvatar(this)"/>
                                </div>
                            </div>
                            <div class="user-info">
                                <a href="#" class="username">${far.userName}</a>
                                <p class="text-xs text-gray-500">${far.reviewTime}</p>
                            </div>
                            <p class="comment-text">${far.content}</p>
                            <button class="review-like-button" id="popularReviewLikeButton_${far.friendActivityReviewId}">👍</button>
                            <div id="popularReviewLikeView_${far.friendActivityReviewId}">(<span id="popularReviewLikeCoefficient_${far.friendActivityReviewId}">${far.likeCoefficient}</span>)</div>
                            <script>
                                $('#popularReviewLikeButton_${far.friendActivityReviewId}').click(function() {
                                    let rlc = document.getElementById("popularReviewLikeCoefficient_${far.friendActivityReviewId}");
                                    toggleReviewLike(${far.friendActivityReviewId}, rlc.textContent, parseInt(rlc.textContent) >= 3);
                                });
                                $('#popularReviewLikeView_${far.friendActivityReviewId}').css('color', ("${far.whetherLiked}" === "true" ? '#fb7299' : '#56bafd'));
                            </script>
                        </div>
<%--                        <hr class="divider-grew">--%>
                    </c:forEach>

                    <!-- 最新评论 -->
                    <span class="word">最新评论</span>
                    <hr class="underline">
                    <!-- 同第二层循环遍历这条动态的最新评论列表，将评论在评论区从上到下显示  -->
                    <c:forEach items="${fa.reviews}" var="far" varStatus="subLoop">
                        <div class="comment">
                            <div class="avatar-container">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}${far.userAvatarPath}" onerror="setDefaultAvatar(this)"/>
                                </div>
                            </div>
                            <div class="user-info">
                                <a href="#" class="username">${far.userName}</a>
                                <p class="text-xs text-gray-500">${far.reviewTime}</p>
                            </div>
                            <p class="comment-text">${far.content}</p>
                            <button class="review-like-button" id="reviewLikeButton_${far.friendActivityReviewId}">👍</button>
                            <div id="reviewLikeView_${far.friendActivityReviewId}">(<span id="reviewLikeCoefficient_${far.friendActivityReviewId}">${far.likeCoefficient}</span>)</div>
                            <script>
                                $('#reviewLikeButton_${far.friendActivityReviewId}').click(function() {
                                    let rlc = document.getElementById("reviewLikeCoefficient_${far.friendActivityReviewId}");
                                    toggleReviewLike(${far.friendActivityReviewId}, rlc.textContent, parseInt(rlc.textContent) >= 3);
                                });
                                $('#reviewLikeView_${far.friendActivityReviewId}').css('color', ("${far.whetherLiked}" === "true" ? '#fb7299' : '#56bafd'));
                            </script>
                        </div>
<%--                        <hr class="divider-grew">--%>
                    </c:forEach>

                    <!-- 给评论点赞 -->
                    <script>
                        function toggleReviewLike(friendActivityReviewIdStr, oldLikeCoefficientStr, oldIsPopular) {
                            $.ajax({
                                url: 'likeFriendActivityReview.do',
                                type: 'GET',
                                data: {
                                    friendActivityReviewId: parseInt(friendActivityReviewIdStr)
                                },
                                success: function(response) {
                                    let oldLikeCoefficient = parseInt(oldLikeCoefficientStr)
                                    let newLikeCoefficient = parseInt(response);
                                    // alert("oldIsPopularStr: "+oldIsPopular+'\n和之前点赞数：'+oldLikeCoefficient+'\n和现在点赞数：'+newLikeCoefficient)
                                    // 都要改普通评论区。但是在oldIsPopular为真时，才要改精彩评论区。
                                    let rlc = document.getElementById('reviewLikeCoefficient_'+friendActivityReviewIdStr);
                                    rlc.textContent = response;
                                    let rlv = document.getElementById('reviewLikeView_'+friendActivityReviewIdStr);
                                    rlv.style.color = (newLikeCoefficient > oldLikeCoefficient ?  '#fb7299' : '#56bafd');
                                    if (oldIsPopular) {
                                        let prlc = document.getElementById('popularReviewLikeCoefficient_'+friendActivityReviewIdStr);
                                        prlc.textContent = response;
                                        let prlv = document.getElementById('popularReviewLikeView_'+friendActivityReviewIdStr);
                                        prlv.style.color = (newLikeCoefficient > oldLikeCoefficient ?  '#fb7299' : '#56bafd');
                                    }
                                },
                                error: function(xhr, status, error) {
                                    alert('请求失败：' + error);
                                }
                            });
                        }
                    </script>
                </div>


<%--                动态与下一条动态之间的分隔线--%>
                <hr class="divider-grew">
            </c:forEach>
        </ul>
    </div>

    <!-- 好友空间大字，小跳动特效框 -->
    <h1></h1>

    <!-- 好友空间大字，小跳动特效框End -->
</div>


<script>

    // 函数：当用户的头像加载失败时，使用默认的用户头像替换加载失败的头像。
    function setDefaultAvatar(img) {
        img.src = '${pageContext.request.contextPath}/friend-activity-resources/no-title.jpg';
    }

    // 函数：当专辑的封面加载失败时，使用默认的专辑封面替换加载失败的封面
    function setDefaultCover(img) {
        img.src = '${pageContext.request.contextPath}/friend-activity-resources/热歌慢摇.jpg';
    }

    { // 在好友空间制作时测试时，经常需要通过刷新页面来测试插入删除操作是否成功。但是现在是，刷新页面后会直接跳回主页”index.do“，这里想完成页面刷新完仍会留在当前URL的js办法。

    }
</script>

</body>
</html>

