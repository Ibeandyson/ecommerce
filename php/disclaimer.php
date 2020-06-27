<?php
$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/disclaimer.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header('Disclaimer'));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>