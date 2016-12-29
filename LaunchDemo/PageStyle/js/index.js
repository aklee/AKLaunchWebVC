window.mySwipe = new Swipe(document.getElementById('slider'), {
	  startSlide: 0,
	  speed: 400,
	  auto: false,
	  continuous: false,
	  disableScroll: false,
	  stopPropagation: false,
	  callback: function(index, elem) {
	  	 $(".swipe-wrap li").removeClass("guide");
	  	 $(".swipe-wrap li").eq(index).addClass("guide");
	  },
	  transitionEnd: function(index, elem) {
	  	 slideTab(index);
	  }
	});
	var bullets = document.getElementById('pager').getElementsByTagName('em');
	for (var i=0; i < bullets.length; i++) {
	  var elem = bullets[i];
	  elem.setAttribute('data-tab', i);
	  elem.ontouchend = function(){
	    mySwipe.slide(parseInt(this.getAttribute('data-tab'), 10), 500);
	  }
	}
	function slideTab(index){
	  var i = bullets.length;
	  while (i--) {
	    bullets[i].className = bullets[i].className.replace('on',' ');
	  }
	  bullets[index].className = 'on';
	};