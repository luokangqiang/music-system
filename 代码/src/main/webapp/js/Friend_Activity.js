// 发布动态框
// 打开发布动态框
function ShowPostOnMoments() {
    const postDialog = document.getElementById("Post_Dialog");
    postDialog.showModal();
}
// 关闭发布动态框
function ClosePostOnMoments() {
    const postDialog = document.getElementById("Post_Dialog");
    postDialog.close();
}

// 设置发布动态框中文本框与按钮之间的响应
function InputChangeBtnForDialog(textarea) { // 用于当有输入的时候按钮样式发生变化
    const btn = textarea.previousElementSibling;    // 获取textarea上方的按钮
    if(textarea.value.trim() === ''){
        btn.classList.remove('active');     // active是在Friend_Space.css文件中已经定义好的，在其对应的选择器.active(不是:active)
        btn.setAttribute('disabled', true); // 则可发送
    } else {
        btn.classList.add('active');
        btn.removeAttribute('disable'); // 则不可发送
    }
}

// 上传图片
function UploadImg() {
    document.getElementById('Upload_Img').click();  // 触发input上传文件点击事件
}


// 好友空间中设置文本框与按钮之间的响应
function InputChangeBtnForReview(textarea) { // 用于当有输入的时候按钮样式发生变化
    const btn = textarea.nextElementSibling;    // 获取textarea下方的按钮
    if(textarea.value.trim() === ''){
        btn.classList.remove('active');     // active是在Friend_Space.css文件中已经定义好的，在其对应的选择器.active(不是:active)
        btn.setAttribute('disabled', true); // 则可发送
    } else {
        btn.classList.add('active');
        btn.removeAttribute('disable'); // 则不可发送
    }
}

// 点击实现点赞或取消点赞
function makeLikeOrUnlike(label) {
    var isLike;   // 后端获取当前是否有过点赞
    if(!isLike){
        // 点赞数目增加, 更新数据库信息


    } else {
        // 点赞数目减少,更新数据库信息

    }
}

// 点击实现查看或关闭评论区
// 获取所有按钮和评论区域的引用
function ShowOrCloseCommentArea(label){
    const commentArea = label.parentNode.nextElementSibling;
    console.log(commentArea.style.display);
    if(commentArea.style.display == 'none'){
        commentArea.style.display = 'block';    // 显示该标签(包括其下的所有子孙标签)
    } else{
        commentArea.style.display = 'none';     // 隐藏该标签(包括其下的所有子孙标签)
    }

}
