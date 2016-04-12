
function hasClass(el, className) {
	return el.classList ? el.classList.contains(className) : new RegExp('\\b'+ className+'\\b').test(el.className);
}

function addClass(el, className) {
	if (el.classList) el.classList.add(className);
	else if (!hasClass(el, className)) el.className += ' ' + className;
}

function removeClass(el, className) {
	if (el.classList) el.classList.remove(className);
	else el.className = el.className.replace(new RegExp('\\b'+ className+'\\b', 'g'), '');
}

function toggle(el) {
	var action = '';
	if( hasClass(el, 'selected') ){
		action = 'showing';
		removeClass(el, 'selected');
	} else {
		action = 'hiding';
		addClass(el, 'selected');
	}

	var boxes = document.querySelectorAll('.box');

	for(var i = 0, iLimit = boxes.length; i < iLimit; i++){
		if( action == 'showing' ){
			removeClass(boxes[i], 'hidden');
		} else if ( action == 'hiding' && !hasClass(boxes[i], 'selected') ){
			addClass(boxes[i], 'hidden' );
		}
	}
}

