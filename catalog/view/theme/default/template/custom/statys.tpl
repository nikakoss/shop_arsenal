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
		<h2>Статус заказа</h2>
		
			<div class="cbContent callback">
				<input type="text" name="nameFF" required placeholder="фамилия имя отчество" x-autocompletetype="name">
				<input type="text" name="contactFF" required placeholder="Номер заказа" x-autocompletetype="email">
				
			</div>
			<div class="cbbutton">
				<input type="submit" value="отправить">
			</div>
		
	</div></form>
</div>