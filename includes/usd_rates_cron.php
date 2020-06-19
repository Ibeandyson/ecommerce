<?php
function download_usd_rate_file($url, $path)
{
    $newfname = $path;
    $file = fopen ($url, 'rb');
    if ($file) {
        $newf = fopen ($newfname, 'wb');
        if ($newf) {
            while(!feof($file)) {
                fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
            }
        }
    }
    if ($file) {
        fclose($file);
    }
    if ($newf) {
        fclose($newf);
    }
}

$ex_file_path = sprintf('%s%s',ROOTPATH,'/includes/usd_rates.json');
$ex_rate_url = 'https://openexchangerates.org/api/latest.json?app_id=897127139168437a8116560f6f11e083';

download_usd_rate_file($ex_rate_url, $ex_file_path);