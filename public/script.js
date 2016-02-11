"use strict";

(function(){
	$.each($('.trainname'),function(){
		switch($(this).children('.letter').text()[0]) {
			case '1': case '2':	case '3':
					$(this).css('background-color','#EC000A')
					break;
			case '4':	case '5':	case '6':
					$(this).css('background-color','#008000')
					break;
			case '7':
					$(this).css('background-color','#800080')
					break;
			case 'A':	case 'C':	case 'E':
					$(this).css('background-color','#0032FF')
					break;
			case 'B':	case 'D':	case 'F':	case 'M':
					$(this).css('background-color','#FF5900')
					break;
			case 'G':
					$(this).css('background-color','#69DB3D')
					break;
			case 'J':	case 'Z':
					$(this).css('background-color','#7A5001')
					break;
			case 'L':	case 'S':
					$(this).css('background-color','#999')
					break;
			case 'N':	case 'Q':	case 'R':
					$(this).css('background-color','#FFD900'),
					$(this).css('color','black')
					break;
		}
	})

	$.each($('.smallstatus'),function(){
		switch($(this).text()) {
			case 'PLANNED WORK':
				$(this).text('effing work.')
				break;
			case 'SERVICE CHANGE':
				$(this).text('service change.')
				break;
			case 'DELAYS':
				$(this).text('effing delays.')
				break;
			case 'GOOD SERVICE':
				$(this).text('all good.')
				break;
			default:
				$(this).text('probably effed.')
				break;
		}
	})
	
})();