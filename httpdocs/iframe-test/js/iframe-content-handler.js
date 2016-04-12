// MUST BE LOADED BEFORE THE iframe-resizer-content.min.js

$( document ).ready(function() {

	// if displayed in an iframe
	if( in_iFrame() ){

		// catch link clicks
		$('a').click(function(event) {

			// prevent following link until processed
			event.preventDefault();

			// where are we trying to navigate the iframe to?
			var newHref = this.href;
			// the current url of the iframe
			var currentHref = window.location.href;
			// are we trying to navigate the iframe to the finance quote tool?
			var isNewHrefFQTLink = isFinanceQuoteLink( newHref );
			// is the iframe already in the finance quote tool?
			var isCurrentHrefFQTLink = isFinanceQuoteLink( currentHref );

			// This simulates an XOR, ie one and only one of these values is true.
			if( ( isCurrentHrefFQTLink || isNewHrefFQTLink ) && !( isCurrentHrefFQTLink && isNewHrefFQTLink ) ){

				// send message to parent page containing iframe
				window.parentIFrame.sendMessage(JSON.stringify({
					'text': 'child',
					'page': newHref,
					'isNewHrefFQTLink': isNewHrefFQTLink
				}));

			}else{

				// don't need to change parent page URL, follow link as normal within iframe
				window.location.href = newHref;

			}
		});
	}

});

// test if displayed in an iframe
function in_iFrame () {
    try {
        return window.self !== window.top;
    } catch (e) {
        return true;
    }
}

// regex test for '/finance/quote/' in url
function isFinanceQuoteLink(strTest){
	return /\/finance\/quote\//.test( strTest );
}
