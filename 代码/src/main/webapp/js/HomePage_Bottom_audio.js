(function($){//立即执行函数表达式 (IIFE)，用于创建一个插件作用域，防止变量污染全局命名空间
	var config = {//存储插件的配置.配置对象的设计使得插件的用户能够轻松地根据他们的需求配置音频播放器的各个方面，从选择器到功能设置
		//view, title, cover: 这些属性是选择器字符串，用于选择页面上与音频播放器相关的视图元素，例如音频容器、标题、封面等
		view : ".audio-view",
		title : ".audio-title",
		cover : ".audio-cover",
		autoPlay : false,//一个布尔值，表示是否在加载页面时自动播放音频
		isLoop	: true,//: 一个布尔值，表示是否开启循环播放功能
		volume : {//一个包含有关音量控制的配置的对象
			volumeView : ".audio-set-volume",
			volumeBox : ".volume-box",
		},

		timeView : {//一个包含有关时间显示的配置的对象
			thisTime : ".audio-this-time",
			countTime : '.audio-count-time',
		},

		setbacks : {//一个包含有关进度条控制的配置的对象
			setbacks : '.audio-setbacks',
			thisSetbacks : '.audio-this-setbacks',
			cacheSetbacks : ".audio-cache-setbacks",
			volumeSetbacks : ".volume-box > i",
			volumeCircular : ".volume-box > i span"
		},
			
		button : {//包含各种按钮选择器的对象，用于控制音频的播放、音量、前进、后退等
			volume : ".audio-volume",
			backs : ".audio-backs-btn",
			prev : ".audio-prev",
			play : ".audio-play",
			next : ".audio-next",
			loop : ".icon-loop",
			shuffle : ".icon-shuffle",
			model   : ".audio-model",
			menu : ".audio-menu",
			menuClose : ".menu-close"
		},

		menu : {//包含有关菜单视图和列表选择器的对象
			menuView : '.audio-list',
			colse : '.close',
			list : '.audio-inline'
		},

		song : null// 一个数组，用于存储歌曲信息
	};

	var songEq = 0,//初始化为 0，表示当前歌曲的索引
		volumeSize = 0.8;//初始化为 0.8，表示音量的初始大小

	var fnName = 'audioPlay';//存储插件的函数名
	window[fnName] = function(setConfig){//创建一个全局函数，用于初始化插件.这个函数的名称是通过之前定义的 fnName 变量确定的
		//设置属性值
		if(typeof(setConfig) == "object"){//检查传入的 setConfig 是否为对象，确保是合法的配置对象
			for( var n in setConfig){//循环遍历，将 setConfig 中的属性复制到 config 对象中，实现对插件配置的动态设置
				config[n] = setConfig[n];
			}
		}
		var _this = config,//将 config 对象引用赋给 _this 变量，这样在后续代码中可以使用 _this 来代替 config
			playDate;//声明了 playDate 变量，用于记录音频播放的时间
		var cover = $(_this.cover),//使用 jQuery 的 $ 函数来根据选择器选择从页面上选取了一系列的界面元素,
			title = $(_this.title),
			thisTime = $(_this.timeView.thisTime),
			countTime = $(_this.timeView.countTime),
			thisSetbacks = $(_this.setbacks.thisSetbacks),
			cacheSetbacks = $(_this.setbacks.cacheSetbacks),
			setbacks = $(_this.setbacks.setbacks),
			volumeCircular = $(_this.setbacks.volumeCircular),
			volumeSetbacks = $(_this.setbacks.volumeSetbacks),
			volumeBox = $(_this.volume.volumeBox),
			play = $(_this.button.play),
			prev = $(_this.button.prev),
			next = $(_this.button.next),
			loop = $(_this.button.loop),
			model = $(_this.button.model),
			shuffle = $(_this.button.shuffle),
			menuBtn = $(_this.button.menu),
			volume = $(_this.button.volume),
			menuClose = $(_this.button.menuClose),
			backs = $(_this.button.backs);
//--一个命名为 _this 的对象上的方法 createAudio。主要用于创建和初始化音频播放器(确保音频对象存在，并将其初始化为当前歌曲的相关属性，例如音频源、标题和封面)-----------------------------------------------------------------------------------
		_this.createAudio = function(){//用于创建和初始化音频
			if(!_this.audio){//检查 _this.audio 是否已存在，不存在则创建新的 Audio 对象
				_this.audio = new Audio();//创建一个新的 Audio 对象，将其赋给 _this.audio。这是浏览器提供的原生对象，用于处理音频播放
			}
			var song = config.song;//从配置对象 config 中获取 song 属性，这个属性应该是一个包含歌曲信息的数组
			if(!song){//检查是否存在歌曲信息。如果不存在，弹出一个警告框，并返回 false。这可能表示当前歌单为空
				alert('当前歌单没有歌曲!!!');
				return false;
			}
			_this.stopAudio();//调用 _this 对象上的 stopAudio 方法，用于停止当前正在播放的音频
			_this.audio.src = song[songEq].src;//设置音频对象的 src 属性为当前歌曲的音频源地址。songEq 变量表示当前歌曲的索引
			_this.volumeSet();//调用 _this 对象上的 volumeSet 方法，用于设置音频的音量
			title.text(song[songEq].title || '未知歌曲');//使用 jQuery 的 text 方法将页面上的标题元素的文本内容设置为当前歌曲的标题。如果歌曲没有标题，则默认为 '未知歌曲'
			cover.css({//使用 jQuery 的 css 方法设置页面上的封面元素的背景图片。背景图片的 URL 为当前歌曲的封面地址。如果歌曲没有封面，将使用空字符串
				'backgroundImage' : 'url('+(song[songEq].cover || '')+')'
			});
//-----一个名为 setDuration 的函数。该函数的主要目的是等待音频的 duration 属性变得有效（不是 NaN，即非数字），然后将音频的总时长显示在页面上-----------------------------------------------------------------------------------------------------------------------
			function setDuration(){//
				if(isNaN(_this.audio.duration)){//检查当前音频对象的 duration 属性是否是一个数字。如果是 NaN，表示 duration 属性还没有被正确设置，执行下面的逻辑
					setTimeout(setDuration,50);//如果 duration 属性还没有变得有效，通过 setTimeout 在 50 毫秒后再次调用 setDuration 函数。这是一种轮询的方式，等待 duration 属性的有效设置
				}else{
					//：当 duration 属性已经有效时，将音频的总时长转换为合适的格式，然后通过 jQuery 的 text 方法将这个格式化后的时长显示在页面上。这里使用了 _this.conversion 方法，它的目的是将时间转换为 mm:ss 格式
					countTime.text(_this.conversion(_this.audio.duration));
				}
			}
			setDuration(_this.audio.duration);//在这里调用 setDuration 函数，传递音频的当前 duration 属性值。这是为了触发函数的第一次执行，开始检查 duration 是否已经有效
//----涉及音频播放的一些逻辑---------------------------------------------------------------------------------------------------------------------------------
			thisTime.text(_this.conversion(_this.audio.currentTime));//将当前音频的播放时间（currentTime）通过 _this.conversion 方法转换为合适的格式，并将结果显示在页面上。这通常用于显示当前音频的播放进度
			_this.audio.onended = function(){//给音频对象的 onended 事件绑定一个函数。这个事件在音频播放结束时触发
				if(_this.isLoop){//检查是否开启了循环播放功能
					//如果开启了循环播放，等待 1 秒后继续播放
					setTimeout(function(){
						_this.selectMenu(songEq,true);
					},1000);
				}else{
					//如果未开启循环播放,等待1s随机顺序播放
					setTimeout(function(){
						++songEq;//通过递增 songEq 来选择下一首歌曲，并在到达歌单末尾时重新开始。
						songEq = (songEq < _this.song.length) ? songEq : 0;
						_this.selectMenu(songEq,true);//selectMenu 方法用于根据歌曲索引选择歌曲
					},1000);
				}
			}
		}
//---涉及音频的播放逻辑:，播放按钮的状态切换、进度条的更新以及定时器的管理------------------------------------------------------------------------------------------------------------
		var timeAudio;//变量 timeAudio，用于存储定时器的标识符，以便后续可以清除定时器
		_this.playAudio = function(){//定义名为 playAudio 的方法
			if(_this.audio){//检查音频是否存在
				//检查播放的时间间隔是否满足条件。playDate 记录上一次播放的时间，如果未定义或距离上次播放超过 100 毫秒，就可以进行下一次播放
				if(!playDate || (Date.now() - playDate) > 100){
					playDate = Date.now();//更新 playDate 为当前时间，表示当前时间已经进行了播放
					(!_this.audio.paused) || _this.audio.pause();//如果音频不是暂停状态，则暂停音频。这是为了确保在点击播放按钮时可以暂停当前的播放
					_this.audio.play();//开始播放音频
			//_this.lyricsOperation();//歌词操作
					play.addClass('audio-stop').one('click',function(){//将播放按钮添加 audio-stop 类，表示当前处于播放状态，并绑定一个点击事件处理函数。在点击时执行停止播放的逻辑
						_this.stopAudio();//调用 stopAudio 方法停止音频的播放
						//移除 audio-stop 类，表示停止播放状态，并在下一次点击时执行 playAudio 方法，重新开始播放
						$(this).removeClass('audio-stop').one('click',function(){
							_this.playAudio();//
						});
					});
					//使用 setInterval 创建一个定时器，每隔 500 毫秒执行一次。在定时器中更新进度条和显示当前播放时间
					timeAudio = setInterval(function(){
						if(_this.audio.readyState == 4){//检查音频是否已经加载完成（readyState == 4），如果加载完成，更新缓冲进度条
							cacheSetbacks.css({//根据缓冲进度更新缓冲进度条的宽度
								'width' : (_this.audio.buffered.end(0) / _this.audio.duration)*100+"%"
							});
						}
						thisSetbacks.css({//根据当前播放时间更新播放进度条的宽度
							'width' : (_this.audio.currentTime / _this.audio.duration)*100+"%"
						});
						//将当前播放时间转换为合适的格式，并显示在页面上
						thisTime.text(_this.conversion(_this.audio.currentTime));
					},500);//定时器每隔 500 毫秒执行一次上述逻辑
				}else{//如果时间间隔不满足条件，延迟 50 毫秒后再次执行 playAudio 方法，实现定时器的递归调用
					setTimeout(function(){
						_this.playAudio();
					},50);
				}			
			}
		}
//----实现停止音频播放的逻辑:在播放按钮被点击时，停止音频的播放，并清除相关的定时器，确保播放状态被正确处理---------------------------------------------------------------------------------------------------------------
		_this.stopAudio = function(){
			//检查播放的时间间隔是否满足条件。playDate 记录上一次播放的时间，如果未定义或距离上次播放超过 100 毫秒，就可以执行停止播放的逻辑
			if(!playDate || (Date.now() - playDate) > 100){
				playDate = Date.now();//更新 playDate 为当前时间，表示当前时间已经进行了播放
				_this.audio.pause();//暂停音频的播放
				clearInterval(timeAudio);//清除之前设置的定时器，停止更新进度条和当前播放时间的操作
			}else{
				//如果时间间隔不满足条件，延迟 50 毫秒后再次执行 stopAudio 方法，实现递归调用。这里的延迟是为了确保上一次的播放状态已经被处理，避免连续点击按钮导致状态混乱
				setTimeout(function(){
					_this.stopAudio();
				},50);
			}		
		}
//---在 conversion 函数中，将输入的秒数 num 转换为分钟和秒的字符串表示:调用 _this.conversion 函数并传入秒数，就可以得到格式化后的表示时间的字符串，例如 03:25 表示 3 分 25 秒-------------------------------------------------------------------------------------------------------------------------------
		_this.conversion = function(num){
			function changInt(num){//定义了一个内部函数 changInt，用于将数字格式化为两位数。如果数字小于 10，则在前面加上 0，否则保持原样
				return (num < 10) ? '0'+num : num;
			}
			//num/60 计算分钟部分，parseInt 取整得到分钟数. num%60 计算秒数部分 .changInt 函数将分钟和秒都格式化为两位数.最后用 ":" 连接分钟和秒，返回表示时间的字符串
			return changInt(parseInt(num/60))+":"+ changInt(Math.floor(num%60));
		}
//---函数 _this.upMenu，用于更新音频播放器的菜单:根据音频列表更新音频播放器的菜单，使用户能够点击选择播放不同的歌曲----------------------------------------------------------------------------------------------------------------
		_this.upMenu = function(){
			var song = _this.song,//从 _this 对象中获取音频列表数组，并将其存储在 song 变量中
				inline = $(_this.menu.list).empty();//通过 jQuery 选择器找到菜单列表容器，然后清空其内容，并将结果存储在 inline 变量中
			for(var i in song){//循环遍历音频列表数组
				//将每首歌曲的标题（如果存在的话，否则使用默认值 '未知歌曲'）包装在 <a> 标签内，并添加到菜单列表容器中
				inline.append("<li><a href='javascript:;'>"+(song[i].title || '未知歌曲')+"</a></li>");
			}
			//使用 find 方法找到所有直接子级的 <li> 元素，并解除它们之前可能绑定的点击事件。然后，为每个 <li> 元素添加点击事件监听器
			inline.find(">li").unbind('click').on('click',function(){
				//在点击事件中调用 _this.selectMenu 函数，传入点击的 <li> 元素在父容器中的索引，并将第二个参数设置为 true。这个函数用于选择并播放相应的音频
				_this.selectMenu($(this).index(),true);
			});
		}
//--名为 _this.selectMenu 的函数:根据传入的索引选择相应的歌曲，并根据需要播放该歌曲。函数首先更新 songEq，然后创建和初始化音频，最后如果 _bool 为 true，则播放选定的歌曲------------------------------------------------------------------------------------------------------------------
		_this.selectMenu = function(num,_bool){
			songEq = num;//将参数 num 的值赋给全局变量 songEq。这个变量用于跟踪当前选定的歌曲在音频列表中的索引
			_this.createAudio();//调用 _this.createAudio 函数，该函数用于创建和初始化音频
			(_bool) && _this.playAudio();//使用短路逻辑，如果 _bool 的值为 true，则调用 _this.playAudio 函数播放音频
		}
//-- _this.volumeSet 函数:根据 volumeSize 设置音频的音量，并更新与音量控制相关的界面元素----------------------------------------------------------------------------------------------------------
		_this.volumeSet = function(){
			_this.audio.volume = volumeSize;// volumeSize 变量的值赋给音频对象 _this.audio 的音量属性。volumeSize 表示音量的大小，取值范围为 0（静音）到 1（最大音量）
			volumeSetbacks.css({//使用 jQuery 的 css 方法，设置与音量相关的 DOM 元素的高度属性。这通常用于显示音量控制的界面，volumeSize*100 将音量值转换为百分比
				'height' : volumeSize*100 + "%"
			});
		}
//---_this.newSong 函数:向歌曲列表中添加新的歌曲，并根据参数 _bool 决定是否选择并播放新添加的歌曲------------------------------------------------------------------------------------------
		_this.newSong = function(_new,_bool){
			if( typeof(_new) == 'object' ){//检查传入的 _new 是否是一个对象
				if(_new.src){//检查传入的对象 _new 是否有 src 属性
					if(_this.song){//如果 _this.song 已经存在，将 _new 添加到 _this.song 数组中
						_this.song.push(_new);
					}else{//如果 _this.song 不存在，创建一个包含 _new 的数组并赋给 _this.song
						_this.song = [_new];
					}
					_this.upMenu();//调用 _this.upMenu 函数，用于更新歌曲菜单
					//如果 _bool 为真，则调用 _this.selectMenu 函数，选择最新添加的歌曲并播放
					(_bool) && _this.selectMenu(_this.song.length-1,true);
				}else{
					alert('对象缺省src属性');//如果传入的对象没有 src 属性，则弹出警告
				}
			}else{
				alert('这不是一个对象');//如果传入的不是对象，弹出警告
			}
		}
//--处理音量控制的逻辑:实现通过鼠标在音量控制区域的垂直移动来调整音量的功能，并通过定时器和事件监听器的管理来确保流畅的用户体验---------------------------------------------------------------------------------------------------------------------
		var volumeTime;//声明一个变量 volumeTime，用于存储定时器的引用
		volumeBox.on('mousedown',function(){//当鼠标在音量控制区域按下时触发的事件处理函数
			if(_this.audio){//检查 _this.audio 是否存在
				////声明变量 Y，EndY 和 goY，分别用于存储鼠标在垂直方向上的位置、音量控制区域的高度（以像素为单位），和计算出的音量百分比
				var Y,EndY = parseInt(volumeBox.css('height')),goY;
				//当鼠标在音量控制区域移动或点击时触发的事件处理函数
				volumeBox.on('mousemove click',function(e){
					clearTimeout(volumeTime);//清除之前设置的定时器，以避免频繁触发
					Y = (e.clientY-(volumeBox.offset().top-$(document).scrollTop()));//计算鼠标在音量控制区域内的垂直位置。
					Y = (Y > 0) ? (Y > EndY) ? EndY : Y : 0;//确保 Y 在合理范围内，不超过音量控制区域的高度
					goY = Y/EndY;//计算鼠标在垂直方向上的相对位置，即相对于音量控制区域高度的百分比
					volumeSize = 1 - goY;//计算音量百分比，并更新 _this.audio 的音量
					_this.volumeSet();//调用 _this.volumeSet 函数，更新音量显示
				});
				//一次性绑定鼠标抬起事件，用于停止监听鼠标移动
				volumeBox.one('mouseup',function(){
					volumeBox.unbind('mousemove');
				}).on('mouseout',function(){//当鼠标移出音量控制区域时触发的事件处理函数
					volumeTime = setTimeout(function(){//设置定时器，在鼠标移出区域后 500 毫秒内如果没有再次移入，则停止监听鼠标移动
						volumeBox.unbind('mousemove');
					},500);
				});
			}
		});
//---实现音频进度条的拖动功能:通过鼠标在进度条上的水平拖动来调整音频播放位置的功能，并通过定时器和事件监听器的管理来确保流畅的用户体验-----------------------------------------------------------------------------------------------------------------
		setbacks.on('mousedown',function(){//当鼠标在进度条上按下时触发的事件处理函数
			if(_this.audio){//检查 _this.audio 是否存在
				//声明变量 X，EndX，goX 和 mouseTime，分别用于存储鼠标在水平方向上的位置、进度条的宽度（以像素为单位），计算出的进度百分比，以及用于管理鼠标事件的定时器
				var X,EndX = parseInt(setbacks.css('width')),goX,mouseTime;
				setbacks.on('mousemove click',function(e){//鼠标在进度条上移动或点击时触发的事件处理函数
					_this.stopAudio();//暂停音频播放
					clearTimeout(mouseTime);//清除之前设置的定时器，以避免频繁触发
					X = (e.clientX-setbacks.offset().left);//计算鼠标在水平方向上的相对位置
					X = (X > 0) ? (X > EndX) ? EndX : X : 0;//确保 X 在合理范围内，不超过进度条的宽度
					goX = X/EndX;//计算鼠标在水平方向上的相对位置，即相对于进度条宽度的百分比
					thisSetbacks.css({//设置当前播放位置的显示，即更新进度条的宽度
						'width' : goX*100+"%"//
					});
					_this.audio.currentTime = parseInt(goX*_this.audio.duration);//根据计算得到的百分比设置音频的当前播放时间
					thisTime.text(_this.conversion(_this.audio.currentTime));//更新显示当前播放时间的元素
				});//结束鼠标移动事件处理函数
				//一次性绑定鼠标抬起事件，用于继续音频播放并停止监听鼠标移动
				setbacks.one('mouseup',function(){
					_this.playAudio();//
					setbacks.unbind('mousemove');
				}).on('mouseout',function(){//当鼠标移出进度条时触发的事件处理函数
					//设置定时器，在鼠标移出区域后 500 毫秒内如果没有再次移入，则继续音频播放并停止监听鼠标移动
					mouseTime = setTimeout(function(){
						_this.playAudio();
						setbacks.unbind('mousemove');
					},500);
				});//结束鼠标移出事件处理函数
			}
		});
//--实现音频播放器中的一些控制按钮的点击事件监听:基本的播放、菜单显示和切歌功能--------------------------------------------------------------------------------
		//一次性绑定播放按钮（play）的点击事件，点击后调用 _this.playAudio() 方法开始播放音频。通过使用 one 方法，确保点击事件只能触发一次
		play.one('click',function(){
			_this.playAudio();
		});
		//绑定菜单按钮（menuBtn）的点击事件，点击时切换菜单视图的显示和隐藏状态。通过使用 toggleClass 方法，实现添加或删除 CSS 类名 'menu-show'，从而控制菜单的显示和隐藏
		menuBtn.on('click',function(){
			$(_this.menu.menuView).toggleClass('menu-show');
		});
		//绑定上一曲按钮（prev）的点击事件，点击时切换到上一首歌曲，通过减小 songEq 变量的值来实现。如果已经是第一首歌曲，则切换到列表的最后一首歌曲
		prev.on('click',function(){
			--songEq;
			songEq = (songEq >= 0) ? songEq :  _this.song.length -1;
			_this.selectMenu(songEq,true);
		});
		//绑定下一曲按钮（next）的点击事件，点击时切换到下一首歌曲，通过增加 songEq 变量的值来实现。如果已经是列表的最后一首歌曲，则切换到第一首歌曲
		next.on('click',function(){
			++songEq;
			songEq = (songEq < _this.song.length) ? songEq : 0;
			_this.selectMenu(songEq,true);
		});
//--实现单曲循环播放和随机顺序播放的切换功能---------------------------------------------------------------------------------------------------------------------
		loop.on('click',function(){//绑定循环按钮（loop）的点击事件监听器
			if(_this.isLoop){//检查当前播放模式是否为单曲循环
				//当前是单曲循循环播放，点击后变成顺序随机播放
				$(_this.button.loop).addClass('icon-shuffle');//：如果是单曲循环，将循环按钮的图标修改为随机播放的图标（icon-shuffle），通过添加和移除 CSS 类实现
				$(_this.button.loop).removeClass('icon-loop');//不是就移除
				_this.isLoop=!_this.isLoop;//切换播放模式，将 _this.isLoop 取反，从单曲循环切换到随机顺序
				$("#play-pattern").attr("title","随机顺序");//修改播放模式的提示文本，将标题设置为“随机顺序”
			}else{//如果当前是随机顺序播放
				//当前是顺序随机播放，点击后变成单曲循循环播放
				$(_this.button.shuffle).addClass('icon-loop');//将循环按钮的图标修改为单曲循环的图标
				$(_this.button.shuffle).removeClass('icon-shuffle');//移除随机播放的图标
				_this.isLoop=!_this.isLoop;//切换播放模式，将 _this.isLoop 取反，从随机顺序切换到单曲循环
				//修改title
				$("#play-pattern").attr("title","单曲循环");//修改播放模式的提示文本，将标题设置为“单曲循环
			}
		});
//--主要处理菜单的显示和隐藏，以及歌曲的选择和自动播放------------------------------------------------------------------------------------------------
		menuClose.on('click',function(){//给菜单关闭按钮（menuClose）绑定点击事件监听器
			$(_this.menu.menuView).removeClass('menu-show');//在点击菜单关闭按钮时，移除菜单视图的显示样式（menu-show），以隐藏菜单
		});

		volume.on('click',function(){//给音量按钮（volume）绑定点击事件监听器
			//点击音量按钮时，通过切换音量视图的显示样式（audio-show-volume），实现显示和隐藏音量控制面板
			$(_this.volume.volumeView).toggleClass('audio-show-volume');
		});

		_this.upMenu();//调用 upMenu 方法，该方法用于更新歌曲菜单

		_this.selectMenu(songEq,_this.autoPlay);//调用 selectMenu 方法，该方法用于选择歌曲，其中 songEq 表示歌曲索引，_this.autoPlay 表示是否自动播放
		
		return _this;//返回 _this 对象，这样可以链式调用其他方法
	}
})(jQuery)