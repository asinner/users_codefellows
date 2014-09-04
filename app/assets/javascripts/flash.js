var flash_on_ready = function() {
	
	$('body').on('click', '.flash', function() {
		
		$(this).remove();
		
	});	
	
}
$(document).on('ready', flash_on_ready);
$(document).on('page:load', flash_on_ready);