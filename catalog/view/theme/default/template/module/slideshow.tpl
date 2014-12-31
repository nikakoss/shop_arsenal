<div class="actions">
    <h2>Акции и спецпредложения</h2>
    <div class="inner_flexslider">
    <div id="slider" class="flexslider">
        <ul class="slides">
            <?php foreach ($banners as $banner) { ?>
            <li>            
                <?php if ($banner['link']) { ?>                      
                    <a   href="<?php echo $banner['link']; ?>">
                     <?php }  ?>    
                     <img src="<?php echo $banner['image']; ?>"  alt="<?php if ($banner['title'])  echo $banner['title']; ?>" title="<?php if ($banner['title'])  echo $banner['title']; ?>"/>                   
                    <?php if ($banner['link']) { ?> 
                    </a>
                    <?php }  ?> 
                
            </li>
            <?php } ?>  	    		
        </ul>
    </div>
    <div id="carousel" class="flexslider">
        <ul class="slides">
            <?php foreach ($banners as $banner) { ?>
            <li>
                <img src="<?php echo $banner['image']; ?>" />
            </li>
            <?php } ?>

        </ul>
    </div>
</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
/*	$(function(){
      SyntaxHighlighter.all();
    });*/
    $(window).load(function(){
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 110,
        itemMargin: 100,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        controlNav: false,
        slideshow: false,
        sync: "#carousel",
        start: function(slider){
          /*$('body').removeClass('loading');*/
        }
      });
    });
});
--></script>