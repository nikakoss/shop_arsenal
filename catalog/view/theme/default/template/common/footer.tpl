</section>
            <div class="footer-pusher"></div>
        </div>
        <footer class="clearfix">            
            <div class="top_footer clearfix" >
                <div class="menu_footer">
                    <h2>О магазине</h2>
                    <ul>
                        <? foreach ($informations[1] as $item){?>
                                <li><a href="<?php echo $item['href']; ?>"><?php echo $item['title']; ?></a></li>
                        <?php }?>
                    </ul>
                </div>
                <div class="menu_footer">
                    <h2>Доставка</h2>
                    <ul>
                        <? foreach ($informations[2] as $item){?>
                                <li><a href="<?php echo $item['href']; ?>"><?php echo $item['title']; ?></a></li>
                        <?php }?>
                    </ul>
                </div>
                <div class="menu_footer">
                    <h2>Важно</h2>
                    <ul>
                        <? foreach ($informations[3] as $item){?>
                                <li><a href="<?php echo $item['href']; ?>"><?php echo $item['title']; ?></a></li>
                        <?php }?>
                    </ul>
                </div>
                <div class="menu_footer">
                    <h2>Сервис</h2>
                    <ul>
                        <? foreach ($informations[4] as $item){?>
                                <li><a href="<?php echo $item['href']; ?>"><?php echo $item['title']; ?></a></li>
                        <?php }?>
                    </ul>
                </div>
                <div class="oplata">
                    <h2>Мы принимаем к оплате</h2>
                    <img src="catalog/view/theme/default/image/money.png" width="260" height="50" border="0" alt="" />
                    <h2>Мы в социальных сетях</h2>
                    <a>Присоединяйтесь к нам:</a>
                    <div class="social clear">
                        <img src="catalog/view/theme/default/image/youtube_social.png" alt="Youtube"/>
                        <img src="catalog/view/theme/default/image/tweet_social.png" alt="Twitter"/>
                        <img src="catalog/view/theme/default/image/facebook_social.png" alt="Facebook"/>
                        <img src="catalog/view/theme/default/image/vk_social.png" alt="Вконтакте"/>
                        <img src="catalog/view/theme/default/image/odnoklassniki_social.png" alt="Однокласники"/>
                    </div>
                </div>
            </div><!-- .top_footer -->
            <div class="footer_bottom clear clearfix">
                <?php echo $footer_menu;?>                
            </div>
        </footer>

    </body>
</html>