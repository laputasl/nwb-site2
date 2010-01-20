<?php
/**
 * @package WordPress
 * @subpackage Default_Theme
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<?php if ( is_singular() ) wp_enqueue_script( 'comment-reply' ); ?>

<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
	<div id="container">
		<div id="header">        
			<h1><a href="http://www.petwellbeing.com" title="PetWellbeing.com">PetWellbeing.com - 1.877.633.2401</a></h1>
			<ul id="miscNav">
				<li class="first"><a href="https://www.petwellbeing.com/store/login.cfm?page=account_info" title="Login">Login</a></li>
				<li><a href="http://videos.petwellbeing.com/" title="Videos">Videos</a></li>
				<li><a href="http://www.petwellbeing.com" title="Store">Store</a></li>
				<li><a href="http://www.petwellbeing.com/static/site-map.cfm" title="Site Map">Site Map</a></li>
				<li><a href="http://pethealth.petwellbeing.com/wiki/Main_Page" title="Wiki">Wiki</a></li>
				<li><a href="http://www.petwellbeing.com/articles/" title="Blog">Blog</a></li>
				<li><a href="http://www.petwellbeing.com/static/contactus.cfm" title="Contact">Contact</a></li>
				<li><a href="http://www.petwellbeing.com/static/aboutus.cfm" title="About">About</a></li>
			</ul>
			<form id="searchForm" action="#" method="post">
				<fieldset>
					<legend>Search</legend>
					<input id="search" name="search" type="text" />
					<input id="btnSearch" type="submit" value="Search" />
				</fieldset>
			</form>
			<ul id="nav">
				<li><a id="navHome" href="http://www.petwellbeing.com" title="Home">Home</a></li>
				<li><a id="navShipping" href="http://www.petwellbeing.com/static/shipping_pop.cfm" title="Free Same Day Shipping">Free Same Day Shipping</a></li>
				<li><a id="navSecure" href="http://www.petwellbeing.com/static/security_pop.cfm" title="Secure Shopping">Secure Shopping</a></li>
				<li><a id="navGuarantee" href="http://www.petwellbeing.com/static/guarantee_pop.cfm" title="30-Day Money Back Guarantee">30-Day Money Back Guarantee</a></li>
				<li><a id="navCart" href="http://www.petwellbeing.com/store/shopping_basket.cfm" title="My Shopping Cart">My Shopping Cart</a></li>
				<li><a id="navAccount" href="https://www.petwellbeing.com/store/account_info.cfm" title="My Account">My Account</a></li>
			</ul>			
		</div>
		<hr />
		<div id="main">