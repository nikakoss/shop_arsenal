<!DOCTYPE HTML>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>">
		<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>">
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>">
		<?php } ?>
		<?php if ($icon) { ?> 
		<link href="<?php echo $icon; ?>" rel="icon">
		<?php } ?>
		<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>">
		<?php } ?>
        <link href="catalog/view/theme/default/stylesheet/style.css" type="text/css" rel="stylesheet">
		<?php foreach ($styles as $style) { ?>
			<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
		<?php } ?>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
         
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.dotdotdot.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
		<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css">
		<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.masonry.min.js"></script>
                <script type="text/javascript" src="catalog/view/javascript/top_menu.js"></script>

                <script type="text/javascript" src="catalog/view/javascript/script.js"></script>
                <script type="text/javascript" src="catalog/view/javascript/is.mobile.js"></script>
                <script type="text/javascript" src="catalog/view/javascript/jquery.maskedinput.min.js"></script>
		<?php foreach ($scripts as $script) { ?>
			<script type="text/javascript" src="<?php echo $script; ?>"></script>
		<?php } ?>
		<!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<?php echo $google_analytics; ?>
	</head>
    <body>
        <div class="top_bg"></div>
        <div class="main">
            <header class="clearfix">
                <div class="center head_top" id="header_top">
                    <div class="right_block_head">
                        <div id="cart"><?php echo $cart; ?></div>
                        <a href='<?php echo $this->url->link('checkout/checkout');?>'>Оформить заказ</a>
                        <a class="orderAll" >Купить в 1 клик</a>
                    </div>
                    <div class="left_block_head">
                        <div>
                            <a href="<?php echo $wishlist.'&path='; ?>" class="tovari" id="wishlist-total"><?php echo $text_wishlist; ?></a>
                            <a href="specials" class="akcii">Текущие акции</a>
                        </div>
                        <div>
                            <a href="<?php echo $this->url->link('product/compare'); ?>" class="compare" id="compare-total"><?php echo $text_compare; ?></a>
                            <?php if (!$this->customer->isLogged()){ ?>   
                            <a class="kabinet loginAjax">Личный кабинет</a>
                            <input type="text" style="display:none;" class="loginzaInput" value="<a class='' href='http://loginza.ru/api/widget?token_url=http%3A%2F%2Fkuvalda.net%2Findex.php%3Froute%3Daccount%2Floginza2&amp;providers_set=google,yandex,mailru,mailruapi,vkontakte,facebook,odnoklassniki,livejournal,twitter,linkedin,loginza,myopenid,webmoney,rambler,flickr,lastfm,verisign,aol,steam,openid&amp;lang=ru'><img src='http://loginza.ru/img/sign_in_button_gray.gif' alt=''>">

                             <?php } else { ?>
                            <a href="<?php echo $this->url->link('account/account'); ?>" class="kabinet">Личный кабинет</a>                            
                            <?php }?>
                        </div>
                    </div>
                    <a class="button_head"></a>
                </div>
				<div class="push_top_block"></div>
                <div class="center head_bottom">
                    <a href="<?php echo $home; ?>" id="logo"></a>
                    <?php echo $header_contact;?>  
                    <div class="search">
                        <form id="search_form">
							<div id="search" class="input-border">
								<input type="text" class="input-block-level search-query" name="search" placeholder="Умный поиск по сайту" id="search_query" value="<?php echo $search; ?>">
							</div>
							<div id="autocomplete-results" class="autocomplete-results noborder"></div>
                            <input type="button" value="Найти" class="button-search">
							<span id="preloader_search"><img src="http://kuvalda.net/image/data/712.gif" /></span>
                        </form>

					   <div class="reg">
							<?php if (!$this->customer->isLogged()) : ?>                                                        
							<a class="loginAjax">Войти</a> или <a class="showRegistrationForm">зарегистрироваться</a>
                      		<?php else: ?>
							<a href="/index.php?route=account/logout">Выход</a> | <a href="/index.php?route=account/account">Личный кабинет</a>
							<div class="everyday"><span class="orange"><?php echo $customer_email;?></span></div>
                                                        <?php endif ?>
                        </div>
						
                    </div>
                </div>
            </header><!-- header -->
			<section class="clearfix">
			
			<?php if ($error) { ?>
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    
<?php } ?>
<?php  if( !$this->customer->isLogged() ) {
if( !empty($this->session->data['loginza2_confirmdata']) && 
	!empty( $loginza2_confirmdata_show ) )
{
	$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	$loginza2_confirm_block = str_replace("#divframe_height#", (300-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	$loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'], $loginza2_confirm_block);
	$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	echo $loginza2_confirm_block;
} } ?>
<div id="notification"></div>