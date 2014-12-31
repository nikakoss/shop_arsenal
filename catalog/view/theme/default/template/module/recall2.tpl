<div class="popup">
    <div class="popup-shadow"></div>
    <div class="popup-container">
        <img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
        <h2>Нашли дешевле?</h2>
        <div style="display:none;" id="recall2_success" class="success_block">
		<span class="success_message" style="text-align:center">
			<?php echo $text_success?>
		</span>
        </div>
        <form id="recall2_ajax_form" onsubmit="return recall2_ajax();" method="POST">
            <input type="hidden" value="yes" name="recall2">
            <div class="cbContent callback">
                <input required placeholder="Номер телефона" type="text" class="recall2_input" value="" id="user_phone"
                       name="user_phone">
                <div id="user_phone_error" class="error_message"></div>
                <?php if ($show_name) { ?>
                <input type="text" class="recall2_input" value="" id="user_name" name="user_name"
                       placeholder="Ссылка на товар с меньшей ценой">
                <div id="user_name_error" class="error_message"></div>
                <?php } ?>
                <?php if ($show_time) { ?>
                <input type="text" placeholder="Удобное время для звонка" class="recall2_input" value=""
                       id="recommend_to_call" name="recommend_to_call"><!-- <div id="recommend_to_call_error" class="error_message"></div> -->
                <?php } ?>
                <img style="display:none;" id="load_recall2" class="load_recall"
                     src="/catalog/view/javascript/jquery/colorbox/images/loading.gif">
                <div class="cbbutton"><input id="submit_recall2" type="submit" value="отправить"></div>
            </div>
        </form>
    </div>
</div>
<script>
    function recall2_close() {
        $('#recall2_form').hide();
        return false;
    }
    function recall2_show() {
        margin_top = -$('#recall2_form').height() / 2;
        margin_left = -$('#recall2_form').width() / 2;
        $('#recall2_form').css({'margin-left': margin_left, 'margin-top': margin_top });
        $('#recall2_form').show();
        $('#recall2_ajax_form').show();
        $('#recall2_success').hide();
        $('#user_name').val('');
        $('#user_phone').val('');
        $('#recommend_to_call').val('');
        $('#user_comment').val('');
        $('#recall2_code').val('');
        return false;
    }
    function show_message_recall2(id_message, message) {
        $('#' + id_message + '_error').html(message).show();
        $("#" + id_message).focus();
        $("#" + id_message).addClass('input_error');
        return false;
    }
    function recall2_ajax() {
		
		if($('#user_name').val().length<10){
			$('#user_name_error').html('<div class="not"><div class="left"></div><div class="center">Добавьте ссылку на  товар</div><div class="right"></div></div>').show();
			return false;
		}
		
        var vars = $('#recall2_ajax_form').serialize();
        $('#load_recall2').show();
        $('#submit_recall2').hide();
        $.ajax({
            type: "POST",
            data: 'recall2=yes&' + vars,
            url: 'index.php?route=module/recall2/ajax',
            dataType: 'json',
            success: function (json) {
                $('#load_recall2').hide();
                $('#submit_recall2').show();
                $('.recall2_input').removeClass('input_error');
                $('.error_message').html('').hide();
                switch (json['result']) {
                    case 'success':
                        $('#recall2_message2').hide();
                        $('#recall2_ajax_form').hide();
                        $('#recall2_success').show();
                        break;
                    case 'error':
                        $.each(json['errors'],
                                function (index, value) {
                                    show_message_recall2(index, value);
                                });
                        break;
                }
            }
        });
        return false;
    }
    document.onclick = function () {
        document.getElementById('user_phone_error').style.display = 'none'
    }
</script>
