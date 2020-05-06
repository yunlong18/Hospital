
$(function(){

	$(".body_box").css({"minHeight":$(window).height() - $(".footer").innerHeight() - $(".header").innerHeight()});
	$(window).resize(function(){
		$(".body_box").css({"minHeight":$(window).height() - $(".footer").innerHeight() - $(".header").innerHeight()});
	});


	$(".menu_h").click(function(){
		$("body").toggleClass("menu-open");
		$(".header .navList").slideToggle(300);
		$(".header .navList li").removeClass("on");
        $('.header .navList li .open').text('+');

	});

	$(".shareBtn").on("click",function(e){

     	e.preventDefault();
      	e.stopPropagation();
        $(".seach_w").hide();
		$(this).toggleClass("on");
		$(".share_w").stop().fadeToggle(100);
	})
	
	$(".seachBtn").on("click",function(e){

	    e.preventDefault();
	    e.stopPropagation();
        $(".share_w").hide();
		$(this).toggleClass("on");
		$(".seach_w").stop().fadeToggle(100);
	})


	$(".seach_w").click(function(){
        return false;
    });

    $(".share_w").click(function(){
        return false;
    });
    $(document).click(function(){
        $(".seach_w").hide();
        $(".share_w").hide();
        $(".shareBtn").removeClass("on");
        $(".seachBtn").removeClass("on");
    })


	$(".header .nav li .one .open").on("click",function(e){
		if($(this).parent().siblings(".secondNav").length){
			if($(window).width()<=1279){
				//$(this).closest("li").toggleClass("on").siblings().removeClass("on");
                var $li = $(this).closest("li");
                if($li.hasClass('on')){
                   $li.removeClass('on');
                    $(this).text("+");
                }else{
                    $li.addClass('on');
                    $(this).text("-");
                }
			}
		}
        return false;
	});

	$(".secondNav a").on("click",function(){
		if($(window).width()<=1279){
			$(".menu_h").click();
            
		}
	})
	w_1250();
	$(window).resize(function(){
		w_1250()
	})


	function w_1250(){
		if($(window).width()<=1200){
			$(".menu-open").removeClass("menu-open");
			$(".header .nav li").removeClass("on");
			$(".header .navList").css({"height":$(window).height()-$(".header").height() + "px","display":"none"});
			
		}
		if($(window).width()>1200){
			$(".header .navList").attr({"style":""});
		}
	};

		





	$(window).scroll(function(){
		if($(window).scrollTop()>=50){
			$(".goto").fadeIn(300);
		}else{
			$(".goto").fadeOut(300);
		}
	});
	$(".goto").on("click",function(){
		$("body,html").stop().animate({scrollTop:0},300)
	})


	if($(window).width()<1366){$("body").addClass("w_1366")}else{$("body").removeClass("w_1366")};
	$(window).resize(function(){
		if($(window).width()<1366){$("body").addClass("w_1366")}else{$("body").removeClass("w_1366")};
	})


	if($(window).width()<1024){
		    $(".img-phone").each(function(){
		    	var _src = $(this).data("src");
		    	$(this).attr({
			    	"src":_src
			    })
		    })
	}

})

function anchor(arr1,arr2){
	var arr3 = [],
		hh = 10;
	if($('.header').css("position") === "fixed"){
		hh = hh+$('.header').height();
	}
	if(arguments.length===0){
		var href = window.location.href;
		var id = href.split('#');
		id = '#'+id[id.length-1];
		try{
			$('html,body').animate({scrollTop:$(id).offset().top-hh});
		}catch (e){
			console.log(e);
		}
		
	}else if(arguments.length===2){
		arr2.forEach(function(elem,i){
			arr3[i] = $(elem).offset().top-hh;
			
		});
		arr1.forEach(function(elem,i){
			$(elem).bind('click',function(){
				$('html,body').animate({scrollTop:arr3[i]});
				return false;
			});
		});	
	}
	
}

