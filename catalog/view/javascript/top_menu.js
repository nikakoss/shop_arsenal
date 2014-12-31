$(document).ready(function() {
    if ($('#top_menu_block').html() == '') {
        $.ajax({
            type: 'post',
            url: 'index.php?route=module/category/top_menu',
            success: function(data) {
                $('#top_menu_block').append(data);
                $('#menu-container').categoryMenu();
                $('#menu-container').hide();
            }
        });
    }
    $("li.kat_act").hover(
            function() {
                $('#menu-container').show();
            }, function() {
        $('#menu-container').hide();
    }
    );
    $('.showSubMenuLev').live('click', function() {
        // alert(1)
        $(this).addClass('open_menu');
        $(this).next('a').next('.hide-level-3').show();
    });
    $('.showSubMenuLev.open_menu').live('click', function() {
        //alert(2)
        $(this).removeClass('open_menu');
        $(this).next('a').next('.hide-level-3').hide();
    });
    // product related
    $('.related-items a.related-date').click(function(e) {
        e.preventDefault();
        $('.related-items-list').hide();
        $('.related-item-' + $(this).data('category_id')).show();
    });
    // product category more
    $(window).load(function() {
        if(parseInt($('.list-categories ul').height()) < 98) {
        $('.list-categories-more a').hide();
        } else {
        $('.list-categories-more a').show();
        }
    });
    $('.list-categories-more a').click(function() {
        if ($(".list-categories-more").hasClass("more-hide")) {
            $(".list-categories").animate({height: $(".list-categories ul").height()});
            //$(".list-categories").css({'height':$(".list-categories ul").height()});           
            $(".list-categories-more").removeClass("more-hide").addClass("more-show");
            $(".list-categories-more a").html("Скрыть");
        } else {
            $(".list-categories-more a").html("Показать все");
            $(".list-categories").animate({height: 58});
            //$(".list-categories").css({'height':'58px'});
            $(".list-categories-more").addClass("more-hide").removeClass("more-show");
        }
    });
    (function($) {
        var cordy = 0; // position curson
        var ul_oblect=0;
        $.fn.categoryMenu = function() {
            var timeoutId;
            var mouseOut = false;
            var cordy = 0;
            var tpl = function(parentObj, json) {
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
                    if (total_items > 25) {
                        var menuWindiowSize = 700;
                        var menu_li_width = 33;
                    } else if (total_items > 15) {
                        var menuWindiowSize = 600;
                        var menu_li_width = 40;
                    } else {
                        var menuWindiowSize = 250;
                        var menu_li_width = 100;
                    }
                   // console.log('menuWindiowSize-',menuWindiowSize,' menu_li_width-',menu_li_width);
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
            positionMenu = function(parentObj){
             // menu
                                    var height_menu = parentObj.children('ul').height();
                                    var window_height=$(window).height();
                                console.log(parentObj);
                                    // defoult position menu
                                    if(height_menu>30){
                                     parentObj.children('ul').css('top',-1*height_menu/2);
                                 } 
                                 if (height_menu > window_height) {
                                    parentObj.children('ul').css('top','-150px');
                                 };
                                    if(window_height>height_menu){ 
                                    //top menu
                                    if(cordy-height_menu/2<90){                                    
                                        var top_menu=(cordy-(height_menu/2))+(height_menu/2)-30;                                        
                                      // console.log(top_menu);
                                        parentObj.children('ul').css('top',-1*(top_menu-45));                                   
                                    }
                                    // bottom menu
                                    if(cordy+height_menu/2>window_height){
                                     //     console.log("bottom");
                                        var bottom_menu=((cordy+height_menu/2)-window_height)+25+(height_menu/2);                                     
                                       parentObj.children('ul').css('top',-1*bottom_menu);
                                    }                                                                       
                                    }
            };
            var getChildren = function(parentObj) {
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
                        success: function(json) {
                            tpl(parentObj, json);
                            $('ul.box-category > li > ul').hide();
                            if (parentObj.children('ul').find('li').length > 0) {
                                if (!mouseOut) {
                                    parentObj.children('ul').show();                                   
                                    positionMenu(parentObj);                                   
                                }
                            }
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                }
            };
            var hideChildren = function(parentObj) {
                $('ul.box-category > li > ul').hide();
                clearTimeout(timeoutId);
            }
            var setTimerSubMenu = function(parentObj) {
                timeoutId = setTimeout(function() {
                    getChildren(parentObj);
                }, 200);
            }
            this.children('li')
                    .hover(
                            function(e) {
                                var cordPage = e.pageY - $(window).scrollTop();
                                cordy=cordPage-5;
                                ul_oblect=$(this);
                                mouseOut = false;
                                setTimerSubMenu($(this));
                            },
                            function() {
                                mouseOut = true;
                                hideChildren($(this));
                            }
                    );
        };
        $('.first-level-3').live('click', function() {
            setTimeout(function() {
                positionMenu(ul_oblect);
            }, 20);
    });
    })(jQuery);
});