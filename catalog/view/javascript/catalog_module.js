$(document).ready(function () {
    var cordy = 0; // position curson
    var ul_oblect = 0;
    $.fn.categoryMenu = function () {
        var timeoutId;
        var mouseOut = false;
        //var cordy = 0;
        var tpl = function (parentObj, json) {
            if (parentObj.find('.box-category-child').length > 0) {
                return false;
            } else {
                var html = '';
                var main_items = json.length;
                var sum_items = 0;
                var total_items = 0;
                for (var k in json) {
                    if (json[k].children) {
                        sum_items += json[k].children.length;
                    }
                }
                total_items = sum_items + main_items;
                if (total_items > 15) {
                    var menuWindiowSize = 700;
                    var menu_li_width = 33;
                } else if (total_items > 10) {
                    var menuWindiowSize = 500;
                    var menu_li_width = 50;
                } else {
                    var menuWindiowSize = 250;
                    var menu_li_width = 100;
                }
                html += '<ul class="box-category-child" style="width: ' + menuWindiowSize + 'px !important; position: absolute !important; vertical-align: top;">';
                for (var k in json) {
                    if (json[k].children) {
                        if (json[k].children.length) {
                            var level3 = 'first-level-3';
                        } else {
                            var level3 = '';
                        }
                        html += '<li class="first-level-cats ' + level3 + '" style="width: ' + menu_li_width + '%; display: inline-block !important; vertical-align: top;"><span class="showSubMenuLev"></span><a href="' + json[k].href + '" ' + (json[k].active ? 'class="active"' : '') + '>' + json[k].name + '</a>';
                        html += '<ul class="box-category-child-second hide-level-3">';
                        for (var ck in json[k].children) {
                            html += '<li><a href="' + json[k].children[ck].href + '" ' + (json[k].children[ck].active ? 'class="active"' : '') + '>' + json[k].children[ck].name + '</a></li>';
                        }
                        html += '</ul>';
                        html += '</li>';
                    } else {
                        html += '<li class="first-level-cats"><a href="' + json[k].href + '" ' + (json[k].active ? 'class="active"' : '') + '>' + json[k].name + '</a></li>';
                    }
                }
                html += '</ul>';
                parentObj.append(html);
                return true;
            }
        };
        positionMenu = function (parentObj) {
            // menu
            var height_menu = parentObj.children('ul').height();
            var window_height = $(window).height();
            // defoult position menu
            if (height_menu > 30) {
                parentObj.children('ul').css('top', -1 * height_menu / 2);
            }
            if (height_menu > window_height) {
                parentObj.children('ul').css('top', '-150px');
            }
            ;
            if (window_height > height_menu) {
                //top menu
                if (cordy - height_menu / 2 < 0) {
                    var top_menu = (cordy - (height_menu / 2)) + (height_menu / 2) - 30;
                    parentObj.children('ul').css('top', -1 * top_menu);
                }
                // bottom menu
                if (cordy + height_menu / 2 > window_height) {
                    var bottom_menu = ((cordy + height_menu / 2) - window_height) + 25 + (height_menu / 2);
                    parentObj.children('ul').css('top', -1 * bottom_menu);
                }
            }
        };
        var getChildren = function (parentObj) {
            var categoryID = parentObj.attr('category-id');
            if (parentObj.find('.box-category-child').length > 0) {
                if (parentObj.children('ul').find('li').length > 0) {
                    parentObj.children('ul').show();
                    positionMenu(parentObj);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=module/category/get_children',
                    type: 'post',
                    data: {category_id: categoryID},
                    dataType: 'json',
                    success: function (json) {
                        tpl(parentObj, json);
                        $('ul.box-category > li > ul').hide();
                        if (parentObj.children('ul').find('li').length > 0) {
                            if (!mouseOut) {
                                parentObj.children('ul').show();
                                positionMenu(parentObj);
                            }
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
        };
        var hideChildren = function (parentObj) {
            $('ul.box-category > li > ul').hide();
            clearTimeout(timeoutId);
        }
        var setTimerSubMenu = function (parentObj) {
            timeoutId = setTimeout(function () {
                getChildren(parentObj);
            }, 200);
        }
        this.children('li')
            .hover(
            function (e) {
                var cordPage = e.pageY - $(window).scrollTop();
                cordy = cordPage - 5;
                ul_oblect = $(this);
                mouseOut = false;
                setTimerSubMenu($(this));
            },
            function () {
                mouseOut = true;
                hideChildren($(this));
            }
        );
    };
    $('.first-level-3').live('click', function () {
        setTimeout(function () {
            positionMenu(ul_oblect);
        }, 20);
    });
    $('#menu-container').categoryMenu();
});
