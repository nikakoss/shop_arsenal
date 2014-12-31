<div class="popup popup-recall">
    <div class="popup-shadow"></div>
    <div class="popup-container">
        <img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
        <h2>Обратный звонок</h2>
        <div style="display:none;" id="recall_success"  class="success_block">
            <span class="success_message" style="text-align:center">
                <?php echo $text_success?>
            </span>
        </div>
        <form id="recall_ajax_form" onsubmit="return recall_ajax();" method="POST">
            <input type="hidden" value="yes" name="recall">
            <div class="cbContent callback">
                <?php if ($show_name) { ?>
                <input type="text" class="recall_input" value="" id="user_name" name="user_name" placeholder="Фамилия имя отчество"><div id="user_name_error" class="error_message"></div>
                <?php } ?>
                <input required placeholder="Номер телефона"  type="text" class="recall_input" value="" id="user_phone" name="user_phone"><div id="user_phone_error" class="error_message"></div>
                <?php if ($show_time) { ?>
                <input type="text" placeholder="Удобное время для звонка" class="recall_input" value="" id="recommend_to_call" name="recommend_to_call"><!-- <div id="recommend_to_call_error" class="error_message"></div> -->
                <?php } ?>
                <img style="display:none;" class="load_recall" id="load_recall" src="/catalog/view/javascript/jquery/colorbox/images/loading.gif">
                <div class="cbbutton"><input id="submit_recall" type="submit" value="отправить"></div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function() {
      $("#user_phone").mask("+7(999) 999-99-99");
    });

    function recall_close() {
        $('#recall_form').hide();
        return false;
    }

    function recall_show() {
        margin_top = -$('#recall_form').height() / 2;
        margin_left = -$('#recall_form').width() / 2;
        $('#recall_form').css({'margin-left': margin_left, 'margin-top': margin_top });
        $('#recall_form').show();

        $('#recall_ajax_form').show();
        $('#recall_success').hide();

        $('#user_name').val('');
        $('#user_phone').val('');
        $('#recommend_to_call').val('');
        $('#user_comment').val('');
        $('#recall_code').val('');
        return false;
    }

    function show_message_recall(id_message, message) {
        $('#' + id_message + '_error').html(message).show();
        $("#" + id_message).focus();
        $("#" + id_message).addClass('input_error');
        return false;
    }

    function recall_ajax() {
		
		if($("#user_phone").val().length<5) return false;
		
        var vars = $('#recall_ajax_form').serialize();
		
        $('#load_recall').show();
        $('#submit_recall').hide();
        $.ajax({
            type: "POST",
            data: 'recall=yes&' + vars,
            url: 'index.php?route=module/recall/ajax',
            dataType: 'json',
            success: function(json) {
                $('#load_recall').hide();
                $('#submit_recall').show();
                $('.recall_input').removeClass('input_error');
                $('.error_message').html('').hide();
                switch (json['result']) {
                    case 'success':
                        $('#recall_message2').hide();
                        $('#recall_ajax_form').hide();
                        $('#recall_success').show();
                        break;
                    case 'error':
                        $.each(json['errors'],
                                function(index, value) {
                                    show_message_recall(index, value);
                                });

                        break;
                }
            }
        });
        return false;
    }
    document.onclick = function() {
        document.getElementById('user_phone_error').style.display = 'none'
    }
</script>
