<div class="categories">
	<?php foreach ($categories as $category) { ?>
		<div>
			<a href="<?php echo $category['href']; ?>" class="title"><span><img src="<?php echo $category['image']; ?>" alt=""/></span><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
					<?php foreach ($category['children'] as $child) { ?>
							<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a> 
							<?php if ($child != end($category['children'])) { echo '&nbsp;-&nbsp;'; } ?>
					<?php } ?>
			<?php } ?>
		</div>
	<?php } ?>
</div>





