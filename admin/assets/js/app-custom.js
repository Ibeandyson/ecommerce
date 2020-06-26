/*
Document: app-custom.js
Author: Bylancer
Description: Write your custom code here
*/

// Below is an example of function and its initialization
var AppCustom = function() {
	var showAppName = function() {
		//console.log( 'Quickad Classified - Admin & Frontend template' );
	};
    var addAppCredit = function() {
    	var admin_login_card = jQuery('#admin_login_card'),
		admincredit_template = '<div class="text-center"><small>Powered By : <a href="https://app.bellefu.com/" target="_blank">bellefu.com</a></small></div>';
        admin_login_card.after(admincredit_template);
    };
	return {
		init: function() {
			showAppName();
            addAppCredit();
		}
	}
}();

// Initialize AppCustom when page loads
jQuery( function() {
	AppCustom.init();
});
