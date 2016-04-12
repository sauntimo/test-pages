$(document).ready(function(){

	// Show/hide children buttons
	$('div.show-children').click(function(event) {
		var showChildrenOfItem = $(this).data('show-children-of-item');
		var showLevel = $(this).data('show-level');
		if( $(this).hasClass('active') ){
			// Hide ALL descendant children
			$('div.children-of-' + showChildrenOfItem + ' div.item').slideUp(100);
			$('div.children-of-' + showChildrenOfItem + ' div.show-children, this').html('Show Children').addClass('inactive').removeClass('active');
			$(this).html('Show Children');
			$(this).addClass('inactive').removeClass('active');
		}else{
			// show ONLY immediate children
			$('div.children-of-' + showChildrenOfItem + ' div.item.level-' + showLevel).slideDown(100);
			$(this).html('Hide Children').addClass('active').removeClass('inactive');
		}
	});


});