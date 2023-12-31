$(function(){
    var song = [
		{
			'cover' : 'images/cover.jpg',
			'src' : 'http://www.baidu.com',
			'title' : '不仅仅是喜欢',
			'songId':-1,
		},
	];

    audioFn = audioPlay({
		song : song,
		autoPlay : false  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	})
	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
	audioFn.newSong({
		'cover' : 'images/cover6.jpg',
		'src' : 'http://www.baidu.com',
		'title' : 'I Knew You Were Trouble',
		'songId':-1,
	},false);

});

/**
 * 将点击的歌曲添加到播放列表并播放
 * @param songId
 * @returns
 *///处理歌曲的播放，通过获取页面上相关元素的属性，记录播放信息，并通过调用 audioFn.newSong 实现新歌的播放
function playFunc(songId){//接受一个参数 songId。该函数的作用是根据传入的 songId 获取相应的歌曲信息，记录播放信息，然后添加新歌并立即播放
	var collectElement=$("#play"+songId);//使用 jQuery 选择器，通过歌曲的 songId 找到页面中对应的元素
	var name=collectElement.attr("name");// 从找到的元素中获取 name 属性的值，这个值可能是歌曲的名称
	var address=collectElement.attr("address");// 从找到的元素中获取 address 属性的值，这个值可能是歌曲文件的地址
    recordPlayInfo(songId);//调用 recordPlayInfo 函数，记录播放信息，传入了 songId 作为参数
    //添加新歌并立即播放
    audioFn.newSong({//使用 audioFn.newSong 方法添加新歌并立即播放。传入一个包含歌曲信息的对象，其中包括歌曲的封面（cover）、地址（src）、标题（title），以及 true 参数表示立即播放
		'cover' : 'images/cover4.jpg',
		'src' : address,
		'title' : name,
		'songId':songId,
	},true);


}


/**
 * 收藏喜欢歌曲
 * @param songId
 * @returns
 */
function collectFunc(songId){
	//只有登录的用户才可以享受收藏功能
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	} 
	var collectElement=$("#"+songId);
	//用于获取使用了tab 页里面歌曲真实id相同的元素
	var collectElement2=$("#second"+songId);
	var data = {        
	        "songId": songId,
	 };
    url = "collectSong.do";
	$.ajax({
        type:"POST",
        url:url,
        data:data,
        success:function(data){
        	var res=JSON.parse(data);
            if(res.status==200){
            	if(res.msg=="true"){
            		//已经收藏了
            		collectElement2.addClass("text-danger");
        			collectElement.addClass("text-danger");
            	}else{
            		//已经取消收藏了
            		collectElement.removeClass("text-danger");
            		collectElement2.removeClass("text-danger");
            	}
            }else{
            	alert(res.msg)
            	/*$('#collapse-error-hint').html(res.msg);
            	$('#collapse-error-hint').collapse()*/
            }
        }
    });
}

/**
 * 评论点赞
 * @param reviewId
 * @returns
 */
function likeFunc(reviewId){
	//只有登录的用户才可以享受收藏功能
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	} 
	var reviewLikeElement=$("#hotReviewLike"+reviewId);
	var reviewLikeNumElement=$("#hotReviewLikeNum"+reviewId);
	//解决最新评论和精彩评论在同一个页面更新问题(两个地方同时更新，这里采取)
	var newReviewLikeElement=$("#newReviewLike"+reviewId);
	var newReviewLikeNumElement=$("#newReviewLikeNum"+reviewId);
	var data = {        
	        "reviewId": reviewId,
	 };
    url = "reviewLike.do";
	$.ajax({
        type:"GET",
        url:url,
        data:data,
        success:function(data){
        	var res=JSON.parse(data);
            if(res.status==200){
            	if(res.msg=="true"){
            		//已经点赞
            		reviewLikeElement.addClass("text-danger");
            		//修改点赞显示次数
            		likeNum=reviewLikeNumElement.text();
            		reviewLikeNumElement.text(parseInt(likeNum) + 1);
            		//解决最新评论和精彩评论在同一个页面更新问题
            		newReviewLikeElement.addClass("text-danger");
            		if(reviewLikeNumElement.length==0){
            			likeNum=newReviewLikeNumElement.text();
            		}
            		newReviewLikeNumElement.text(parseInt(likeNum) + 1);
            	}else{
            		//已经取消点赞
            		reviewLikeElement.removeClass("text-danger");
            		//修改点赞显示次数
            		likeNum=reviewLikeNumElement.text();
            		reviewLikeNumElement.text(parseInt(likeNum) - 1);
            		//解决最新评论和精彩评论在同一个页面更新问题
            		newReviewLikeElement.removeClass("text-danger");
            		if(reviewLikeNumElement.length==0){
            			likeNum=newReviewLikeNumElement.text();
            		}
            		newReviewLikeNumElement.text(parseInt(likeNum) - 1);
            	}
            }else{
            	alert(res.msg)
            	/*$('#collapse-error-hint').html(res.msg);
            	$('#collapse-error-hint').collapse()*/
            }
        }
    });
}

/**
 * 发表评论
 * @param songId
 * @returns
 */
function reviewFunc(songId){
	//只有登录的用户才可以
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	} 
	//不能为空评论
	if(parseInt($("#num-cnt").text())==140){
		return;
	}
	//获取评论信息
	review=$("#reviewId").val();
	var data = {        
	        "review": review,
	        "songId":songId,
	 };
    url = "review.do";
    $.ajax({
        type:"POST",
        url:url,
        data:data,
        success:function(data){
        	var res=JSON.parse(data);
            if(res.status==200){
            	$("#reviewId").val("");
            	//更新最近评论区域
            	$('#newReviewAreaId').load("newReviewFrameLoad.do?songId="+songId);
            	
            }else{
            	
            }
        }
    });
	
}

/**
 * 简单的记录主动播放记录
 * Attentiion！
 * 这里只是采用了一种简单的记录方式，即点击便认为播放了
 * 其实并不好，最好播放时间达到一定的阈值才认为播放比较好
 * 先记录在这里，看后期还有时间改没有
 * 2018-04-30 19：52：56
 * @param songId
 * @returns
 */
function recordPlayInfo(songId){
	//只记录登录的用户才的播放情况
	if($("#logout")[0].style.display =='none'){
		return;
	} 
	var data = {        
	        "songId": songId,
	 };
    url = "recordPlay.do";
    $.ajax({
        type:"GET",
        url:url,
        data:data,
    });
}


/**
 * 我的音乐
 * @returns
 */
function myMusicPage(){
	// 只有登录的用户才可以
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	}
	//window.location.href ="myMusicPage.do";
	$('#hot').load("myMusicFrameLoad.do");
	$("#playerId").show();
}

/**
 * 好友空间
 *
 * */
function Friends_Activity_Page() {
	// 只有登录的用户才可以
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	}
	$('#hot').load("myFriendActivityFrameLoad.do");
	$('#homepage_3Column').hide();//隐藏底部的3个导航栏
	$("#playerId").hide();//隐藏播放器
}

/**
 * 评论加载
 * @param songId
 * @returns
 */
function reviewLoad(songId){
	$('#hot').load("reviewFrameLoad.do?songId="+songId);
}

/**
 * 评论计数，不超过140字
 * @param input
 * @returns
 */
function wordCount(input) {  
    var content = $("#num-cnt");
    if (content && input) {  
        // 获取输入框输入内容长度并更新到界面  
        var value = input.value;  
        // 将换行符不计算为单词数  
       // value = value.replace(/\n|\r/gi,"");  
        // 更新计数  
        content.text(140-value.length); 
    }
}

