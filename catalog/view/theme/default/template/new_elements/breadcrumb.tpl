<?php if (isset($breadcrumbs) && $breadcrumbs) { ?>
	<ul class="bread_crumbs clearfix">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li>
				<a href="<?php echo $breadcrumb['href']; ?>">
					<?php echo $breadcrumb['text']; ?>
				</a>
			</li>
		<?php } ?>
	</ul>
<?php } ?>