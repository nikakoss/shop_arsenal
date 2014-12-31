<div class="top_footer clearfix">
    <?php
    if (count($myblogs) > 0) {
    foreach ($myblogs as $blogs) {
    ?>
    
    <div class="menu_footer">
                    <h2><?php echo $blogs['name']?></h2>
                    
                </div>
    
    <?php
   //     var_dump($blogs);
    }   
    }
    ?>
</div>