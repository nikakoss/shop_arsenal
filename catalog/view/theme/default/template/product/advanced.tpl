<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"><?php echo $content_top; ?>    
    <div class="line_razd"></div>
    <h1><?php echo $heading_title; ?></h1>

    <ul class="bread_crumbs clearfix">
        <li>
            <a href="/index.php?route=common/home">Главная</a>
        </li>
        <li>
            <a href="index.php?route=product/advanced&path=#page=0">Подбор товара</a>
        </li>
    </ul>
    <div class="line_razd_2"></div>

    <div class="search_big clearfix"> 
        <form>
            <div><input type="text" name="search" placeholder="Умный поиск по сайту" id="query_comlete" ></div>
            <input type="button" value="Найти" id="button-search_adv" >
        </form>
    </div>
    <div id="results_result" class="autocomplete-results noborder"></div>            


    <script type="text/javascript">
        $(document).ready(function() {
            $('.sortValues').live('change', function() {
                iF();
            });
            $('.limit').live('change', function() {
                iF();
            });
            $('#query_comlete').autocomplete({
                delay: 0,
                appendTo: "#results_result",
                source: function(request, response) {
                    $.ajax({
                        url: 'index.php?route=search/autocomplete&filter_name=' + encodeURIComponent(request.term),
                        dataType: 'json',
                        success: function(json) {
                            response($.map(json, function(item) {
                                return {
                                    label: item.name,
                                    value: item.product_id,
                                    href: item.href,
                                    thumb: item.thumb,
                                    desc: item.desc,
                                    price: item.price
                                }
                            }));
                        }
                    });
                },
                select: function(event, ui) {
                    document.location.href = ui.item.href;

                    return false;
                },
                focus: function(event, ui) {
                    return false;
                },
                minLength: 2
            })
                    .data("autocomplete")._renderItem = function(ul, item) {
                return $("<li>")
                        .append("<a><img src='" + item.thumb + "' alt=''>" + item.label + "<br><span class='price'>" + item.price + "</span></a>")
                        .appendTo(ul);
            };
            $('#button-search_adv').bind('click', function() {
            url = 'index.php?route=product/search';

            var search = $('#content input[name=\'search\']').attr('value');

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }
            location = url;

        });
        });
    </script>
    <div class="line_razd_2"></div>
    <div class="advancedRightBlock"><?php echo $column_right; ?></div>
    <div class="product-filter sort_otobr clearfix">
        <div class="limit otobr">Отображать по:
            <select>
                <?php foreach($limits as $limits) { ?>
                <?php if($limits['value'] == $limit) { ?>
                <option  value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option  value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
            <span>товаров</span>
        </div>
        <div class="sort" style="display: none">
            <select class="sortValues">
                <?php foreach($sorts as $sorts) { ?>
                <?php if($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option  value="<?php echo $sorts['asc']['href']; ?>"><?php echo $sorts['asc']['text']; ?></option>

                <option value="<?php echo $sorts['desc']['href']; ?>"><?php echo $sorts['desc']['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
        <div class="sort">Сортировка:
            <a onclick="sortable('#sortLinkRating', 'pd.rating&ASC', 'pd.rating&DESC');" class="myNewPointer" id="sortLinkRating">по рейтингу</a>
            <a onclick="sortable('#sortLinkPrice', 'p.price&ASC', 'p.price&DESC');" class="myNewPointer" id="sortLinkPrice">по цене</a>
            <a onclick="sortable('#sortLinkPopular', 'pd.name&ASC', 'pd.name&DESC');" class="myNewPointer" id="sortLinkPopular">по популярности</a>
        </div>
        <script>
            function sortable(linkId, value1, value2) {
                if ($('.sortValues').val() == value1) {
                    $(".sortValues option").removeAttr("selected");
                    $(".sortValues [value='" + value2 + "']").attr("selected", "selected");
                    $('.sortValues').trigger('change');

                }
                else {
                    $(".sortValues option").removeAttr("selected");
                    $(".sortValues [value='" + value1 + "']").attr("selected", "selected");
                    $('.sortValues').trigger('change');

                }
                if ($('.sortValues').val() == value1) {
                    $('.sort a').removeClass("active asc");
                    $('.sort a').removeClass("active desc");
                    $(linkId).removeClass("active desc");
                    $(linkId).addClass("active asc");
                }
                else if ($('.sortValues').val() == value2) {
                    $('.sort a').removeClass("active asc");
                    $('.sort a').removeClass("active desc");
                    $(linkId).removeClass("active asc");
                    $(linkId).addClass("active desc");
                }
                else {
                    $('.sort a').removeClass("active asc");
                    $('.sort a').removeClass("active desc");
                    $(linkId).removeClass("active asc");
                    $(linkId).removeClass("active desc");
                }
            }
        </script>       
    </div>
    <div class="line_razd_2"></div>
    <a onclick="iF();" class="primenit">Применить</a>
    <a href="javascript:void(0);" class="clear_filter sbros">Сбросить</a>
    <!------------------------------blocks------------------------------------->
    <div class="pagination">

    </div>
    
    <div class="product-list">
    
    </div>
    
    <div class="pagination">

    </div>
    <!------------------------------------------------------------------------->
    <?php echo $content_bottom; ?>
    <script type="text/javascript">/*<!--
    function display(view) {
        if (view == 'list') {
        $('.product-grid').attr('class', 'product-list');
                $('.product-list > div').each(function(index, element) {
        html = '<div class="right">';
                html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
                html += '</div>';
                html += '<div class="left">';
                var image = $(element).find('.image').html();
                if (image != null) {
        html += '<div class="image">' + image + '</div>';
        }

        var price = $(element).find('.price').html();
                if (price != null) {
        html += '<div class="price">' + price + '</div>';
        }

        html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
                html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
                

        html += '</div>';
                $(element).html(html);
        });
        }
        -->*/</script>
    <?php echo $footer; ?>