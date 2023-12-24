<%--
  Created by IntelliJ IDEA.
  User: cjh
  Date: 2023/12/23
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
    <title>好友空间</title>
    <link rel="stylesheet" type="text/css" href="../../css/Friend_Activity.css">
    <link rel="stylesheet" type="text/css" href="../../css/Post_Dialog.css">
    <script src="../../js/Friend_Activity.js"></script>
</head>
<body id="Friend_Activity_body">

    <%--  发布动态模态框  --%>
    <dialog id="Post_Dialog">
        <button id="Post_Cancel" onclick="ClosePostOnMoments()"><</button>
        <label id="Post_Topic">动态分享</label>
        <button id="Post_Send" onclick="" disabled>发布</button>
        <textarea id="Post_Textarea" oninput="InputChangeBtnForDialog(this)" placeholder="这一刻的想法..."></textarea><br/>
        <div id="Post_Img">
            <input id="Upload_Img" type="file" accept="image/*">
            <button id="Click_Unload" onclick="UploadImg()">上传图片</button>
        </div>
    </dialog>


    <%--  好友空间容器  --%>
    <div id="Container">
        <%--  顶部导航栏  --%>
        <div id="Friend_Activity_Top">
            <span id="Friend_Activity_Title">好友空间</span>
            <%--  触发模态框，将发布所需的信息填入  --%>
            <button id="Friend_Activity_SendBtn" onclick="ShowPostOnMoments()">+</button>
        </div>

        <%--  空间内容  --%>
        <div id="Friend_Activity_Content">
            <%--  获取之前保存的数据（头像、用户名、发布的文字内容、图片）一一获取输出在空间上  --%>

            <c:forEach items="${获取好友动态}" var="friend_dynamic" varStatus="status">   <%--  使用了JSTL  --%>
                <%--  以该 div class="Friend_Share" 为单位，将每一份数据打印其里面  --%>
                <div class="Friend_Share">
                        <%--  放置头像和名字（之前保存的数据中）  --%>
                    <div class="Friend_Share_Top">
                        <img class="Friend_Share_Img" src="img/user.png">
                        <span class="Friend_Share_Username">填入数据中的用户名</span>
                    </div>
                    <div class="Friend_Share_Content">
                            <%--  文字内容  --%>
                        <div class="Friend_Share_Word_Content">填入数据中的发表的文字内容</div>
                            <%--  图片内容  --%>
                        <div class="Friend_Share_Img_Content">填入数据中的发表的图片内容</div>
                            <%-- 歌曲海报画面内容 --%>
                        <a class="Friend_Share_Song_Link_Content" href="#">
                            <img class="Friend_Share_Song_Post_Content" src="img/Song_Post.jpg">
                        </a>
                    </div>
                    <div class="Friend_Share_Func">
                            <%--  评论框  --%>
                        <div class="Friend_Share_Comment_Func">
                            <textarea class="Friend_Share_Write_Comment_Func" oninput="InputChangeBtnForReview(this)" placeholder="说点什么呗..."></textarea>
                            <button class="Friend_Share_Submit_Comment_Func" onclick="" disabled>发送</button>
                        </div>
                            <%--  点赞和查看评论功能  --%>
                        <div class="Friend_Share_Other_Func">
                            <label class="Friend_Share_like_Func" onclick="makeLikeOrUnlike(this)">          <%--  点赞(非按钮标签)  --%>
                                <img class="Friend_Share_like_Img" src="img/unlike.png">           <%--  点赞图标  --%>
                                <span class="Friend_Share_like_Count">0</span>      <%--  点赞数,默认为0(在初始化时通过获取后端数据可将其修改)  --%>
                            </label>
                            <label class="Friend_Share_See_Review_Func" onclick="ShowOrCloseCommentArea(this)">  <%--  查看评论(非按钮标签)  --%>
                                <img class="Friend_Share_Review_Img" src="img/comment.png">      <%--  评论图标  --%>
                                <span class="Friend_Share_Review_Count">0</span>      <%--  评论数,同样默认为0(在初始化时通过获取后端数据可将其修改)--%>
                            </label>
                        </div>
                            <%--  评论区(初始时为隐藏状态)  --%>
                        <div class="Friend_Share_ReviewArea" style="display: none">
                            <c:forEach items="${获取该动态的评论}" var="comment" varStatus="status">    <%--  使用了JSTL  --%>
                                <div class="Friend_Share_ReviewContent">
                                    <span class="Friend_Share_ReviewContent_Username">用jstl获取的数据填入评论用户名:</span>
                                    <span class="Friend_Share_ReviewContent_Content">填用jstl获取的数据填入对应的评论内容比如说鼓励友好的评价这些都会给听歌和唱歌的人极大的鼓舞</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                        <%--  设置分隔线  --%>
                    <hr/>
                </div>
            </c:forEach>


        </div>
    </div>

</body>
</html>
