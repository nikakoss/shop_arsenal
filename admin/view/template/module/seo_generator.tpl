<div>
	<div class="fullscreen" onclick="javascript:fullscreen();"><?php echo $this->language->get('text_seo_fullscreen'); ?></div>
	<?php if($simulate){ ?>
	<div class="simulation"><?php echo $this->language->get('text_seo_simulation_mode'); ?></div>
	<?php }else{ ?>
	<div class="simulation write"><?php echo $this->language->get('text_seo_write_mode'); ?></div>
	<?php } ?>
	<?php foreach($langs as $lang){ ?>
		<?php if(!isset($lang['no_old'])){ ?><div class="toggle" onclick="javascript:display_old();"><?php echo $this->language->get('text_seo_show_old'); ?></div><?php } ?>
		<h3><?php echo $this->language->get('text_seo_type_'.$type); ?> - <?php echo $this->language->get('text_seo_mode_'.$mode); ?></h3>
		<table class="res_table">
			<thead>
				<tr>
					<td style="width:20px"></td>
					<td><?php echo $this->language->get('text_seo_'.$type); ?></td>
					<td><?php echo $this->language->get('text_seo_old_value'); ?></td>
					<td><?php echo $this->language->get('text_seo_new_value'); ?></td>
				</tr>
			</thead>
			<tbody>
			<?php foreach($lang['rows'] as $row){ ?>
				<tr>
					<td><img src="view/image/flags/<?php echo $lang['lang_img']; ?>" alt=""/></td>
					<td><a href="<?php echo $row['link']; ?>" target="new"><?php echo $row['name']; ?></a></td>
					<td><?php echo $row['old_value']; ?></td>
					<td<?php if($row['changed']){ ?> class="c"<?php } ?>><?php echo $row['value']; ?></td>
				</tr>
			<?php } ?>
			</tbody>
		</table>
		<h3 class="count"><?php if(isset($lang['count'])){ ?><?php echo $lang['count']; ?> <?php echo $this->language->get('text_seo_change_count'); ?><?php } ?></h3>
	<?php } ?>
	<?php if(!count($langs)){ ?>
		<p><?php echo $this->language->get('text_seo_no_language'); ?></p>
	<?php } ?>
</div>