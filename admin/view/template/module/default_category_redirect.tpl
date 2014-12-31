<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?>
		<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1>
				<img src="view/image/module.png" alt="" />
				<?php echo $heading_title; ?>
			</h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?> </a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?> </a>
			</div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<div class="vtabs">
					<?php foreach ($stores as $store) { ?>
					<a href="#tab-store-<?php echo $store['store_id']; ?>" id="store-<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></a>
					<?php } ?>
				</div>
				<?php foreach ($stores as $store) { ?>
				<div id="tab-store-<?php echo $store['store_id']; ?>" class="vtabs-content">
					<input type="hidden" name="default_category_redirect[<?php echo $store['store_id']; ?>][default_category_redirect][type]" value="0" />
					<table class="form">
						<tr>
							<td>
								<?php echo $entry_always_redirect; ?>
								<span class="help"><?php echo $help_always_redirect;?></span>
							</td>
							<td><input type="radio" name="default_category_redirect[<?php echo $store['store_id']; ?>][default_category_redirect][type]" value="1" /></td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_selective_redirect; ?>
								<span class="help"><?php echo $help_selective_redirect;?></span>
							</td>
							<td><input type="radio" name="default_category_redirect[<?php echo $store['store_id']; ?>][default_category_redirect][type]" value="2" /></td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_redirect_if_no_path; ?>
								<span class="help"><?php echo $help_redirect_if_no_path;?></span>
							</td>
							<td><input type="radio" name="default_category_redirect[<?php echo $store['store_id']; ?>][default_category_redirect][type]" value="3" /></td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_status; ?>
							</td>
							<td><select name="default_category_redirect[<?php echo $store['store_id']; ?>][default_category_redirect][status]">
								<?php if ($default_category_redirect[$store['store_id']]['default_category_redirect']['status']) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
			                </select></td>
						</tr>
					</table>
					<input type="hidden" name="default_category_redirect[<?php echo $store['store_id']; ?>][store_id]"  value="<?php echo $store['store_id']; ?>"/>
				</div>
				<?php } ?>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('.vtabs a').tabs();
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
<?php foreach($stores as $store)  { ?>
	$('#tab-store-<?php echo $store['store_id']; ?> input[value=\'<?php echo $default_category_redirect[$store['store_id']]['default_category_redirect']['type']; ?>\']').attr('checked','checked');
<?php } ?>
});
//--></script>
<?php echo $footer; ?>