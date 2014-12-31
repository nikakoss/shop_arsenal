<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
    
<div id="anitabs" class="ani_htabs"> 
	<a href="#anitab-style" style="display: inline;" class="">Style</a>
	<a href="#anitab-status" style="display: inline;" class="">Status</a>
</div>
    
<div id="anitab-status" style="display: none;">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="left"><select name="aninews_module_status">
                  <?php
                  	if($aninews_module_status == 1){                    
                  ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php
                  }else{
                  ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php
                  }
                  ?>            
                </select></td>
            </tr>
          </thead>
        </table>    
</div>
            
<div id="anitab-style" style="display: none;">
	
<p>
	Below Div is the view of the new letter window which will appear to the front user's this contains three parts which you adjust from here 
    like it's style (color,border etc ).</br>
    its positions etc(top, bottom, left etc),and the content which you would like to print on the popup (like head text button text etc).
</p>
<table width="100%" cellspacing="0" cellpadding="2" border="0" class="list">
	<thead>
    	<tr><td colspan="4" class="left">Style The Div</td></tr>
    </thead>
	<tbody>
    	<tr>
			<td width="200" class="left">Background Color</td>
            <td class="left"><input type="text" name="ani_background_color" value="<?php echo $style_array['ani_background_color']; ?>"/></td>
            <td width="200" class="left">Main Border Color</td>
            <td class="left"><input type="text" name="ani_main_border_color" value="<?php echo $style_array['ani_main_border_color']; ?>"/></td>            
        </tr>

    	<tr>
			<td width="200" class="left">Main Box Shadow color</td>
            <td class="left"><input type="text" name="ani_main_boxshadow_color" value="<?php echo $style_array['ani_main_boxshadow_color']; ?>"/></td>
			<td width="200" class="left">Label Text Color</td>
            <td class="left"><input type="text" name="ani_label_text_color" value="<?php echo $style_array['ani_label_text_color']; ?>"/></td>            
        </tr> 

    	<tr>
			<td width="200" class="left">Button Background color</td>
            <td class="left"><input type="text" name="ani_button_background_color" value="<?php echo $style_array['ani_button_background_color']; ?>"/></td>
			<td width="200" class="left">Button Background Hover color</td>
            <td class="left"><input type="text" name="ani_button_background_hover_color" value="<?php echo $style_array['ani_button_background_hover_color']; ?>"/></td>            
        </tr>

     	<tr>
			<td width="200" class="left">Close Link Color</td>
            <td class="left"><input type="text" name="ani_close_link_color" value="<?php echo $style_array['ani_close_link_color']; ?>"/></td>
			<td width="200" class="left">Close Link Hover color</td>
            <td class="left"><input type="text" name="ani_close_link_hover_color" value="<?php echo $style_array['ani_close_link_hover_color']; ?>"/></td>            
        </tr>
   </tbody>
</table>

<!-- <table width="100%" cellspacing="0" cellpadding="2" border="0" class="list">
	<thead>
    	<tr><td colspan="2" class="left">Position The Div</td></tr>
    </thead>
	<tbody>
    	<tr>
			<td width="200" class="left">Position</td>
            <td class="left">
            	<select id="ani_postion_div">
                	<option value="top_left">Top Left</option>
                	<option value="top_right">Top Right</option>
                	<option value="bottom_right">Bottom Right</option>
                	<option value="bottom_left">Bottom Left</option>                                                            
                </select>
            </td>
        </tr>
   </tbody>
</table> -->

<table width="100%" cellspacing="0" cellpadding="2" border="0" class="list">
	<thead>
    	<tr><td colspan="4" class="left">Text The Div</td></tr>
    </thead>
	<tbody>
    	<tr>
			<td width="200" class="left">Heading</td>
            <td class="left"><input type="text" name="ani_heading" value="<?php echo $text_array['ani_heading']; ?>"/></td>
			<td width="200" class="left">Label Title</td>
            <td class="left"><input type="text" name="ani_label_title" value="<?php echo $text_array['ani_label_title']; ?>"/></td>            
        </tr>
    	<tr>

        </tr>
    	<tr>
			<td width="200" class="left">Placeholder Text</td>
            <td class="left"><input type="text" name="ani_placeholder_text" value="<?php echo $text_array['ani_placeholder_text']; ?>"/></td>
			<td width="200" class="left">Button Text</td>
            <td class="left"><input type="text" name="ani_button_text" value="<?php echo $text_array['ani_button_text']; ?>"/></td>            
        </tr>
    	<tr>
			<td width="200" class="left">Close Link Text</td>
            <td class="left" colspan="3"><input type="text" name="ani_close_link_text" value="<?php echo $text_array['ani_close_link_text']; ?>"/></td>
        </tr>        
   </tbody>
