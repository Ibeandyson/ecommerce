<?php
$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/privacy_policy.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header('Privacy Policy'));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>