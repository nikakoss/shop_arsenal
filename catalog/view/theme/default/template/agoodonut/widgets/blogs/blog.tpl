<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
	   <div class="textrubric"><p><strong>РУБРИКИ БЛОГА:</strong></p></div>
	  <div class="box-ul">
<?php
if (count($myblogs)>0) {
	foreach ($myblogs as $blogs) {		for ($i=0; $i<$blogs['flag_start']; $i++) {
?>		<ul class="padding_<?php  echo $blogs['level'];?>" style="<?php if(!$blogs['display']) echo 'display:none;' ?>">
			<li><a href="<?php if($blogs['active']=='active') echo $blogs['href']."#";  else echo $blogs['href']; ?>" class="<?php if($blogs['active']=='active') echo 'active'; if($blogs['active']=='pass') echo 'pass'; ?>"><span class='doskobki'><?php echo $blogs['name']; ?></span> <?php if ($blogs['count']>0)  ?> <span class='skobki'><?php  echo " (".$blogs['count'].")"; ?></span></a>
<?php
			for ($m=0; $m<$blogs['flag_end']; $m++) {
?> 			</li>
		</ul>
<?php
			}
		}
	}
}
?>
		</div>
	</div>
</div>