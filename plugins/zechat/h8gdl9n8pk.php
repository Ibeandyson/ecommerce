<?php
/**
 * Facebook Style Php Ajax Chat - Zechat
 * @author Bylancer
 * @version 1.5 - Pro
 * @Date: 18/Mar/2019
 * @url https://codecanyon.net/item/facebook-style-php-ajax-chat-zechat/16491266
 * @Copyright (c) 2015-18 Devendra Katariya (bylancer.com)
 */

require_once('../../includes/config.php');
require_once('../../includes/sql_builder/idiorm.php');
require_once('../../includes/db.php');
require_once('../../includes/functions/func.global.php');
require_once('../../includes/functions/func.users.php');
require_once('../../includes/lang/lang_'.$config['lang'].'.php');
sec_session_start();

$con = db_connect($config);

if(isset($_SESSION['user']['id'])){
    $sesUsername    = $_SESSION['user']['username'];
    $sesId          = $_SESSION['user']['id'];
}
else{
    exit();
}


if ($_GET['action'] == "lastseen") {lastseen($con, $config);}
if ($_GET['action'] == "get_all_msg") { get_all_msg($con,$config); }
if ($_GET['action'] == "chatheartbeat") { chatHeartbeat($con,$config); }
if ($_GET['action'] == "sendchat") { sendChat($con,$config); }
if ($_GET['action'] == "closechat") { closeChat(); }
if ($_GET['action'] == "startchatsession") { startChatSession(); }
if ($_GET['action'] == "typingstatus") { typingStatus(); }


function get_userdata($con,$config,$username){

    $query1 = "SELECT * FROM `".$config['db']['pre']."user` WHERE username='" .mysqli_real_escape_string($con,$username). "' LIMIT 1";
    $query_result = mysqli_query ($con, $query1);
    $info = mysqli_fetch_array($query_result);

    return $info;
}

function update_chat_lastactive($con,$config){

    $q = "UPDATE `".$config['db']['pre']."user` SET online='1', lastactive = '".$GLOBALS['timenow']."' WHERE id = '".$GLOBALS['sesId']."' ";
    mysqli_query($con, $q);
}

function getlastActiveTime($con,$config,$username){


     $res = mysqli_query($con, "SELECT * FROM `".$config['db']['pre']."user` WHERE username = '$username' AND TIMESTAMPDIFF(MINUTE, lastactive, NOW()) > 1");
     if($res === FALSE) {
         die(mysqli_error($con)); // TODO: better error handling
     }
     $num = mysqli_num_rows($res);
     if($num == "0")
         $onofst = "Online";
     else
         $onofst = "Offline";

    return $onofst;

}





if (!isset($_SESSION['chatHistory'])) {
    $_SESSION['chatHistory'] = array();
}

if (!isset($_SESSION['openChatBoxes'])) {
    $_SESSION['openChatBoxes'] = array();
}

if (!isset($_SESSION['chatpage'])) {
    $_SESSION['chatpage'] = 1;
}


function lastseen($con,$config) {
    echo $lastseen =  getlastActiveTime($con,$config,$_GET['uname']);
}

