<?php
$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/legal.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header('Legal'));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>