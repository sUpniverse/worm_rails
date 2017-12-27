var boards = document.getElementsByClassName('board');
	for(var i = 0; i < boards.length ; i++) {
		boards[i].addEventListener('click',function(){
	    var id = this.getAttribute('data-value');
	    console.log(id);
	    location.href="/boards/" + id;
		});
	}