function get_all_msg($con,$config) {

    $perPage = 10;

    $sql = "select * from `".$config['db']['pre']."messages` where  ((to_uname = '".mysqli_real_escape_string($con, $GLOBALS['sesUsername'])."' AND from_uname = '".mysqli_real_escape_string($con,$_GET['client'])."' AND recd = '1') OR (to_uname = '".mysqli_real_escape_string($con,$_GET['client'])."' AND from_uname = '".mysqli_real_escape_string($con,$GLOBALS['sesUsername'])."')) order by message_id DESC ";

    $page = 1;
    if(!empty($_GET["page"])) {
        $_SESSION['chatpage'] = $page = $_GET["page"];
    }

    $start = ($page-1)*$perPage;
    if($start < 0) $start = 0;

    $query =  $sql . " limit " . $start . "," . $perPage;

    $query = $con->query($query);

    if(empty($_GET["rowcount"])) {
        $_GET["rowcount"] = $rowcount = mysqli_num_rows(mysqli_query($con, $sql));
    }

    $pages  = ceil($_GET["rowcount"]/$perPage);

    $items = '';
    if(!empty($query)) {

    }

    while ($chat = mysqli_fetch_array($query)) {

        $from_userdata = get_userdata($con,$config,$chat['from_uname']);
        $to_id = $from_userdata['id'];
        $picname = $from_userdata['image'];
        $status = $from_userdata['online'];

        $picname = ($picname == "")? "default_user.png" : $picname;
        $status  = ($status == "0")? "Offline" : "Online";

        $to_userdata = get_userdata($con,$config,$chat['to_uname']);
        $picname2 = $to_userdata['image'];

        $picname2 = ($picname2 == "")? "default_user.png" : $picname2;


        $chat['message_content'] = sanitize($chat['message_content']);

        if($chat['from_uname'] == $GLOBALS['sesUsername'])
        {
            $u = 1;
            $sespic = $picname;
        }
        else{
            $u = 2;
            $sespic = $picname2;
        }

        if (strpos($chat['message_content'], sanitize('file_name')) !== false) {

        }
        else{
            // The Regular Expression filter
            $reg_exUrl = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,10}(\/\S*)?/";

            // Check if there is a url in the text
            if (preg_match($reg_exUrl, $chat['message_content'], $url)) {

                // make the urls hyper links
                $chat['message_content'] = preg_replace($reg_exUrl, "<a href='{$url[0]}'>{$url[0]}</a>", $chat['message_content']);

            } else {
                // The Regular Expression filter
                $reg_exUrl = "/(www)\.[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,10}(\/\S*)?/";

                // Check if there is a url in the text
                if (preg_match($reg_exUrl, $chat['message_content'], $url)) {

                    // make the urls hyper links
                    $chat['message_content'] = preg_replace($reg_exUrl, "<a href='{$url[0]}'>{$url[0]}</a>", $chat['message_content']);

                }
            }
        }
        $msgtime = timeAgo($chat['message_date']);
        $items .= <<<EOD
					   {
			"s": "0",
			"sender": "{$chat['from_uname']}",
			"f": "{$_GET['client']}",
			"x": "{$chat['from_id']}",
			"p": "{$picname}",
			"p2": "{$picname2}",
			"st": "{$status}",
			"page": "{$_SESSION['chatpage']}",
			"pages": "{$pages}",
			"u": "{$u}",
			"mtype": "{$chat['message_type']}",
			"m": "{$chat['message_content']}",
			"time": "{$msgtime}"
	   },
EOD;

    }// End While Loop


    if ($items != '') {
        $items = substr($items, 0, -1);
    }

    header('Content-type: application/json');
    ?>
    {
    "items": [
    <?php echo $items;?>
    ]
    }

    <?php
    exit(0);
}

