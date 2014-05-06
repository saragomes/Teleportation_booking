// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require bootstrap.min
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({dateFormat: 'dd-mm-yy'}); 
});

jQuery(function($){
  $.datepicker.setDefaults({ dateFormat: 'dd-mm-yy' }); 
}); 

$('#select-all').click(function (event) {
  var selected = this.checked;
  $(':checkbox').each(function () {    this.checked = selected; });
});

 $(function() {
	$( "#start" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 3,
		onClose: function( selectedDate ) {
			$( "#start" ).datepicker( "option", "minDate", selectedDate );
		}
		});
		$( "#end" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 3,
		onClose: function( selectedDate ) {
			$( "#end" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});