function htmlsize(){
	var ww;
	var maxw=750;
	var minw=320;
	if($(window).width()>maxw){ww=maxw;}
	else if($(window).width()<minw){ww=minw;}
	else{
		ww=$(window).width();
	}
	$("html").css({fontSize:(ww/maxw)*100});
}

//全局js
$(function(){
//start
htmlsize();
$(window).resize(htmlsize);

});


function addC(ele){
	$(ele).each(function(index,elements){
		$(this).addClass("list_"+index)
	})
}
// li n起始
function delay(ele,n,j){
	$(ele).each(function(index,elements){$(this).css({"transition-delay":n+j*index+"s"})})
}
function offset(ele){
	return $(ele).offset().top
}
function scorllAnimate(ele){
		if($(ele).size() == 0){return}
		var _offsetAnimate = $(ele).offset().top 
		var _scroll1Animate = $(window).scrollTop() + $(window).height()/1.5;
		if(_scroll1Animate >= _offsetAnimate){$(ele).addClass("show")}
		else{$(ele).removeClass("show")}
}

function scroll(ele){
	$(document).find(ele).mCustomScrollbar({
        horizontalScroll: false,
        advanced: {
            updateOnContentResize: true,
            updateOnBrowserResize: true,
            autoExpandHorizontalScroll: true
        }
    });
}


$(function(){

	$(document).on("click",".sc_com dt a",function(e){
		e.preventDefault();
        e.stopPropagation();
        if($(this).closest(".sc_com").hasClass("ieopen")){
	        $(".open").removeClass("open")
	        $(".ieopen").removeClass("ieopen")
	        $(".sc_com dd").removeClass("on")
        }else{
	        $(".open").removeClass("open")
	        $(".ieopen").removeClass("ieopen")
	        $(".sc_com dd").removeClass("on")
	        $(this).parent().toggleClass("open");
	        $(this).closest(".sc_com").toggleClass("ieopen");
	        $(this).closest(".sc_com").find("dd").addClass("on");
	    }
 	})
		
    $(document).on("click", ".select-box dd a", function (e) {
        $(this).addClass("on").siblings().removeClass("on");
        $(this).parents(".select-box").find("dt b").html($(this).html());
        $(".select-box dt").toggleClass("open");
        $(".select-box dd").removeClass("on");
    	var _val = $(this).data("val")
		$(this).closest(".select-box").find("dt input").val(_val)
    })
    $(document).click(function () {
        $(".select-box dt").removeClass("open");
        $(".select-box dd").removeClass("on");
        $(".sc_com").removeClass("ieopen");

    })
    scroll(".select_a")


})

$(function () {


    setTimeout(function () {
        imgratio();
    }, 100)

    var rtime = new Date();
    var timeout = false;
    var delta = 500;
    $(window).resize(function () {
        rtime = new Date();
        if (timeout === false) {
            timeout = true;
            setTimeout(resizeend, delta);
        }
    });
    function resizeend() {  
        if (new Date() - rtime < delta) {
            setTimeout(resizeend, delta);
        } else {
            timeout = false;
            imgratio()
        }
    }
    
    
    var val,ibox,val1;
    $(".search-box .input").hover(function(){
        ibox = $(this).find('input');
        val = ibox.val();
        val1 = ibox.attr("value");

        if(ibox.val() == "" || ibox.val() == val1){
           ibox.val("");
        }else{
			ibox.select();
		}
		ibox.focus();
		
    });
	// $(".search-box ").bind('mouseleave',function(){
		// ibox.blur();
	// });
	$(".search-box .input input").bind('blur',function(){
        var val = $(this).val();
        if(val=="" || val==$(this).attr("value")){
            $(this).val($(this).attr("value"));
        }
    });

});
function imgratio() {
    $(".ratio-img").each(function (index, element) {
        if ($(this).is(":visible")) {
            $(this).css({ height: Math.floor($(this).width() * $(this).data("ratio")) });
        }
    });



}