function chatHeartbeat($con,$config) {

    $sql = "select * from `".$config['db']['pre']."messages` where (to_uname = '".mysqli_real_escape_string($con,$GLOBALS['sesUsername'])."' AND recd = 0) order by message_id ASC";
    $query = $con->query($sql);
    $items = '';

    $chatBoxes = array();

    while ($chat = mysqli_fetch_array($query)) {


        $from_userdata = get_userdata($con,$config,$chat['from_uname']);
        $to_id = $from_userdata['id'];
        $picname = $from_userdata['image'];
        $status = $from_userdata['online'];

        $picname = ($picname == "")? "default_user.png" : $picname;
        $status  = ($status == "0")? "Offline" : "Online";

        $to_userdata = get_userdata($con,$config,$GLOBALS['sesUsername']);
        $picname2 = $to_userdata['image'];

        $picname2 = ($picname2 == "")? "default_user.png" : $picname2;


        if (!isset($_SESSION['openChatBoxes'][$chat['from_uname']]) && isset($_SESSION['chatHistory'][$chat['from_uname']])) {
            $items = $_SESSION['chatHistory'][$chat['from_uname']];
        }

        $chat['message_content'] = sanitize($chat['message_content']);

        if($chat['from_uname'] == $GLOBALS['sesUsername'])
        {
            $u = 1;
            $sespic = $picname;
        }
        else{
            $u = 2;
            $sespic = $picname2;
        }

        if (strpos($chat['message_content'], sanitize('file_name')) !== false) {

        }
        else{
            // The Regular Expression filter
            $reg_exUrl = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,10}(\/\S*)?/";

            // Check if there is a url in the text
            if (preg_match($reg_exUrl, $chat['message_content'], $url)) {

                // make the urls hyper links
                $chat['message_content'] = preg_replace($reg_exUrl, "<a href='{$url[0]}'>{$url[0]}</a>", $chat['message_content']);

            } else {
                // The Regular Expression filter
                $reg_exUrl = "/(www)\.[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,10}(\/\S*)?/";

                // Check if there is a url in the text
                if (preg_match($reg_exUrl, $chat['message_content'], $url)) {

                    // make the urls hyper links
                    $chat['message_content'] = preg_replace($reg_exUrl, "<a href='{$url[0]}'>{$url[0]}</a>", $chat['message_content']);

                }
            }
        }
        $msgtime = timeAgo($chat['message_date']);
        $items .= <<<EOD
					   {
			"s": "0",
			"f": "{$chat['from_uname']}",
			"x": "{$chat['from_id']}",
			"p": "{$picname}",
			"p2": "{$picname2}",
			"spic": "{$sespic}",
			"st": "{$status}",
			"u": "{$u}",
			"mtype": "{$chat['message_type']}",
			"m": "{$chat['message_content']}",
			"time": "{$msgtime}"
	   },
EOD;

        if (!isset($_SESSION['chatHistory'][$chat['from_uname']])) {
            $_SESSION['chatHistory'][$chat['from_uname']] = '';
        }

        $_SESSION['chatHistory'][$chat['from_uname']] .= <<<EOD
	{
			"s": "0",
			"f": "{$chat['from_uname']}",
			"x": "{$chat['from_id']}",
			"p": "{$picname}",
			"p2": "{$picname2}",
			"spic": "{$sespic}",
			"st": "{$status}",
			"u": "{$u}",
			"mtype": "{$chat['message_type']}",
			"m": "{$chat['message_content']}",
			"time": "{$msgtime}"
	   },
EOD;

        unset($_SESSION['tsChatBoxes'][$chat['from_uname']]);
        $_SESSION['openChatBoxes'][$chat['from_uname']] = $chat['message_date'];
    }

    if (!empty($_SESSION['openChatBoxes']))
    {
        foreach ($_SESSION['openChatBoxes'] as $chatbox => $time) {
            if (!isset($_SESSION['tsChatBoxes'][$chatbox]))
            {
                $now = time()-strtotime($time);
                $time = date('g:iA M dS', strtotime($time));

                $message = "$time";
                if ($now > 180)
                {
                    $items .= <<<EOD
{
"s": "2",
"f": "$chatbox",
"x": "{$chat['from_id']}",
"p": "{$picname}",
"p2": "{$picname2}",
"spic": "{$sespic}",
"st": "{$status}",
"m": "{$message}",
"time": "{$msgtime}"
},
EOD;

                    if (!isset($_SESSION['chatHistory'][$chatbox])) {
                        $_SESSION['chatHistory'][$chatbox] = '';
                    }

                    $_SESSION['chatHistory'][$chatbox] .= <<<EOD
		{
"s": "2",
"f": "$chatbox",
"x": "{$chat['from_id']}",
"p": "{$picname}",
"p2": "{$picname2}",
"spic": "{$sespic}",
"st": "{$status}",
"m": "{$message}"
},
EOD;
                    $_SESSION['tsChatBoxes'][$chatbox] = 1;
                }
            }
        }
    }

    $sql = "update `".$config['db']['pre']."messages` set recd = 1 where to_uname = '".mysqli_real_escape_string($con,$GLOBALS['sesUsername'])."' and recd = 0";
    $query = $con->query($sql);



    //update_chat_lastactive($con,$config);

    if ($items != '') {
        $items = substr($items, 0, -1);
    }
    header('Content-type: application/json');
    ?>
    {
    "items": [
    <?php echo $items;?>
    ]
    }

    <?php
    exit(0);
}

