<!--  		<div class="popup">
            <div class="popup-shadow"></div>
            <div class="popup-container">
                <img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
                <h2>Обратный звонок</h2>
				<div class="cbContent callback">
					<div class="big-input-border"><input placeholder="Как к Вам обращаться?" type="text" name="callback_name"></div>
					<div class="big-input-border"><input placeholder="Номер телефона" type="text" name="callback_phone"></div>
					<div class="big-input-border"><input placeholder="Удобное время для звонка" type="text" name="callback_time"></div>
				</div>
				<div class="cbbutton">
					<a href="javascript:submitCallback()">Отправить</a>
				</div>
            </div>
		</div>   -->
		
		
<?
if (isset ($_POST['timeFF'])) {
  mail ("xttp.org@gmail.com",
        " ".$_SERVER['HTTP_REFERER'],
        "Имя: ".$_POST['nameFF']."\nEmail: ".$_POST['contactFF']."\nСообщение: ".$_POST['timeFF']);
  echo ('<p style="color: green">Ваше сообщение получено, спасибо!</p>');
  $_POST['nameFF'] = $_POST['contactFF'] = $_POST['timeFF'] = '';
}
?>
<div class="popup">
	<div class="popup-shadow"></div>
	<form method="POST" id="feedback-form"><div class="popup-container">
		<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
		<h2>Нашли дешевле?</h2>
		
			<div class="cbContent callback">
				<input type="text" name="nameFF" required placeholder="Телефон" x-autocompletetype="name">
				<input type="text" name="contactFF" required placeholder="Ссылка" x-autocompletetype="email">
				
			</div>
			<div class="cbbutton">
				<input type="submit" value="отправить">
			</div>
		
	</div></form>
</div>