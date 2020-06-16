<?php
require_once("includes/lib/curl/curl.php");
require_once("includes/lib/curl/CurlResponse.php");

if(!checkloggedin())
{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}

if(isset($_GET['i']) && trim($_GET['i']) == '')
{
    error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}

if(isset($_GET['i']) && isset($_GET['access_token']))
{
    $access_token = $_GET['access_token'];
    if(isset($_SESSION['quickad'][$access_token])){
        $payment_settings = ORM::for_table($config['db']['pre'].'payments')
            ->select('payment_folder')
            ->where('payment_folder', $_GET['i'])
            ->find_one();

        if(!isset($payment_settings['payment_folder']))
        {
            error($lang['NOT_FOUND_PAYMENT'], __LINE__, __FILE__, 1);
            exit();
        }
        require_once('includes/payments/'.$payment_settings['payment_folder'].'/ipn.php');
    }
}
?>
