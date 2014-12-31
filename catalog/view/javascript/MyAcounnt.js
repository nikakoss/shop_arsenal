$('#submitSave').live('click', function() {
    var count = 1;
    for (var i = 1; i <= 12; i++) {
        if ($('.field-' + i).val() == '') {
            $('.field-' + i).css('border', '1px solid red');
        } else {
            $('.field-' + i).css('border', '1px solid #ccc');
            count++;
        }
    }
    if (count > 12) {        
        this.setAttribute('type', 'submit');
        $('.form_y').attr('method', 'post');
    }
    else {        
        this.setAttribute('type', 'button');        
    }
});
$('#submitSaveF').live('click', function() {
    var count = 13;
    for (var i = 13; i <= 17; i++) {
        if ($('.field-' + i).val() == '') {
            $('.field-' + i).css('border', '1px solid red');
        } else {
            $('.field-' + i).css('border', '1px solid #ccc');
            count++;
        }
    }
    if (count > 17) {        
        this.setAttribute('type', 'submit');
        $('.form_f').attr('method', 'post');
    }
    else {        
        this.setAttribute('type', 'button');        
    }
});