$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		obj.click(function() {
			$(selector).removeClass('selected');

			$(this).addClass('selected');
			
			var div_id = $(this).attr('href');
			
			$(div_id).fadeIn(1, function() {
				if (obj.attr('data-js') == 'jcarousel' && !$(div_id).find('.jcarousel-container').length) {
					$(div_id).find('.jcarousel-skin-opencart').jcarousel({
						vertical: false,
						visible: 3,
						scroll: 1
					});
				}
			});
			
			$(selector).not(this).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};