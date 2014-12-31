<style>
input[type="text"] {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #CCCCCC;
    border-radius: 3px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2) inset;
    margin-bottom: 15px;
    margin-left: 0;
    margin-right: 0;
    outline: 4px solid #EEEEEE;
    padding: 5px 2%;
    width: 100%;
}
form input[type="submit"], form input[type="button"] {
    background: linear-gradient(to bottom, #DADADA 0%, #E6E6E6 50%, #F3F3F3 100%) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: 1px solid #D3D3D3;
    border-radius: 2px;
    box-shadow: 0 1px 2px 0 #FF9900;
    cursor: pointer;
    font: bold 12px tahoma;
    margin-left: 39%;
    text-shadow: 1px 1px 2px #FFFFFF;
}
.warning {
    color: #FF9900;
}

</style>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p><?php echo $text_email; ?></p>  
     
		 <input required placeholder="<?php echo $entry_email; ?>"  type="text" name="email" >
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
		
  </form>

