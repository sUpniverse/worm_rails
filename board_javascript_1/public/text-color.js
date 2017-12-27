var buttons = document.getElementsByClassName('color-btn');
	console.log(buttons);

	 buttons[0].onmouseover = function {
	 	setTableAttribute('table table-hover text-danger');
	 }
	 buttons[1].onmouseover = function {
	 	setTableAttribute('table table-hover text-primary');
	 }
	 
	 buttons[2].onmouseover = function { 
	 	setTableAttribute('table table-hover text-success');
	 }	 


var setTableAttribute = function(classList) {
	var table = document.getElementsByTagName('table')[0];
	table.setAttribute('class',classList);
}

/*function setTableAttribute(classList) {
	var table = document.getElementsByTagName('table')[0];
	table.setAttribute('class',classList);
}*/