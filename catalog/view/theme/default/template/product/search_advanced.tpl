<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div class="line_razd"></div>
    <h1><?php echo $heading_title; ?></h1>

    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>


    <?php if ($products) { ?>
    <div class="line_razd_2"></div>

    <div class="search_big clearfix">
        <form>
            <div><input type="text" name="search" placeholder="Умный поиск по сайту" id="query_comlete" value="<?php echo $search; ?>"></div>
            <input type="submit" value="Найти">
        </form>
    </div>
    <div id="results_result" class="autocomplete-results noborder"></div>            


    <script type="text/javascript">
        $(document).ready(function() {
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
        });
    </script>
    <div class="line_razd_2"></div>
    <div class="sort_otobr product-filter clearfix">


        <div class="sort">Сортировка:
            <?php if ($get_sorts['rating']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['rating']['desc']['href']; ?>">по рейтингу</a>
            <?php } elseif ($get_sorts['rating']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
            <?php } else { ?>
            <a href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
            <?php } ?>         


            <?php if ($get_sorts['price']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['price']['desc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
            <?php } elseif ($get_sorts['price']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['price']['asc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $sorts['price']['asc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
            <?php } ?>

            <?php if ($get_sorts['name']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['name']['desc']['href']; ?>">по популярности</a>
            <?php } elseif ($get_sorts['name']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
            <?php } else { ?>
            <a href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
            <?php } ?>

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

    <div class="pagination" ><?php echo $pagination; ?></div>

    <div class="product-list">
        <?php foreach ($products as $product) { ?>

        <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_list.tpl'); ?>

        <?php } ?>
    </div>

    <div class="pagination"><?php echo $pagination; ?></div>

    <?php } ?>
    <?php if (!$products) { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>