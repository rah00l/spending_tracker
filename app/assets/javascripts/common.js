// Js file to write custom application-specific javascript.

function observeAutocompleteField(fieldId, url, options) {
	$(document).ready(function() {
		$('#'+fieldId).autocomplete($.extend({
			source: url,
			minLength: 2,
			search: function(){$('#'+fieldId).addClass('ajax-loading');},
			response: function(){$('#'+fieldId).removeClass('ajax-loading');}
		}, options));
		$('#'+fieldId).addClass('autocomplete');
	});
}


function update_transactions_div(selected_option){
	$('.loadingOverlay').show();
	$.ajax({
		url: "/transacts",
		type: "GET",
		data: {"selected_option" : selected_option},
		dataType: "script",
		cache: true,
		success: function(data) {
			$('.loadingOverlay').hide();
		}
	});
}
