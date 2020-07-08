<?php
$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/about_us.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header('About Us'));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>