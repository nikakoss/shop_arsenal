<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
  <link href="<?php echo $icon; ?>" rel="icon">
  <?php } ?>
        <!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <link rel="stylesheet" href="/catalog/view/theme/default/fonts/font.css" />
        <link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/global.css" />  
        <link rel="stylesheet" type="text/css" href="/catalog/view/theme/default/stylesheet/404.css">   
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script src="/catalog/view/theme/default/js/jquery.js"></script>
         <script src="/catalog/view/theme/default/js/jquery.cookie.js"></script>
</head>
<body>
<!-- WRAPPER -->
<div id="wrapper">
        <!-- HEADER -->
        <header>
                <div class="wrap">
                        <!-- logo -->
                        <a href="<?php echo $base; ?>" class="logo" title="Арсенал"></a>
                        <?php echo $column_header;?>

                        <div class="clr"></div>
                </div>
                <!-- menu -->
                <div class="ul_wrap">
                        <div class="wrap">
                                <ul>
                                        <li><a href="<?php echo $base; ?>">Главная</a></li>
                                        <!--li><a class="none-pointer" href="javascript:viod(0);">Наши услуги и цены</a-->
                                        <li><a class="none-pointer" href="/uslugi">Наши услуги и цены</a>
                                                <ul class="sub_menu">
                                                        <li><a href="http://sb-arsenal.ru/uslugi/sistemy-videonablyudeniya">Cистемы видеонаблюдения</a></li>
                                                        <li><a href="http://sb-arsenal.ru/uslugi/sistemy-okhrany-imushchestva">Системы охраны имущества</a></li>
                                                        <li><a href="http://sb-arsenal.ru/uslugi/sistemy-pozharnoy-bezopasnosti">Системы пожарной безопасности</a></li>
                                                        <li><a href="http://sb-arsenal.ru/uslugi/sistemy-kontrolya-dostupa">Cистемы контроля доступа</a></li>
                                                        <li><a href="sb-arsenal.ru/uslugi/oblachnoe-videonabljudenie/">Облачное видеонаблюдение</a></li>
                                                        <li><a href="sb-arsenal.ru/elektromontazhnye-raboty">Электромонтажные работы</a></li>
                                                        <li><a href="sb-arsenal.ru/prices">Прайс-листы</a></li>
                                                </ul>                                        
                                        </li>
                                        
                                        <li><a href="<?php echo $base; ?>news">Новости</a></li>
                                        <li><a href="<?php echo $base; ?>blog">Блог</a></li>
                                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  8);?>">FAQ</a></li>
                                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  10);?>">Вакансии</a></li>
                                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  7);?>">Контакты</a></li>
                                </ul>
                                <div class="clr"></div>
                        </div>
                </div>
        </header>
        <!--END HEADER -->