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

// Following JS code for refreshing DIV content which have random qoute:
//window.setInterval(pick_random_qoute, 20000);
function pick_random_qoute() {
  $.ajax({
    url: '/qoutes/random_qoute',
    type: 'get',
    dataType:'script',
    data: { },
    success: function(data){
      // $("pick_random_qoute").fadeOut(function(){
      //         $(this).html(data).fadeIn(); // Removed the .hide()
      //     }); // end fadeout
    }
  });
  return false;
}

// Following JS code showing modl-box for filtering data on Transactions:
$(function(){

var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");

  $('a[data-modal-id]').click(function(e) {
    e.preventDefault();
    $("body").append(appendthis);
    $(".modal-overlay").fadeTo(500, 0.7);
    //$(".js-modalbox").fadeIn(500);
    var modalBox = $(this).attr('data-modal-id');
    $('#'+modalBox).fadeIn($(this).data());
  });


$(".js-modal-close, .modal-overlay").click(function() {
  $(".modal-box, .modal-overlay").fadeOut(500, function() {
    $(".modal-overlay").remove();
  });
});

$(window).resize(function() {
  $(".modal-box").css({
    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
  });
});

$(window).resize();

});