function sendChat($con,$config) {
    if(isset($GLOBALS['sesUsername'])){
        $from = $GLOBALS['sesUsername'];
        $from_id = $GLOBALS['sesId'];
        $message = $_POST['message'];
        $to = $_POST['to'];
        $messagesan = sanitize($message);

        $from_userdata = get_userdata($con,$config,$to);
        if(count($from_userdata) > 0){
            $to_id = $from_userdata['id'];
            $picname = $from_userdata['image'];
            $status = $from_userdata['online'];
            $picname = ($picname == "")? "default_user.png" : $picname;
            $status  = ($status == "0")? "Offline" : "Online";

            $to_userdata = get_userdata($con,$config,$GLOBALS['sesUsername']);
            $picname2 = $to_userdata['image'];

            $picname2 = ($picname2 == "")? "default_user.png" : $picname2;

            $_SESSION['chatHistory'][$_POST['to']] .= <<<EOD
					   {
			"s": "1",
			"f": "{$to}",
			"x": "{$to_id}",
			"p": "{$picname}",
			"p2": "{$picname2}",
			"st": "{$status}",
			"m": "{$messagesan}"
	   },
EOD;


            unset($_SESSION['tsChatBoxes'][$_POST['to']]);

            $sql = "insert into `".$config['db']['pre']."messages` (from_uname,to_uname,from_id,to_id,message_content,message_type,message_date) values ('".mysqli_real_escape_string($con,$from)."', '".mysqli_real_escape_string($con,$to)."','".mysqli_real_escape_string($con,$from_id)."','".mysqli_real_escape_string($con,$to_id)."','".mysqli_real_escape_string($con,$message)."','text','".$GLOBALS['timenow']."')";

            $query = $con->query($sql);


            $_SESSION['openChatBoxes'][$_POST['to']] = date('Y-m-d H:i:s', time());

            if (!isset($_SESSION['chatHistory'][$_POST['to']])) {
                $_SESSION['chatHistory'][$_POST['to']] = '';
            }

            echo "1";
        }
        else{
            echo "0";
        }
        exit(0);

    }
    else{
        echo "0";
    }
    exit(0);
}

function typingStatus() {
    $from = $GLOBALS['sesUsername'];
    $to = $_POST['to'];
    $to_id = $_POST['toid'];
    $from_id = $GLOBALS['sesId'];
    $typing = $_POST['typing'];


    if (!isset($_SESSION['chatHistory'][$_POST['to']])) {
        $_SESSION['chatHistory'][$_POST['to']] = '';
    }

    $_SESSION['chatHistory'][$_POST['to']] .= <<<EOD
					   {
			"ty": "{$typing}"
	   },
EOD;


    unset($_SESSION['tsChatBoxes'][$_POST['to']]);

    echo "1";
    exit(0);
}

function chatBoxSession($chatbox) {

    $items = '';

    if (isset($_SESSION['chatHistory'][$chatbox])) {
        $items = $_SESSION['chatHistory'][$chatbox];
    }

    return $items;
}

function startChatSession() {
    $items = '';
    if (!empty($_SESSION['openChatBoxes'])) {
        foreach ($_SESSION['openChatBoxes'] as $chatbox => $void) {
            $items .= chatBoxSession($chatbox);
        }
    }


    if ($items != '') {
        $items = substr($items, 0, -1);
    }

    header('Content-type: application/json');
    ?>
    {
    "username": "<?php echo $GLOBALS['sesUsername'];?>",
    "items": [
    <?php echo $items;?>
    ]
    }

    <?php


    exit(0);
}

function closeChat() {

    unset($_SESSION['openChatBoxes'][$_POST['chatbox']]);

    echo "1";
    exit(0);
}


?>