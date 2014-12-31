<?php
foreach ($mylist as $list_num=>$list) { ?>
<div id="list<?php echo $list_num;?>" style="padding-left: 200px;">



  <input type="hidden" name="mylist[<?php echo $list_num; ?>][type]" value="<?php if (isset($list['type'])) echo $list['type']; else echo 'blogs'; ?>">


<table>
    <tr>

    <td colspan="2">
	 <div class="buttons">
	 <a onclick="mylist_num--; $('#amytabs<?php echo $list_num;?>').remove(); $('#mytabs<?php echo $list_num;?>').remove(); $('#mytabs a').tabs(); return false; " class="mbuttonr"><?php echo $this->language->get('button_remove'); ?></a>
<a onclick="
      mylist_num++;
      type_what = '<?php echo $list['type']; ?>';
 		$.ajax({
					url: 'index.php?route=module/blog/ajax_list&token=<?php echo $token; ?>',
					type: 'post',
					data: { type: type_what, list: '<?php echo base64_encode($slist); ?>', num: mylist_num },
					dataType: 'html',
					beforeSend: function()
					{

					},
					success: function(html) {
						if (html) {
							$('#mytabs').append('<a href=\'#mytabs' + mylist_num + '\' id=\'amytabs'+mylist_num+'\'>List-' + mylist_num + '<\/a>');
							$('#lists').append('<div id=\'mytabs'+mylist_num+'\'>'+html+'<\/div>');
							$('#mytabs a').tabs();
							$('#amytabs' + mylist_num).click();
							template_auto();
						}
						$('.mbutton').removeClass('loader');


					}
				});


      return false; " class="mbutton"><?php echo $this->language->get('button_clone_widget'); ?>: <?php echo $this->language->get('text_widget_'.$list['type']); ?></a>

	 </div>

    </td>
    </tr>	 <?php foreach ($languages as $language) { ?>
	<tr>
			<td>
			<?php echo $this->language->get('entry_title_list_latest'); ?> (<?php echo  ($language['name']); ?>)

		</td>

			<td>

				<input type="text" name="mylist[<?php echo $list_num; ?>][title_list_latest][<?php echo $language['language_id']; ?>]" value="<?php if (isset($list['title_list_latest'][$language['language_id']])) echo $list['title_list_latest'][$language['language_id']]; ?>" size="60" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
			</td>

	</tr>
   <?php } ?>

    <tr>
     <td class="left"><?php echo $entry_avatar_dim; ?></td>
     <td class="left">
      <input type="text" name="mylist[<?php echo $list_num; ?>][avatar][width]" value="<?php  if (isset($list['avatar']['width'])) echo $list['avatar']['width']; ?>" size="3" />x
      <input type="text" name="mylist[<?php echo $list_num; ?>][avatar][height]" value="<?php if (isset($list['avatar']['height'])) echo $list['avatar']['height']; ?>" size="3" />
     </td>
    </tr>
	<tr>
			<td>
			<?php echo $this->language->get('entry_template'); ?>

		</td>

			<td>
				<input type="text" class="template" name="mylist[<?php echo $list_num; ?>][template]" value="<?php if (isset($list['template'])) echo $list['template']; ?>" size="60" />
				<input type="hidden" name="tpath" value="widgets/reviews">
			</td>

	</tr>

		    <tr>
		     <td class="left"><?php echo $this->language->get('entry_anchor'); ?></td>
		     <td class="left">
		      <textarea style="width: 96%;" name="mylist[<?php echo $list_num; ?>][anchor]"><?php  if (isset($list['anchor'])) echo $list['anchor']; ?></textarea>
		     </td>
		    </tr>

          <tr>
              <td><?php echo $this->language->get('entry_widget_cached'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][cached]">
                  <?php if (isset($list['cached']) && $list['cached']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

	<tr>
			<td>
			<?php echo $this->language->get('entry_number_per_widget'); ?>

		</td>

			<td>
				<input type="text" name="mylist[<?php echo $list_num; ?>][number_per_widget]" value="<?php  if (isset( $list['number_per_widget'])) echo $list['number_per_widget']; ?>" size="3" />
			</td>

	</tr>


          <tr>
              <td><?php echo $this->language->get('entry_pagination'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][pagination]">
                  <?php if (isset($list['pagination']) && $list['pagination']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>



    <tr>
     <td class="left"><?php echo $this->language->get('entry_blog_num_desc'); ?></td>
     <td class="left">
      <input type="text" name="mylist[<?php echo $list_num; ?>][desc_symbols]" value="<?php  if (isset( $list['desc_symbols'])) echo $list['desc_symbols']; ?>" size="3" />
     </td>
    </tr>

    <tr>
     <td class="left"><?php echo $this->language->get('entry_blog_num_desc_words'); ?></td>
     <td class="left">
      <input type="text" name="mylist[<?php echo $list_num; ?>][desc_words]" value="<?php  if (isset( $list['desc_words'])) echo $list['desc_words']; ?>" size="3" />
     </td>
    </tr>

    <tr>
     <td class="left"><?php echo $this->language->get('entry_blog_num_desc_pred'); ?></td>
     <td class="left">
      <input type="text" name="mylist[<?php echo $list_num; ?>][desc_pred]" value="<?php  if (isset( $list['desc_pred'])) echo $list['desc_pred']; ?>" size="3" />
     </td>
    </tr>








 	<tr>
 		<td>
			<?php echo $this->language->get('entry_order'); ?>
		</td>
		<td>
         <select id="mylist_<?php echo $list_num; ?>_sort"  name="mylist[<?php echo $list_num; ?>][sort]">
           <option value="sort"  <?php if (isset( $list['sort']) &&  $list['sort']=='sort')  { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_sort'); ?></option>
           <option value="latest"  <?php if (isset( $list['sort']) &&  $list['sort']=='latest')  { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_latest'); ?></option>
           <option value="popular" <?php if (isset( $list['sort']) &&  $list['sort']=='popular') { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_popular'); ?></option>
           <option value="rating" <?php if (isset( $list['sort']) &&  $list['sort']=='rating') { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_rating'); ?></option>
           <option value="comments" <?php if (isset( $list['sort']) &&  $list['sort']=='comments') { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_comments'); ?></option>

         </select>
		</td>
	</tr>

 	<tr>
 		<td>
			<?php echo $this->language->get('entry_order_ad'); ?>
		</td>
		<td>
         <select id="mylist_<?php echo $list_num; ?>_order"  name="mylist[<?php echo $list_num; ?>][order]">
           <option value="desc"  <?php if (isset( $list['order']) &&  $list['order']=='desc') { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_desc'); ?></option>
           <option value="asc"   <?php if (isset( $list['order']) &&  $list['order']=='asc')  { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_asc'); ?></option>
        </select>
		</td>
	</tr>



          <tr>
              <td><?php echo $this->language->get('entry_category_status'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_category]">
                  <?php if (isset($list['view_category']) && $list['view_category']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

          <tr>
              <td><?php echo $this->language->get('entry_view_record'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_record]">
                  <?php if (isset($list['view_record']) && $list['view_record']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

<!-- ************************ -->

       <tr>
              <td><?php echo $this->language->get('entry_view_date'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_date]">
                  <?php if (isset($list['view_date']) && $list['view_date']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


          <tr>
              <td><?php echo $this->language->get('entry_view_avatar'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_avatar]">
                  <?php if (isset($list['view_avatar']) && $list['view_avatar']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

          <tr>
              <td><?php echo $this->language->get('entry_view_comments'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_comments]">
                  <?php if (isset($list['view_comments']) && $list['view_comments']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


          <tr>
              <td><?php echo $this->language->get('entry_view_viewed'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_viewed]">
                  <?php if (isset($list['view_viewed']) && $list['view_viewed']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


          <tr>
              <td><?php echo $this->language->get('entry_view_rating'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_rating]">
                  <?php if (isset($list['view_rating']) && $list['view_rating']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

              <tr>
              <td><?php echo $this->language->get('entry_view_rate'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_rate]">
                  <?php if (isset($list['view_rate']) && $list['view_rate']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


             <tr>
              <td><?php echo $this->language->get('entry_view_author'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_author]">
                  <?php if (isset($list['view_author']) && $list['view_author']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>




<!-- ************************ -->





			 <tr>
              <td><?php echo $this->language->get('entry_blog'); ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($categories as $blog) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (isset($list['blogs']) && in_array($blog['blog_id'], $list['blogs'])) { ?>
                    <input type="checkbox" name="mylist[<?php echo $list_num; ?>][blogs][]" value="<?php echo $blog['blog_id']; ?>" checked="checked" />
                    <?php echo $blog['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="mylist[<?php echo $list_num; ?>][blogs][]" value="<?php echo $blog['blog_id']; ?>" />
                    <?php echo $blog['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $this->language->get('text_select_all'); ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $this->language->get('text_unselect_all'); ?></a></td>
            </tr>


			 <tr>
              <td><?php echo $this->language->get('entry_categories'); ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($cat as $category) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (isset($list['categories']) && in_array($category['category_id'], $list['categories'])) { ?>
                    <input type="checkbox" name="mylist[<?php echo $list_num; ?>][categories][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                    <?php echo $category['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="mylist[<?php echo $list_num; ?>][categories][]" value="<?php echo $category['category_id']; ?>" />
                    <?php echo $category['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $this->language->get('text_select_all'); ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $this->language->get('text_unselect_all'); ?></a></td>
            </tr>


		    <tr>
		     <td class="left"><?php echo $this->language->get('entry_reserved'); ?></td>
		     <td class="left">
		      <input type="text" name="mylist[<?php echo $list_num; ?>][reserved]" value="<?php  if (isset($list['reserved'])) echo $list['reserved']; ?>" size="30" />
		     </td>
		    </tr>

</table>
</div>
  <?php }

//echo $this->request->post['list']."<br>";
  ?>
</div>