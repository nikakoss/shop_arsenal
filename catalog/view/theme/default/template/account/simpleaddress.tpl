<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="clearfix personal_base">
    <div class="dashboard-header clearfix">
        <div class="left">
            <h4><?php echo $heading_title; ?></h4>	
            <?php if (isset($breadcrumbs) && $breadcrumbs) { ?>
	<ul class="bread_crumbs clearfix">
		<?php $count=1; foreach ($breadcrumbs as $breadcrumb) {  ?>
                <li>
				<a href="<?php echo $breadcrumb['href']; ?>">
					<?php echo $breadcrumb['text']; ?>
				</a>
		</li>
		<?php  } ?>
	</ul>
        <?php } ?>
        </div>
    </div>
  
    

<div class="simple-content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="simpleaddress">
        <div class="simpleregister">
            <?php
                $first_field = reset($address_fields); 
                $first_field_header = !empty($first_field) && $first_field['type'] == 'header'; 
                $i = 0;
            ?>
            <?php if ($first_field_header) { ?>
                <?php echo $first_field['tag_open'] ?><?php echo $first_field['label'] ?><?php echo $first_field['tag_close'] ?>
            <?php } ?>
                <div class="simpleregister-block-content">
                <table class="simplecheckout-customer">
                    <?php foreach ($address_fields as $field) { ?>
                        <?php if ($field['type'] == 'hidden') { continue; } ?>
                        <?php $i++ ?>
                        <?php if ($field['type'] == 'header') { ?>
                        <?php if ($i == 1) { ?>
                            <?php continue; ?>
                        <?php } else { ?>
                        </table>
                        </div>
                        <?php echo $field['tag_open'] ?><?php echo $field['label'] ?><?php echo $field['tag_close'] ?>
                        <div class="simpleregister-block-content">
                        <table class="simplecheckout-customer">
                        <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="simplecheckout-customer-left">
                                    <?php if ($field['required']) { ?>
                                        <span class="simplecheckout-required">*</span>
                                    <?php } ?>
                                    <?php echo $field['label'] ?>
                                </td>
                                <td class="simplecheckout-customer-right">
                                    <?php echo $simple->html_field($field) ?>
                                    <?php if (!empty($field['error']) && $simple_edit_address) { ?>
                                        <span class="simplecheckout-error-text"><?php echo $field['error']; ?></span>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
                    <?php } ?>      
                    <tr>
                        <td class="simplecheckout-customer-left">
                            <?php echo $entry_default ?>
                        </td>
                        <td class="simplecheckout-customer-right">
                            <label><input type="radio" name="default" value="1" <?php echo $default ? ' checked="checked"' : '' ?>><?php echo $text_yes ?></label>
                            <label><input type="radio" name="default" value="0" <?php echo !$default ? ' checked="checked"' : '' ?>><?php echo $text_no ?></label>
                        </td>
                    </tr>              
                </table>        
                <?php foreach ($address_fields as $field) { ?>
                    <?php if ($field['type'] != 'hidden') { continue; } ?>
                    <?php echo $simple->html_field($field) ?>
                <?php } ?>
                <input type="hidden" name="simple_edit_address" id="simple_edit_address" value="1">
            </div>
        </div>
        <div class="simpleregister-button-block buttons">
            <div class="simpleregister-button-left"><a href="<?php echo $back; ?>" class="button btn"><span><?php echo $button_back; ?></span></a></div>
            <div class="simpleregister-button-right">
                <a onclick="$('#simpleaddress').submit();" class="button btn"><span><?php echo $button_continue; ?></span></a>
            </div>
        </div>
    </form>
</div>
<?php include $simple->tpl_footer() ?>