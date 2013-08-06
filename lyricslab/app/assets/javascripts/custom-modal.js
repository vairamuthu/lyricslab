$(document).ready(function() {
	
// Support for AJAX loaded modal window.
// Focuses on first input textbox after it loads the window.
$('[data-toggle="modal"]').click(function(e) {
	
	e.preventDefault();
	var url = $(this).attr('href');	
	if (url.indexOf('#') == 0) {
		jQuery.noConflict();
		$(url).modal('open');
	} else {
		jQuery.noConflict();
		
		$.get(url, function(data) {			
			jQuery.noConflict();
			$('.modal').html(data)			
			$('#mymodal').modal('show');
			
		});
	}
});
	
});