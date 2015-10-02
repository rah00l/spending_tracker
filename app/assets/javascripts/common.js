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

// function update_transactions_div(value){
// 	$('.loadingOverlay').show();
// 	$.ajax({
// 		url: "/transacts",
// 		type: "GET",
// 		data: {duration: value },
// 		dataType: "script",
// 		cache: true,
// 		success: function(data) {
// 			$('.loadingOverlay').hide();
// 		}
// 	});
// }

function update_transactions_div(value){
	if (($("#account_id").val()!=="") && ($("#duration").val()!==""))
	{
		$('.loadingOverlay').show();
		var var_account_id = $("#account_id").val();
		var var_duration = $("#duration").val();
		$.ajax({
			url: "/transacts",
			type: "GET",
			data: {account_id: var_account_id, duration: var_duration },
			dataType: "script",
			cache: true,
			success: function(data) {
				$('.loadingOverlay').hide();
			}
		});
	}
}

 //  On select option OnChnage Calls trensacts#index actions with selected values
function update_transacts(){
	if (($("#account_id").val()!=="") && ($("#duration").val()!==""))
	{
		var var_account_id = $("#account_id").val();
		var var_duration = $("#duration").val();
		var url = "transacts?account_id="+var_account_id+"&duration="+var_duration;
		window.location=url;
	}
}
