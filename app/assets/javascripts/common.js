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