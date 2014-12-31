<?php $i=1; foreach ($modules as $module) { ?>
<?php 
echo '<div class="block_'.$i.'"> ';
echo $module; 
$i++;
?>
</div>
<?php } ?>