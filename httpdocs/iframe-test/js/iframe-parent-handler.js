
var isOldIE = (navigator.userAgent.indexOf("MSIE") !== -1); // Detect IE10 and below
var iframes = iFrameResize({
	log:false,
	autoResize: true,
	heightCalculationMethod: isOldIE ? 'max' : 'lowestElement',
	messageCallback: function( data ) {
		var msg = JSON.parse( data.message );
		var qs = encodeURI( msg.page.replace(/^(.*\?)/, '') );
		if( msg.isNewHrefFQTLink ){
			window.location.href = 'http://d51ts.test/iframe-test/financequote/?qs=' + qs; 
		} else {
			window.location.href = 'http://d51ts.test/iframe-test/taxcalc/?qs=' + qs; 
		}
	},
	checkOrigin: ['http://d51ts.kia.comcar.co.uk','http://d51ts.test']
});

$(document).ready(function(){
	var url = window.location.href;
	if( url.indexOf('?qs=') > 0 ){
		var iFrame_src = '';
		if( /\/financequote\//.test( url ) ){
			iFrame_src = 'http://d51ts.kia.comcar.co.uk/finance/quote/detail/?';
		}else{
			iFrame_src = 'http://d51ts.kia.comcar.co.uk/newcar/companycar/taxcalc/g6calcDetail.cfm?';
		}
		var qs = url.replace(/^.*?qs=/,'');
		$('iframe#child-iframe').prop('src', iFrame_src + qs);
	}
});
