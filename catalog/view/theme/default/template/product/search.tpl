<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="search-category"><?php echo $content_top; ?>

    <h3><?php echo $heading_title; ?></h3>
    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
    <div class="line_razd_2"></div>


    <div class="search_big clearfix">

        <form onsubmit="return false;">
            <div>
                <?php if ($search) { ?>
                <input type="text" class="ui-autocomplete-input" autocomplete="off" name="search" value="<?php echo $search; ?>" />
                <?php } else { ?>
                <input type="text" class="ui-autocomplete-input" autocomplete="off" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
                <?php } ?>
                <span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
            </div>
            <input type="submit" id="button-search" value="Найти">
        </form>



    </div>

    <div class="advancedRightBlock"><div id="column-right">
            <div class="box">
                <div class="box-content filterpro search-option">
                    <form id="filterpro">
                        <div class="open_block clearfix">
                            <div class="option_name" onclick="hideBlock('hideBlock')"><a href="javascript:void(0);" class="zaglavie active-zagl"><span>Критерии поиска:</span></a></div>
                            <div class="clear-open_block myPointer"><a onclick="clearCheck()">Очистить поле</a></div>
                            <div class="input-block clear" id="hideBlock" style="display: block;">

                                <div class="selects-category">

                                    <select name="category_id">
                                        <option value="0"><?php echo $text_category; ?></option>
                                        <?php foreach ($categories as $category_1) { ?>
                                        <?php if ($category_1['category_id'] == $category_id) { ?>
                                        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                        <?php } ?>
                                        <?php foreach ($category_1['children'] as $category_2) { ?>
                                        <?php if ($category_2['category_id'] == $category_id) { ?>
                                        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                        <?php } ?>
                                        <?php foreach ($category_2['children'] as $category_3) { ?>
                                        <?php if ($category_3['category_id'] == $category_id) { ?>
                                        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                        <?php } ?>
                                        <?php } ?>
                                    </select> 

                                </div>
                                <ul>
                                    <li>    
                                        <?php if ($sub_category) { ?>
                                        <input class="manufacturer_value filtered clearCheckInputValue" type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
                                        <?php } else { ?>
                                        <input class="manufacturer_value filtered clearCheckInputValue" type="checkbox" name="sub_category" value="1" id="sub_category" />
                                        <?php } ?>
                                        <?php echo $text_sub_category; ?>                       
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <?php if ($description) { ?>
                                        <input class="manufacturer_value filtered clearCheckInputValue" type="checkbox" name="description" value="1" id="description" checked="checked" />
                                        <?php } else { ?>
                                        <input class="manufacturer_value filtered clearCheckInputValue" type="checkbox" name="description" value="1" id="description" />
                                        <?php } ?>
                                        <?php echo $entry_description; ?>
                                    </li>
                                </ul>

                                <div>
                                    <a href="javascript:void(0);" id="button-search2" class="primenit">Применить</a>
                                </div>
                            </div>
                        </div>
                        <div class="line_razd_2"></div>



                        <script>
                            function hideBlock(blockId) {
                                $("#" + blockId).toggle();
                                $("#" + blockId).toggleClass("hided");
                            }
                            function clearCheck() {
                                $(".clearCheckInputValue").prop("checked", false);
                            }

                        </script>            

                    </form>
                </div>

            </div>

        </div>
    </div>

   
    <?php if ($products) { ?>

    <div class="sort_otobr product-filter clearfix">
   
       <div class="sort">Сортировка:
           <?php if ($sorts[3]['value']==$sort . '-' . $order) { ?>
           <a class="active asc" href="<?php echo $sorts[4]['href']; ?>"><?php echo $sorts[4]['text']; ?></a>
           <?php }elseif($sorts[4]['value']==$sort . '-' . $order){ ?>
           <a class="active desc" href="<?php echo $sorts[3]['href']; ?>"><?php echo $sorts[4]['text']; ?></a>
           <?php }else{ ?>
           <a  href="<?php echo $sorts[3]['href']; ?>"><?php echo $sorts[3]['text']; ?></a>
           <?php }?>
           
           <?php if ($sorts[5]['value']==$sort . '-' . $order) { ?>
           <a class="active asc" href="<?php echo $sorts[6]['href']; ?>"><?php echo $sorts[6]['text']; ?></a>
           <?php }elseif($sorts[6]['value']==$sort . '-' . $order){ ?>
           <a class="active desc" href="<?php echo $sorts[5]['href']; ?>"><?php echo $sorts[6]['text']; ?></a>
           <?php }else{ ?>
           <a  href="<?php echo $sorts[5]['href']; ?>"><?php echo $sorts[5]['text']; ?></a>
           <?php }?>
        </div>   

        <div class="otobr">Отображать по:
            <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
            <span>товаров</span>
        </div>
    </div>

    <div class="pagination"><?php echo $pagination; ?></div>

    <div class="product-list">
        
        <?php foreach ($products as $product) { ?>

        <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_list.tpl'); ?>

        <?php } ?>
    </div>

    <div class="pagination"><?php echo $pagination; ?></div>

    <?php } else{ ?>
    
    <div class="cart-empty">По вашему запросу ничего не найдено.</div>
    <?php }?>
    <?php if (!$categories && !$products) { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php }?>
    
    <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
        if (e.keyCode == 13) {
            $('#button-search, #button-search2').trigger('click');
        }
    });

    $('select[name=\'category_id\']').bind('change', function() {
        if (this.value == '0') {
            $('input[name=\'sub_category\']').attr('disabled', 'disabled');
            $('input[name=\'sub_category\']').removeAttr('checked');
        } else {
            $('input[name=\'sub_category\']').removeAttr('disabled');
        }
    });

    $('select[name=\'category_id\']').trigger('change');

    $('#button-search, #button-search2').bind('click', function() {
        url = 'index.php?route=product/search';

        var search = $('#content input[name=\'search\']').attr('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        var category_id = $('#content select[name=\'category_id\']').attr('value');

        if (category_id > 0) {
            url += '&category_id=' + encodeURIComponent(category_id);
        }

        var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');

        if (sub_category) {
            url += '&sub_category=true';
        }

        var filter_description = $('#content input[name=\'description\']:checked').attr('value');

        if (filter_description) {
            url += '&description=true';
        }

        location = url;
    });

//--></script> 
<?php echo $footer; ?>