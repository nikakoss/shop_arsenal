<? 
if (isset($_GET['id'])) {$id = $_GET['id'];}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $heading_title; ?></title>
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
	font-size: 10px;
}
</style>

</head>
<body>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<div class="content">
<?php echo $heading_title2; ?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td colspan="2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><b><?php echo $entry_name; ?></b></td>
    <td height="30" align="right"><input name="name" type="text" value="<?php echo $name; ?><?php if(isset($id)) echo $id; ?>" size="33" /></td>
  </tr>
</table>
</td></tr>

				<tr>
          <td colspan="2"><?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
          </tr>
		  
		  <tr><td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><strong><?php echo $entry_name2; ?></strong></td>
              <td align="right"><input name="name2" type="text" value="<?php echo $name2; ?>" size="33" /></td>
            </tr>
          </table>
		    </td></tr>
		
				<tr>
          <td colspan="2"><?php if ($error_name2) { ?>
            <span class="error"><?php echo $error_name2; ?></span>
            <?php } ?></td>
          </tr>
		  		  <tr><td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><strong><?php echo $entry_name3; ?></strong></td>
              <td align="right"><input name="name3" type="text" value="<?php echo $name3; ?>" size="33" /></td>
            </tr>
          </table>
		    </td></tr>
		
				<tr>
          <td colspan="2"><?php if ($error_name3) { ?>
            <span class="error"><?php echo $error_name3; ?></span>
            <?php } ?></td>
          </tr>
		  		  <tr><td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><strong><?php echo $entry_name4; ?></strong></td>
              <td align="right"><input name="name4" type="text" value="<?php echo $name4; ?>" size="33" /></td>
            </tr>
          </table>
		    </td></tr>
		
				<tr>
          <td colspan="2"><?php if ($error_name4) { ?>
            <span class="error"><?php echo $error_name4; ?></span>
            <?php } ?></td>
          </tr>
        <tr>
          <td height="30" colspan="2">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><b><?php echo $entry_email; ?></b></td>
              <td align="right"><input name="email" type="text" value="<?php echo $email; ?>" size="33" /></td>
            </tr>
          </table>
		  </td>
        </tr>
		        <tr>
          <td colspan="2"><?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td>
          </tr>
        <tr>
          <td colspan="2"><?php echo $entry_enquiry; ?></td>
        </tr>
        <tr>
          <td colspan="2"><textarea name="enquiry" cols="40" rows="5" style="width: 99%;"><?php echo $enquiry; ?></textarea>
            <br />
            <?php if ($error_enquiry) { ?>
            <span class="error"><?php echo $error_enquiry; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><b><?php echo $entry_captcha; ?></b></td>
          <td height="30"><input type="text" name="captcha" value="<?php echo $captcha; ?>" /></td>
        </tr>
		        <tr>
          <td colspan="2"><?php if ($error_captcha) { ?>
            <span class="error"><?php echo $error_captcha; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><img src="index.php?route=information/cheap/captcha" alt="" /></td>
          <td align="center">    <div class="buttons">
      <div class="right">
	  <input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
        <div align="center">
          <input onclick="window.close()" type="submit"  value="&nbsp;&nbsp;<?php echo $text_close; ?>&nbsp;&nbsp;" class="button" />
        </div></td>
        </tr>
      </table>
  </div>
 </form>
</body>
</html>