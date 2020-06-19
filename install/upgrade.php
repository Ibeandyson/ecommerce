<?php
ignore_user_abort(1);

if ($config['version'] <= "8.3") {

    echo "DROP TABLE push_notification Table...  \t\t";
    $q = "DROP TABLE IF EXISTS `".$config['db']['pre']."push_notification`";
    @mysqli_query($mysqli, $q) OR error(mysqli_error($mysqli));
    echo "DROP TABLE push_notification success<br>";

    echo "CREATE TABLE push_notification Table...  \t\t";
    $q = "CREATE TABLE `".$config['db']['pre']."push_notification` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `recd` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci";
    @mysqli_query($mysqli, $q) OR error(mysqli_error($mysqli));
    echo "CREATE TABLE push_notification success<br>";

   /*-----------------------------------------------------*/

    echo "DROP TABLE firebase_device_token Table...  \t\t";
    $q = "DROP TABLE IF EXISTS `".$config['db']['pre']."firebase_device_token`";
    @mysqli_query($mysqli, $q) OR error(mysqli_error($mysqli));
    echo "DROP TABLE firebase_device_token success<br>";

    echo "CREATE TABLE firebase_device_token Table...  \t\t";
    $q = "CREATE TABLE `".$config['db']['pre']."firebase_device_token` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `device_id` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `token` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci";
    @mysqli_query($mysqli, $q) OR error(mysqli_error($mysqli));
    echo "CREATE TABLE firebase_device_token success<br>";
}
?>