</table>
    
    </form>
</div>    

    
    </div>
  </div>
</div>
<script type="text/javascript"><!--
	$('#anitabs a').tabs();
	/*$('#ani_postion_div').live('change', function() {
		var ani_pos = $(this).attr('value');
		var ani_pos_split = ani_pos.split("_");
		$("#ani_content").css(ani_pos_split[1],"10px");		
		$("#ani_content").css(ani_pos_split[0],"10px");
	});*/
	//
//--></script> 


<!--
<div id="aninews">
	<div id="ani_content">
    	<div id="ani_container">    
            <div id="ani_container_head">
                <div class="ani_news_h1">Ani News Letter</div>       
                <div class="ani_news_close" id="aninews_close">
                    Close
                </div>
            </div>
	    </div>
        <div class="ani_newsblock">
            <div style="padding:0 0 5px 2px;">Please Fill  Your Email Id</div>
            <div><input type="text" name="aninews_email" id="aninews_email" value="" class="large-field" placeholder="Enter The Email To Subscribe"></div>
            <div id="aninews_error"></div>
            <div style="padding:10px 0 5px 2px;"><buton class="newsform-btn-field" id="save_email_for_aninews">Go</buton></div>
        </div>
    </div>
</div>
-->

<style type="text/css">

/*
ani_background_color
ani_main_border_color
ani_main_boxshadow_color
ani_label_text_color
ani_button_background_color
ani_button_background_hover_color
ani_close_link_color
ani_close_link_hover_color
*/

/* tab css start */
.ani_htabs{
	padding: 0px 0px 0px 10px;
	height: 30px;
	line-height: 16px;
	border-bottom: 1px solid #DDD;
	margin-bottom: 15px;
}

.ani_htabs a.selected {
padding-bottom: 7px;
background: white;
}

.ani_htabs a{
	border-top: 1px solid #DDD;
	border-left: 1px solid #DDD;
	border-right: 1px solid #DDD;
	background: white url('http://localhost/opencart_v1_5_4/admin/view/image/box.png') repeat-x;
	padding: 7px 15px 6px 15px;
	float: left;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	color: black;
	margin-right: 2px;
}
/* tab css end */


/*
.ani_news_h1{
	float:left;
}

#ani_container_head{
	overflow:auto;
}

#ani_content{
	position:fixed;
	bottom:10px;
	right:10px;
	padding:15px;
	text-align:center;
	background-color:#FB2B75;
	border: 1px solid #DDD;
	-webkit-box-shadow: 0px 2px 2px #DDDDDD;
	border-radius:5px;
	z-index:2500;
}

#ani_container{
	overflow:auto;
	text-align:left;
}

.ani_news_close{
	float:right;
	padding-top:2px;
	font-weight:bold;
	cursor:pointer;
}

.ani_news_close:hover{
	color:#FFFFFF;
}

.newsform-btn-field{
	background-color: #32353A;
	display:inline-block;
	text-decoration: none;
	font-size: 12px;
	padding: 0 25px;
	line-height: 30px;
	height: 30px;
	border-radius: 3px;
	border: none;
	color: white;
	cursor:pointer;
}

.newsform-btn-field:hover{
	background-color: #3DBCD4;
}

.ani_news_h1{
	font-family: 'Roboto Condensed', Arial, Helvetica, sans-serif;
	margin-top: 0px;
	margin-bottom: 5px;
	font-size: 30px;
	font-weight: normal;
}

.ani_newsblock{
	padding:5px;
	margin:5px;
	float:left;
	font-family:sans-serif;
	font-size:14px;
	min-width:40%;
	text-align:left;
}

input.large-field[type="text"]{
	min-width:40%;
	padding:5px;
}

input.large-field, select.large-field {
	width: 300px;
}
*/
</style>

</div>


<?php echo $footer; ?>