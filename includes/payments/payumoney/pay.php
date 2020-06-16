<?php
header("Pragma: no-cache");
header("Cache-Control: no-cache");
header("Expires: 0");

if(!checkloggedin()){
    header("Location: ".$link['LOGIN']);
    exit();
}

if (isset($_SESSION['quickad'][$access_token]['payment_type'])) {
    $currency = $config['currency_code'];
    $title = $_SESSION['quickad'][$access_token]['name'];
    $amount = $_SESSION['quickad'][$access_token]['amount'];

    $_SESSION['quickad'][$access_token]['merchantOrderId'] = $access_token;

    $payumoney_merchant_key = get_option('payumoney_merchant_key');
    $payumoney_merchant_salt = get_option('payumoney_merchant_salt');
    $txnid = "Txn" . rand(10000,99999999);
    $username = $_SESSION['user']['username'];
    $userdata = get_user_data($username);
    $user_email = $userdata['email'];
    $user_phone = $userdata['phone'];
    $return_url = $link['IPN']."/?access_token=".$access_token."&i=payumoney";

    $hash=hash('sha512', $payumoney_merchant_key.'|'.$txnid.'|'.$amount.'|'.$title.'|'.$username.'|'.$user_email.'|||||'."BOLT_KIT_PHP7".'||||||'.$payumoney_merchant_salt);
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>PayUmoney BOLT PHP7 Kit</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <!-- this meta viewport is required for BOLT //-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" >
    <?php
    $payumoney_sandbox_mode = get_option('payumoney_sandbox_mode');

    if($payumoney_sandbox_mode == "live"){
        ?>
        <!-- BOLT Production/Live //-->
        <script id="bolt" src="https://checkout-static.citruspay.com/bolt/run/bolt.min.js"></script>
    <?php
    }else{
    ?>
        <!-- BOLT Sandbox/test //-->
        <script id="bolt" src="https://sboxcheckout-static.citruspay.com/bolt/run/bolt.min.js"></script>
        <?php
    }
    ?>
    <style type="text/css">
        .style1 {  font-size: 14px;  font-family: Verdana, Arial, Helvetica, sans-serif;  }
    </style>
</head>
<body>
<div align="center" class="style1">Transfering you to the Payumoney Secure payment system</div>
<div style="display: none">
    <form action="#" id="payment_form">
        <input type="hidden" id="udf5" name="udf5" value="BOLT_KIT_PHP7" />
        <input type="hidden" id="surl" name="surl" value="<?php echo $return_url; ?>" />
        <input type="text" id="txnid" name="txnid" placeholder="Transaction ID" value="<?php echo  $txnid; ?>" />
        <input type="text" id="key" name="key" placeholder="Merchant Key" value="<?php echo $payumoney_merchant_key; ?>" />
        <input type="text" id="salt" name="salt" placeholder="Merchant Salt" value="<?php echo $payumoney_merchant_salt; ?>" />
        <input type="text" id="amount" name="amount" placeholder="Amount" value="<?php echo $amount; ?>" />
        <input type="text" id="pinfo" name="pinfo" placeholder="Product Info" value="<?php echo $title; ?>" />
        <input type="text" id="fname" name="fname" placeholder="First Name" value="<?php echo $username; ?>" />
        <input type="text" id="email" name="email" placeholder="Email ID" value="<?php echo $user_email; ?>" />
        <input type="text" id="mobile" name="mobile" placeholder="Mobile/Cell Number" value="<?php echo $user_phone; ?>" />
        <input type="text" id="hash" name="hash" placeholder="Hash" value="<?php echo $hash; ?>" />
        <input type="submit" value="Pay" onclick="launchBOLT(); return false;" />
    </form>
</div>

<script type="text/javascript">
    launchBOLT();
    function launchBOLT()
    {
        bolt.launch({
            key: $('#key').val(),
            txnid: $('#txnid').val(),
            hash: $('#hash').val(),
            amount: $('#amount').val(),
            firstname: $('#fname').val(),
            email: $('#email').val(),
            phone: $('#mobile').val(),
            productinfo: $('#pinfo').val(),
            udf5: $('#udf5').val(),
            surl : $('#surl').val(),
            furl: $('#surl').val(),
            mode: 'dropout'
        },{ responseHandler: function(BOLT){
                console.log( BOLT.response.txnStatus );
                if(BOLT.response.txnStatus != 'CANCEL')
                {
                    //Salt is passd here for demo purpose only. For practical use keep salt at server side only.
                    var fr = '<form action=\"'+$('#surl').val()+'\" method=\"post\">' +
                        '<input type=\"hidden\" name=\"key\" value=\"'+BOLT.response.key+'\" />' +
                        '<input type=\"hidden\" name=\"txnid\" value=\"'+BOLT.response.txnid+'\" />' +
                        '<input type=\"hidden\" name=\"amount\" value=\"'+BOLT.response.amount+'\" />' +
                        '<input type=\"hidden\" name=\"productinfo\" value=\"'+BOLT.response.productinfo+'\" />' +
                        '<input type=\"hidden\" name=\"firstname\" value=\"'+BOLT.response.firstname+'\" />' +
                        '<input type=\"hidden\" name=\"email\" value=\"'+BOLT.response.email+'\" />' +
                        '<input type=\"hidden\" name=\"udf5\" value=\"'+BOLT.response.udf5+'\" />' +
                        '<input type=\"hidden\" name=\"mihpayid\" value=\"'+BOLT.response.mihpayid+'\" />' +
                        '<input type=\"hidden\" name=\"status\" value=\"'+BOLT.response.status+'\" />' +
                        '<input type=\"hidden\" name=\"hash\" value=\"'+BOLT.response.hash+'\" />' +
                        '</form>';
                    var form = jQuery(fr);
                    jQuery('body').append(form);
                    form.submit();
                }
            },
            catchException: function(BOLT){
                alert( BOLT.message );
            }
        });
    }
</script>

</body>
</html>

