<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="middle">
    <div class="textblock">
      <div style="margin-top: 10px; margin-bottom: 10px;"><?php echo $description; ?></div>
      <?php if (isset($galleries)) { ?>
        <div class="heading"><?php echo $text_gallery; ?></div>
        <table class="list" style="padding-top: 8px;">
          <?php for ($i = 0; $i < sizeof($galleries); $i = $i + 4) { ?>
          <tr>
            <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
            <td width="25%"><?php if (isset($galleries[$j])) { ?>
              <a href="<?php echo $galleries[$j]['href']; ?>"><img src="<?php echo $galleries[$j]['thumb']; ?>" title="<?php echo $galleries[$j]['name']; ?>" alt="<?php echo $galleries[$j]['name']; ?>" /></a><br />
              <a href="<?php echo $galleries[$j]['href']; ?>"><?php echo $galleries[$j]['name']; ?></a><br />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <?php } ?>
        </table>
      <?php } ?>
      <?php if (isset($images)) { ?>
        <div class="heading"><?php echo $text_images; ?></div>
        <div style="text-align: center; margin-bottom: 10px;"><?php echo $text_enlarge; ?></div>
        <table class="list" style="padding-top: 8px;">
          <?php for ($i = 0; $i < sizeof($images); $i = $i + 4) { ?>
          <tr>
            <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
            <td width="25%"><?php if (isset($images[$j])) { ?>
              <a href="<?php echo $images[$j]['popup']; ?>" title="<?php echo $images[$j]['title']; ?>" class="thickbox" rel="gallery_<?php echo $gallery_id; ?>"><img src="<?php echo $images[$j]['thumb']; ?>" title="<?php echo $images[$j]['title']; ?>" alt="<?php echo $images[$j]['title']; ?>" /></a><br />
              <a href="<?php echo $images[$j]['popup']; ?>" title="<?php echo $images[$j]['title']; ?>" class="thickbox" rel="gallery__<?php echo $gallery_id; ?>"><?php echo $images[$j]['title']; ?></a><br />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <?php } ?>
        </table>
        <div class="pagination"><?php echo $pagination; ?></div>
      <?php } ?>
    </div>
    <div class="copyblock"><?php echo $text_copyright; ?></div>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
</div>
<?php echo $footer; ?>