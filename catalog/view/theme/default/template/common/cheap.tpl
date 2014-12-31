<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ваш запрос был отправлен</title>
<style type="text/css">
body, td, th, input, textarea, select, a {    font-size: 12px;}
body {    background-color: #fff;    color: #000000;    font-family: Verdana;    margin: 0;    padding: 0;}
.content {    background-color: #FFFFFF;	width:290px;}
input[type="text"], input[type="password"], textarea {    background: none repeat scroll 0 0 #F8F8F8;    border: 1px solid #CCCCCC;}
.content {    border: 1px solid #EEEEEE;    margin: 5px;    padding: 5px;}
input.button, a.button {    border: 0 none;    height: 24px;    margin: 0;    padding: 0 12px;}
a.button, input.button {
    -moz-border-radius: 7px 7px 7px 7px;
    -moz-box-shadow: 2px 3px 2px #0FA1E0;
    background: #0FA1E0;
    color: #FFFFFF;
    cursor: pointer;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    font-weight: bold;
}
.error {
    color: #FF0000;
    display: block;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="content">
<?php echo $heading_title; ?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="200" align="center"> <?php echo $text_message; ?></td>
  </tr>
  <tr>
    <td height="40" align="center">
	        <div align="center">
          <input onclick="window.close()" type="submit"  value="Закрыть окно" class="button" />
        </div>
		</td>
  </tr>
</table>
</div>
</body>
</html>