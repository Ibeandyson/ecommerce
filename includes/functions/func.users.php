<?php
$config['lang'] = check_user_lang();
$config['lang_code'] = get_current_lang_code();
$config['tpl_name'] = check_user_theme();

function get_random_id(){

    $random = '';

    for ($i = 1; $i <= 8; $i++)
    {
        $random.= mt_rand(0, 9);
    }

    return $random;
}



function change_user_country($country_code){

    global $config;

    if(get_option("country_type") == "multi"){
        $countryName = get_countryName_by_sortname($country_code);
        if(!$countryName) return;
        $_SESSION['user']['country'] = $country_code;
        set_user_currency($country_code);
    }
}
// Function to get the client IP address
function get_client_ip() {

    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
        $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    // return $ipaddress;
    return '129.205.112.204';
}


function get_client_country_by_ip(){
    try{
        $ip = get_client_ip();  
        require_once  ROOTPATH . '/includes/database/geoip/autoload.php';
        // Country DB
        $reader = new \MaxMind\Db\Reader(ROOTPATH .'/includes/database/geoip/geo_country.mmdb');
        $data = $reader->get($ip);
        $country_code = @strtoupper(trim($data['country']['iso_code'])); 
        return $country_code;
    }catch(\Exception $e){
        return 'NG';
    }
}

function get_currency_code($country_code = 'us'){
    $curreny_country_code =array(
        'AD'=> array('iso3' => 'AND','currency_code' => 'EUR'),
        'AE'=> array('iso3' => 'ARE','currency_code' => 'AED'),
        'AF'=> array('iso3' => 'AFG','currency_code' => 'AFN'),
        'AG'=> array('iso3' => 'ATG','currency_code' => 'XCD'),
        'AI'=> array('iso3' => 'AIA','currency_code' => 'XCD'),
        'AL'=> array('iso3' => 'ALB','currency_code' => 'ALL'),
        'AM'=> array('iso3' => 'ARM','currency_code' => 'AMD'),
        'AN'=> array('iso3' => 'ANT','currency_code' => 'ANG'),
        'AO'=> array('iso3' => 'AGO','currency_code' => 'AOA'),
        'AQ'=> array('iso3' => 'ATA','currency_code' => ''),
        'AR'=> array('iso3' => 'ARG','currency_code' => 'ARS'),
        'AS'=> array('iso3' => 'ASM','currency_code' => 'USD'),
        'AT'=> array('iso3' => 'AUT','currency_code' => 'EUR'),
        'AU'=> array('iso3' => 'AUS','currency_code' => 'AUD'),
        'AW'=> array('iso3' => 'ABW','currency_code' => 'AWG'),
        'AX'=> array('iso3' => 'ALA','currency_code' => 'EUR'),
        'AZ'=> array('iso3' => 'AZE','currency_code' => 'AZN'),
        'BA'=> array('iso3' => 'BIH','currency_code' => 'BAM'),
        'BB'=> array('iso3' => 'BRB','currency_code' => 'BBD'),
        'BD'=> array('iso3' => 'BGD','currency_code' => 'BDT'),
        'BE'=> array('iso3' => 'BEL','currency_code' => 'EUR'),
        'BF'=> array('iso3' => 'BFA','currency_code' => 'XOF'),
        'BG'=> array('iso3' => 'BGR','currency_code' => 'BGN'),
        'BH'=> array('iso3' => 'BHR','currency_code' => 'BHD'),
        'BI'=> array('iso3' => 'BDI','currency_code' => 'BIF'),
        'BJ'=> array('iso3' => 'BEN','currency_code' => 'XOF'),
        'BL'=> array('iso3' => 'BLM','currency_code' => 'EUR'),
        'BM'=> array('iso3' => 'BMU','currency_code' => 'BMD'),
        'BN'=> array('iso3' => 'BRN','currency_code' => 'BND'),
        'BO'=> array('iso3' => 'BOL','currency_code' => 'BOB'),
        'BQ'=> array('iso3' => 'BES','currency_code' => 'USD'),
        'BR'=> array('iso3' => 'BRA','currency_code' => 'BRL'),
        'BS'=> array('iso3' => 'BHS','currency_code' => 'BSD'),
        'BT'=> array('iso3' => 'BTN','currency_code' => 'BTN'),
        'BV'=> array('iso3' => 'BVT','currency_code' => 'NOK'),
        'BW'=> array('iso3' => 'BWA','currency_code' => 'BWP'),
        'BY'=> array('iso3' => 'BLR','currency_code' => 'BYR'),
        'BZ'=> array('iso3' => 'BLZ','currency_code' => 'BZD'),
        'CA'=> array('iso3' => 'CAN','currency_code' => 'CAD'),
        'CC'=> array('iso3' => 'CCK','currency_code' => 'AUD'),
        'CD'=> array('iso3' => 'COD','currency_code' => 'CDF'),
        'CF'=> array('iso3' => 'CAF','currency_code' => 'XAF'),
        'CG'=> array('iso3' => 'COG','currency_code' => 'XAF'),
        'CH'=> array('iso3' => 'CHE','currency_code' => 'CHF'),
        'CI'=> array('iso3' => 'CIV','currency_code' => 'XOF'),
        'CK'=> array('iso3' => 'COK','currency_code' => 'NZD'),
        'CL'=> array('iso3' => 'CHL','currency_code' => 'CLP'),
        'CM'=> array('iso3' => 'CMR','currency_code' => 'XAF'),
        'CN'=> array('iso3' => 'CHN','currency_code' => 'CNY'),
        'CO'=> array('iso3' => 'COL','currency_code' => 'COP'),
        'CR'=> array('iso3' => 'CRI','currency_code' => 'CRC'),
        'CS'=> array('iso3' => 'SCG','currency_code' => 'RSD'),
        'CU'=> array('iso3' => 'CUB','currency_code' => 'CUP'),
        'CV'=> array('iso3' => 'CPV','currency_code' => 'CVE'),
        'CW'=> array('iso3' => 'CUW','currency_code' => 'ANG'),
        'CX'=> array('iso3' => 'CXR','currency_code' => 'AUD'),
        'CY'=> array('iso3' => 'CYP','currency_code' => 'EUR'),
        'CZ'=> array('iso3' => 'CZE','currency_code' => 'CZK'),
        'DE'=> array('iso3' => 'DEU','currency_code' => 'EUR'),
        'DJ'=> array('iso3' => 'DJI','currency_code' => 'DJF'),
        'DK'=> array('iso3' => 'DNK','currency_code' => 'DKK'),
        'DM'=> array('iso3' => 'DMA','currency_code' => 'XCD'),
        'DO'=> array('iso3' => 'DOM','currency_code' => 'DOP'),
        'DZ'=> array('iso3' => 'DZA','currency_code' => 'DZD'),
        'EC'=> array('iso3' => 'ECU','currency_code' => 'USD'),
        'EE'=> array('iso3' => 'EST','currency_code' => 'EUR'),
        'EG'=> array('iso3' => 'EGY','currency_code' => 'EGP'),
        'EH'=> array('iso3' => 'ESH','currency_code' => 'MAD'),
        'ER'=> array('iso3' => 'ERI','currency_code' => 'ERN'),
        'ES'=> array('iso3' => 'ESP','currency_code' => 'EUR'),
        'ET'=> array('iso3' => 'ETH','currency_code' => 'ETB'),
        'FI'=> array('iso3' => 'FIN','currency_code' => 'EUR'),
        'FJ'=> array('iso3' => 'FJI','currency_code' => 'FJD'),
        'FK'=> array('iso3' => 'FLK','currency_code' => 'FKP'),
        'FM'=> array('iso3' => 'FSM','currency_code' => 'USD'),
        'FO'=> array('iso3' => 'FRO','currency_code' => 'DKK'),
        'FR'=> array('iso3' => 'FRA','currency_code' => 'EUR'),
        'GA'=> array('iso3' => 'GAB','currency_code' => 'XAF'),
        'GD'=> array('iso3' => 'GRD','currency_code' => 'XCD'),
        'GE'=> array('iso3' => 'GEO','currency_code' => 'GEL'),
        'GF'=> array('iso3' => 'GUF','currency_code' => 'EUR'),
        'GG'=> array('iso3' => 'GGY','currency_code' => 'GBP'),
        'GH'=> array('iso3' => 'GHA','currency_code' => 'GHS'),
        'GI'=> array('iso3' => 'GIB','currency_code' => 'GIP'),
        'GL'=> array('iso3' => 'GRL','currency_code' => 'DKK'),
        'GM'=> array('iso3' => 'GMB','currency_code' => 'GMD'),
        'GN'=> array('iso3' => 'GIN','currency_code' => 'GNF'),
        'GP'=> array('iso3' => 'GLP','currency_code' => 'EUR'),
        'GQ'=> array('iso3' => 'GNQ','currency_code' => 'XAF'),
        'GR'=> array('iso3' => 'GRC','currency_code' => 'EUR'),
        'GS'=> array('iso3' => 'SGS','currency_code' => 'GBP'),
        'GT'=> array('iso3' => 'GTM','currency_code' => 'GTQ'),
        'GU'=> array('iso3' => 'GUM','currency_code' => 'USD'),
        'GW'=> array('iso3' => 'GNB','currency_code' => 'XOF'),
        'GY'=> array('iso3' => 'GUY','currency_code' => 'GYD'),
        'HK'=> array('iso3' => 'HKG','currency_code' => 'HKD'),
        'HM'=> array('iso3' => 'HMD','currency_code' => 'AUD'),
        'HN'=> array('iso3' => 'HND','currency_code' => 'HNL'),
        'HR'=> array('iso3' => 'HRV','currency_code' => 'HRK'),
        'HT'=> array('iso3' => 'HTI','currency_code' => 'HTG'),
        'HU'=> array('iso3' => 'HUN','currency_code' => 'HUF'),
        'ID'=> array('iso3' => 'IDN','currency_code' => 'IDR'),
        'IE'=> array('iso3' => 'IRL','currency_code' => 'EUR'),
        'IL'=> array('iso3' => 'ISR','currency_code' => 'ILS'),
        'IM'=> array('iso3' => 'IMN','currency_code' => 'GBP'),
        'IN'=> array('iso3' => 'IND','currency_code' => 'INR'),
        'IO'=> array('iso3' => 'IOT','currency_code' => 'USD'),
        'IQ'=> array('iso3' => 'IRQ','currency_code' => 'IQD'),
        'IR'=> array('iso3' => 'IRN','currency_code' => 'IRR'),
        'IS'=> array('iso3' => 'ISL','currency_code' => 'ISK'),
        'IT'=> array('iso3' => 'ITA','currency_code' => 'EUR'),
        'JE'=> array('iso3' => 'JEY','currency_code' => 'GBP'),
        'JM'=> array('iso3' => 'JAM','currency_code' => 'JMD'),
        'JO'=> array('iso3' => 'JOR','currency_code' => 'JOD'),
        'JP'=> array('iso3' => 'JPN','currency_code' => 'JPY'),
        'KE'=> array('iso3' => 'KEN','currency_code' => 'KES'),
        'KG'=> array('iso3' => 'KGZ','currency_code' => 'KGS'),
        'KH'=> array('iso3' => 'KHM','currency_code' => 'KHR'),
        'KI'=> array('iso3' => 'KIR','currency_code' => 'AUD'),
        'KM'=> array('iso3' => 'COM','currency_code' => 'KMF'),
        'KN'=> array('iso3' => 'KNA','currency_code' => 'XCD'),
        'KP'=> array('iso3' => 'PRK','currency_code' => 'KPW'),
        'KR'=> array('iso3' => 'KOR','currency_code' => 'KRW'),
        'KW'=> array('iso3' => 'KWT','currency_code' => 'KWD'),
        'KY'=> array('iso3' => 'CYM','currency_code' => 'KYD'),
        'KZ'=> array('iso3' => 'KAZ','currency_code' => 'KZT'),
        'LA'=> array('iso3' => 'LAO','currency_code' => 'LAK'),
        'LB'=> array('iso3' => 'LBN','currency_code' => 'LBP'),
        'LC'=> array('iso3' => 'LCA','currency_code' => 'XCD'),
        'LI'=> array('iso3' => 'LIE','currency_code' => 'CHF'),
        'LK'=> array('iso3' => 'LKA','currency_code' => 'LKR'),
        'LR'=> array('iso3' => 'LBR','currency_code' => 'LRD'),
        'LS'=> array('iso3' => 'LSO','currency_code' => 'LSL'),
        'LT'=> array('iso3' => 'LTU','currency_code' => 'EUR'),
        'LU'=> array('iso3' => 'LUX','currency_code' => 'EUR'),
        'LV'=> array('iso3' => 'LVA','currency_code' => 'EUR'),
        'LY'=> array('iso3' => 'LBY','currency_code' => 'LYD'),
        'MA'=> array('iso3' => 'MAR','currency_code' => 'MAD'),
        'MC'=> array('iso3' => 'MCO','currency_code' => 'EUR'),
        'MD'=> array('iso3' => 'MDA','currency_code' => 'MDL'),
        'ME'=> array('iso3' => 'MNE','currency_code' => 'EUR'),
        'MF'=> array('iso3' => 'MAF','currency_code' => 'EUR'),
        'MG'=> array('iso3' => 'MDG','currency_code' => 'MGA'),
        'MH'=> array('iso3' => 'MHL','currency_code' => 'USD'),
        'MK'=> array('iso3' => 'MKD','currency_code' => 'MKD'),
        'ML'=> array('iso3' => 'MLI','currency_code' => 'XOF'),
        'MM'=> array('iso3' => 'MMR','currency_code' => 'MMK'),
        'MN'=> array('iso3' => 'MNG','currency_code' => 'MNT'),
        'MO'=> array('iso3' => 'MAC','currency_code' => 'MOP'),
        'MP'=> array('iso3' => 'MNP','currency_code' => 'USD'),
        'MQ'=> array('iso3' => 'MTQ','currency_code' => 'EUR'),
        'MR'=> array('iso3' => 'MRT','currency_code' => 'MRO'),
        'MS'=> array('iso3' => 'MSR','currency_code' => 'XCD'),
        'MT'=> array('iso3' => 'MLT','currency_code' => 'EUR'),
        'MU'=> array('iso3' => 'MUS','currency_code' => 'MUR'),
        'MV'=> array('iso3' => 'MDV','currency_code' => 'MVR'),
        'MW'=> array('iso3' => 'MWI','currency_code' => 'MWK'),
        'MX'=> array('iso3' => 'MEX','currency_code' => 'MXN'),
        'MY'=> array('iso3' => 'MYS','currency_code' => 'MYR'),
        'MZ'=> array('iso3' => 'MOZ','currency_code' => 'MZN'),
        'NA'=> array('iso3' => 'NAM','currency_code' => 'NAD'),
        'NC'=> array('iso3' => 'NCL','currency_code' => 'XPF'),
        'NE'=> array('iso3' => 'NER','currency_code' => 'XOF'),
        'NF'=> array('iso3' => 'NFK','currency_code' => 'AUD'),
        'NG'=> array('iso3' => 'NGA','currency_code' => 'NGN'),
        'NI'=> array('iso3' => 'NIC','currency_code' => 'NIO'),
        'NL'=> array('iso3' => 'NLD','currency_code' => 'EUR'),
        'NO'=> array('iso3' => 'NOR','currency_code' => 'NOK'),
        'NP'=> array('iso3' => 'NPL','currency_code' => 'NPR'),
        'NR'=> array('iso3' => 'NRU','currency_code' => 'AUD'),
        'NU'=> array('iso3' => 'NIU','currency_code' => 'NZD'),
        'NZ'=> array('iso3' => 'NZL','currency_code' => 'NZD'),
        'OM'=> array('iso3' => 'OMN','currency_code' => 'OMR'),
        'PA'=> array('iso3' => 'PAN','currency_code' => 'PAB'),
        'PE'=> array('iso3' => 'PER','currency_code' => 'PEN'),
        'PF'=> array('iso3' => 'PYF','currency_code' => 'XPF'),
        'PG'=> array('iso3' => 'PNG','currency_code' => 'PGK'),
        'PH'=> array('iso3' => 'PHL','currency_code' => 'PHP'),
        'PK'=> array('iso3' => 'PAK','currency_code' => 'PKR'),
        'PL'=> array('iso3' => 'POL','currency_code' => 'PLN'),
        'PM'=> array('iso3' => 'SPM','currency_code' => 'EUR'),
        'PN'=> array('iso3' => 'PCN','currency_code' => 'NZD'),
        'PR'=> array('iso3' => 'PRI','currency_code' => 'USD'),
        'PS'=> array('iso3' => 'PSE','currency_code' => 'ILS'),
        'PT'=> array('iso3' => 'PRT','currency_code' => 'EUR'),
        'PW'=> array('iso3' => 'PLW','currency_code' => 'USD'),
        'PY'=> array('iso3' => 'PRY','currency_code' => 'PYG'),
        'QA'=> array('iso3' => 'QAT','currency_code' => 'QAR'),
        'RE'=> array('iso3' => 'REU','currency_code' => 'EUR'),
        'RO'=> array('iso3' => 'ROU','currency_code' => 'RON'),
        'RS'=> array('iso3' => 'SRB','currency_code' => 'RSD'),
        'RU'=> array('iso3' => 'RUS','currency_code' => 'RUB'),
        'RW'=> array('iso3' => 'RWA','currency_code' => 'RWF'),
        'SA'=> array('iso3' => 'SAU','currency_code' => 'SAR'),
        'SB'=> array('iso3' => 'SLB','currency_code' => 'SBD'),
        'SC'=> array('iso3' => 'SYC','currency_code' => 'SCR'),
        'SD'=> array('iso3' => 'SDN','currency_code' => 'SDG'),
        'SE'=> array('iso3' => 'SWE','currency_code' => 'SEK'),
        'SG'=> array('iso3' => 'SGP','currency_code' => 'SGD'),
        'SH'=> array('iso3' => 'SHN','currency_code' => 'SHP'),
        'SI'=> array('iso3' => 'SVN','currency_code' => 'EUR'),
        'SJ'=> array('iso3' => 'SJM','currency_code' => 'NOK'),
        'SK'=> array('iso3' => 'SVK','currency_code' => 'EUR'),
        'SL'=> array('iso3' => 'SLE','currency_code' => 'SLL'),
        'SM'=> array('iso3' => 'SMR','currency_code' => 'EUR'),
        'SN'=> array('iso3' => 'SEN','currency_code' => 'XOF'),
        'SO'=> array('iso3' => 'SOM','currency_code' => 'SOS'),
        'SR'=> array('iso3' => 'SUR','currency_code' => 'SRD'),
        'SS'=> array('iso3' => 'SSD','currency_code' => 'SSP'),
        'ST'=> array('iso3' => 'STP','currency_code' => 'STD'),
        'SV'=> array('iso3' => 'SLV','currency_code' => 'USD'),
        'SX'=> array('iso3' => 'SXM','currency_code' => 'ANG'),
        'SY'=> array('iso3' => 'SYR','currency_code' => 'SYP'),
        'SZ'=> array('iso3' => 'SWZ','currency_code' => 'SZL'),
        'TC'=> array('iso3' => 'TCA','currency_code' => 'USD'),
        'TD'=> array('iso3' => 'TCD','currency_code' => 'XAF'),
        'TF'=> array('iso3' => 'ATF','currency_code' => 'EUR'),
        'TG'=> array('iso3' => 'TGO','currency_code' => 'XOF'),
        'TH'=> array('iso3' => 'THA','currency_code' => 'THB'),
        'TJ'=> array('iso3' => 'TJK','currency_code' => 'TJS'),
        'TK'=> array('iso3' => 'TKL','currency_code' => 'NZD'),
        'TL'=> array('iso3' => 'TLS','currency_code' => 'USD'),
        'TM'=> array('iso3' => 'TKM','currency_code' => 'TMT'),
        'TN'=> array('iso3' => 'TUN','currency_code' => 'TND'),
        'TO'=> array('iso3' => 'TON','currency_code' => 'TOP'),
        'TR'=> array('iso3' => 'TUR','currency_code' => 'TRY'),
        'TT'=> array('iso3' => 'TTO','currency_code' => 'TTD'),
        'TV'=> array('iso3' => 'TUV','currency_code' => 'AUD'),
        'TW'=> array('iso3' => 'TWN','currency_code' => 'TWD'),
        'TZ'=> array('iso3' => 'TZA','currency_code' => 'TZS'),
        'UA'=> array('iso3' => 'UKR','currency_code' => 'UAH'),
        'UG'=> array('iso3' => 'UGA','currency_code' => 'UGX'),
        'UK'=> array('iso3' => 'GBR','currency_code' => 'GBP'),
        'UM'=> array('iso3' => 'UMI','currency_code' => 'USD'),
        'US'=> array('iso3' => 'USA','currency_code' => 'USD'),
        'UY'=> array('iso3' => 'URY','currency_code' => 'UYU'),
        'UZ'=> array('iso3' => 'UZB','currency_code' => 'UZS'),
        'VA'=> array('iso3' => 'VAT','currency_code' => 'EUR'),
        'VC'=> array('iso3' => 'VCT','currency_code' => 'XCD'),
        'VE'=> array('iso3' => 'VEN','currency_code' => 'VEF'),
        'VG'=> array('iso3' => 'VGB','currency_code' => 'USD'),
        'VI'=> array('iso3' => 'VIR','currency_code' => 'USD'),
        'VN'=> array('iso3' => 'VNM','currency_code' => 'VND'),
        'VU'=> array('iso3' => 'VUT','currency_code' => 'VUV'),
        'WF'=> array('iso3' => 'WLF','currency_code' => 'XPF'),
        'WS'=> array('iso3' => 'WSM','currency_code' => 'WST'),
        'XK'=> array('iso3' => 'XKX','currency_code' => 'EUR'),
        'YE'=> array('iso3' => 'YEM','currency_code' => 'YER'),
        'YT'=> array('iso3' => 'MYT','currency_code' => 'EUR'),
        'ZA'=> array('iso3' => 'ZAF','currency_code' => 'ZAR'),
        'ZM'=> array('iso3' => 'ZMB','currency_code' => 'ZMW'),
        'ZW'=> array('iso3' => 'ZWE','currency_code' => 'ZWL')
      );

    //
    return $curreny_country_code[$country_code]['currency_code'];
}

function get_exchange_rate($currency_code){
    $ex_rate = 0;
    $usd_rates = file_get_contents(ROOTPATH.'/includes/usd_rates.json');
    $usd_rates = json_decode($usd_rates, true);
    $ex_rate = $usd_rates['rates'][$currency_code];
    return $ex_rate;
}

function check_user_country(){
    global $config;

    if(isset($_SESSION['user']['country']))
    {
        $country_code = $_SESSION['user']['country'];
    }
    else{
        if($config['country_type'] == 'multi'){
            $ip = get_client_ip();

            require_once  ROOTPATH . '/includes/database/geoip/autoload.php';
            // Country DB
            $reader = new \MaxMind\Db\Reader(ROOTPATH .'/includes/database/geoip/geo_country.mmdb');
            $data = $reader->get($ip);
            $country_code = @strtoupper(trim($data['country']['iso_code']));
        }else{
            $country_code = $config['specific_country'];
        }

        if(isset($country_code) && $config['country_type'] == 'multi'){

            if(check_country_activated($country_code)){
                $_SESSION['user']['country'] = $country_code;
            }else{
                $_SESSION['user']['country'] = $config['specific_country'];
                $country_code = $_SESSION['user']['country'];
            }
        }else{
            $_SESSION['user']['country'] = $config['specific_country'];
            $country_code = $_SESSION['user']['country'];
        }
    }

    return $country_code;
}

function get_user_group(){

    global $config;
    $usergroup = 0;

    if(isset($_SESSION['user']['id'])) {

        $user_info = ORM::for_table($config['db']['pre'].'user')
            ->select('group_id')
            ->find_one($_SESSION['user']['id']);

        $usergroup = isset($user_info['group_id'])? $user_info['group_id'] : 0;

    }
    return $usergroup;
}

function set_user_currency($country_code){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'countries')
        ->select('currency_code')
        ->where('code', $country_code)
        ->find_one();
    $currency_code = $info['currency_code'];

    $currency_info = ORM::for_table($config['db']['pre'].'currencies')
        ->where('code', $currency_code)
        ->find_one();

    /*$config['currency_code'] = $info['code'];
    $config['currency_sign'] = $info['html_entity'];
    $config['currency_pos'] = $info['in_left'];*/

    return $currency_info;
}

function change_user_lang($lang_code){

    global $config;

    $lang_code = get_language_by_code($lang_code,true);
    if(!$lang_code) return;
    $cookie_name = "Quick_lang";
    $cookie_value = $lang_code['file_name'];
    setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/");
    if($config['userlangsel'] == '1')
    {
        $config['lang'] = $lang_code['file_name'];
        $config['lang_code'] = get_current_lang_code();
    }
}

function check_user_lang(){

    global $config;

    if($config['userlangsel'] == '1')
    {
        $cookie_name = "Quick_lang";
        if(isset($_COOKIE[$cookie_name])) {
            $config['lang'] = $_COOKIE[$cookie_name];
        }
    }
    return $config['lang'];
}

function get_current_lang_code(){
    global $config;

    $info = ORM::for_table($config['db']['pre'].'languages')
        ->select('code')
        ->where('file_name', $config['lang'])
        ->find_one();
    return strtolower($info['code']);
}

function check_user_theme(){
    global $config;

    if($config['userthemesel'])
    {
        $cookie_name = "Quick_theme";
        if(isset($_COOKIE[$cookie_name])) {
            $config['tpl_name'] = $_COOKIE[$cookie_name];
        }
    }

    return $config['tpl_name'];
}

function check_account_exists($email){

    global $config;

    $count = ORM::for_table($config['db']['pre'].'user')
        ->where('email', $email)
        ->count();

    // check existing email
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function check_table_row_exists($id_field_name,$id_value,$table_name){

    global $config;

    $count = ORM::for_table($config['db']['pre'].$table_name)
        ->where($id_field_name, $id_value)
        ->count();

    // check row exist
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function check_username_exists($username){

    global $config;

    $count = ORM::for_table($config['db']['pre'].'user')
        ->where('username', $username)
        ->count();

    // check row exist
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function get_user_id($username){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('id')
        ->where('username', $username)
        ->find_one();

    if(isset($info['id'])){
        return $info['id'];
    }
    else{
        return FALSE;
    }
}

function get_user_id_by_email($email){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('id')
        ->where('email', $email)
        ->find_one();

    if(isset($info['id'])){
        return $info['id'];
    }
    else{
        return FALSE;
    }
}

function get_username_by_email($email){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('username')
        ->where('email', $email)
        ->find_one();

    if(isset($info['username'])){
        return $info['username'];
    }
    else{
        return FALSE;
    }
}

function is_seller($username){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('user_type')
        ->where('username', $username)
        ->find_one();

    if(isset($info['user_type'])){
        $user_type = $info['user_type'];
        if($user_type == "seller")
            return TRUE;
        else
            return FALSE;
    }
    else{
        return FALSE;
    }
}

function create_user_session($userid,$username,$password){
    $user_browser = $_SERVER['HTTP_USER_AGENT']; // Get the user-agent string of the user.

    $user_id = preg_replace("/[^0-9]+/", "", $userid); // XSS protection as we might print this value
    $_SESSION['user']['id']  = $user_id;

    $username = preg_replace("/[^a-zA-Z0-9_\-]+/", "", $username); // XSS protection as we might print this value
    $_SESSION['user']['username'] = $username;

    $_SESSION['user']['login_string'] = hash('sha512', $password . $user_browser);
}

function userlogin($email,$password)
{
    global $config, $user_id, $username,  $db_password, $where;

    $regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';

    if(!preg_match("/^[[:alnum:]]+$/", $email))
    {
        if(!preg_match($regex,$email))
        {
            return false;
        }
        else{
            //checking in email
            $where = 'email';
        }
    }
    else{
        //checking in username
        $where = 'username';
    }

    $num_rows = ORM::for_table($config['db']['pre'].'user')
        ->select_many('id', 'status', 'username', 'password_hash')
        ->where($where, $email)
        ->count();

    if ($num_rows >= 1) {
        $info = ORM::for_table($config['db']['pre'].'user')
            ->select_many('id', 'status', 'username', 'password_hash')
            ->where($where, $email)
            ->find_one();

        $user_id = $info['id'];
        $status = $info['status'];
        $username = $info['username'];
        $db_password = $info['password_hash'];

        // If the user exists we check if the account is locked
        // from too many login attempts

        /*if (checkbrute($user_id) == true) {
            // Account is locked
            // Send an email to user saying their account is locked
            return false;
        } else {
            // Check if the password in the database matches
            // the password the user submitted. We are using
            // the password_verify function to avoid timing attacks.

        }*/
        if (password_verify($password, $db_password)) {
            // Password is correct!

            // Login successful.
            $userinfo = array();
            $userinfo['id'] = $user_id;
            $userinfo['status'] = $status;
            $userinfo['username'] = $username;
            $userinfo['password'] = $db_password;

            return $userinfo;

        } else {
            // Password is not correct
            // We record this attempt in the database
            $now = time();
            $login_attempts = ORM::for_table($config['db']['pre'].'login_attempts')->create();
            $login_attempts->user_id = $user_id;
            $login_attempts->time = $now;
            $login_attempts->save();

            return false;
        }
    } else {
        // No user exists.
        return false;
    }
	
}

function checkloggedin()
{
    global $config,$password;

    // Check if all session variables are set
    if (isset($_SESSION['user']['id'],
        $_SESSION['user']['username'],
        $_SESSION['user']['login_string'])) {

        $user_id = $_SESSION['user']['id'];
        $login_string = $_SESSION['user']['login_string'];
        $username = $_SESSION['user']['username'];

        // Get the user-agent string of the user.
        $user_browser = $_SERVER['HTTP_USER_AGENT'];

        $result = ORM::for_table($config['db']['pre'].'user')
            ->select('password_hash')
            ->where('id', $user_id)
            ->find_one();

        if (!empty($result)) {

            $login_check = hash('sha512', $result['password_hash'] . $user_browser);

            if (hash_equals($login_check, $login_string) ){
                // Logged In!!!!
                return true;
            } else {
                // Not logged in
                return false;
            }
        } else {
            // Not logged in
            return false;
        }
    } else {
        // Not logged in
        return false;
    }
}

function createusernameslug($title){
    global $config;
    $numHits = 0;
    $slug = $title;

    $numHits = ORM::for_table($config['db']['pre'].'user')
        ->where_like('username', ''.$slug.'%')
        ->count();

    return ($numHits > 0) ? ($slug.$numHits) : $slug;
}

function checkSocialUser($userData = array(),$picname){

    global $config;

    if(!empty($userData)){

        $fullname = $userData['first_name'].' '.$userData['last_name'];

        /*split the string bases on the @ position*/
        $parts = explode('@',  $userData['email']);
        $part_username = $parts[0];

        // Check whether user data already exists in database
        $info = ORM::for_table($config['db']['pre'].'user')
            ->where_any_is(array(
                array('email' => $userData['email']),
                array('oauth_uid' => $userData['oauth_uid'])))
            ->find_one();

        if(!empty($info)){
            $userData = $info;
        }else{
            if(check_username_exists($part_username)){
                $username = createusernameslug($part_username);
            }
            else{
                $username = $part_username;
            }

            $location = getLocationInfoByIp();
            $gender = ($userData['gender'] == "") ? "Male" : $userData['gender'];
            $password = get_random_id();
            $pass_hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
            // Insert user data
            $now = date("Y-m-d H:i:s");

            $insert_user = ORM::for_table($config['db']['pre'].'user')->create();
            $insert_user->oauth_provider = $userData['oauth_provider'];
            $insert_user->oauth_uid = $userData['oauth_uid'];
            $insert_user->status = '1';
            $insert_user->name = $fullname;
            $insert_user->username = $username;
            $insert_user->password_hash = $pass_hash;
            $insert_user->email = $userData['email'];
            $insert_user->sex = $gender;
            $insert_user->image = $picname;
            $insert_user->oauth_link = $userData['link'];
            $insert_user->created_at = $now;
            $insert_user->updated_at = $now;
            $insert_user->country = $location['country'];
            $insert_user->city = $location['city'];
            $insert_user->save();

            $user_id = $insert_user->id();
            // Get user data from the database
            $userData['id'] = $user_id;
            $userData['username'] = $username;
            $userData['password_hash'] = $pass_hash;
            $userData['status'] = 1;
        }
    }

    // Return user data
    return $userData;
}

function get_user_data($username=null,$userid=null){

    global $config;

    if($username != null){
        $info = ORM::for_table($config['db']['pre'].'user')
            ->where('username', $username)
            ->find_one();
    }
    else{
        $info = ORM::for_table($config['db']['pre'].'user')
            ->where('id', $userid)
            ->find_one();
    }

    if (isset($info['id'])) {
        $userinfo['id']         = $info['id'];
        $userinfo['username']   = $info['username'];
        $userinfo['user_type']  = $info['user_type'];
        $userinfo['name']       = $info['name'];
        $userinfo['email']      = $info['email'];
        $userinfo['confirm']    = $info['confirm'];
        $userinfo['password']   = $info['password_hash'];
        $userinfo['forgot']     = $info['forgot'];
        $userinfo['status']     = $info['status'];
        $userinfo['view']       = $info['view'];
        $userinfo['image']      = $info['image'];
        $userinfo['tagline']    = $info['tagline'];
        $userinfo['description'] = $info['description'];
        $userinfo['sex']        = $info['sex'];
        $userinfo['phone']      = $info['phone'];
        $userinfo['postcode']   = $info['postcode'];
        $userinfo['address']    = $info['address'];
        $userinfo['country']    = $info['country'];
        $userinfo['city']       = $info['city'];
        $userinfo['lastactive'] = $info['lastactive'];
        $userinfo['online']     = $info['online'];
        $userinfo['created_at'] = timeAgo($info['created_at']);
        $userinfo['updated_at'] = $info['updated_at'];

        $userinfo['facebook']   = $info['facebook'];
        $userinfo['twitter']    = $info['twitter'];
        $userinfo['googleplus'] = $info['googleplus'];
        $userinfo['instagram']  = $info['instagram'];
        $userinfo['linkedin']   = $info['linkedin'];
        $userinfo['youtube']    = $info['youtube'];

        $userinfo['notify']    = $info['notify'];
        $userinfo['notify_cat']    = $info['notify_cat'];
        $userinfo['website']    = $info['website'];
        return $userinfo;
    }
    else{
        return 0;
    }
}

function update_lastactive(){

    global $config;

    if(isset($_SESSION['user']['id']))
    {
        $person = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
        $person->set_expr('lastactive', 'NOW()');
        $person->save();
    }
}

function send_forgot_email($to,$id)
{
    global $config,$lang,$link;
	$time = time();
	$rand = getrandnum(10);
	$forgot = md5($time.'_:_'.$rand.'_:_'.$to);

    $person = ORM::for_table($config['db']['pre'].'user')->find_one($id);
    $person->forgot = $forgot;
    $person->save();

    $get_userdata = get_user_data(null,$id);
    $to_name = $get_userdata['name'];

    $page = new HtmlTemplate();
    $page->html = $config['email_sub_forgot_pass'];
    $page->SetParameter ('EMAIL', $to);
    $page->SetParameter ('USER_FULLNAME', $to_name);
    $email_subject = $page->CreatePageReturn($lang,$config,$link);

    $forget_password_link = $config['site_url']."login?forgot=".$forgot."&r=".$rand."&e=".$to."&t=".$time;
    $page = new HtmlTemplate();
    $page->html = $config['email_message_forgot_pass'];
    $page->SetParameter ('FORGET_PASSWORD_LINK', $forget_password_link);
    $page->SetParameter ('EMAIL', $to);
    $page->SetParameter ('USER_FULLNAME', $to_name);
    $email_body = $page->CreatePageReturn($lang,$config,$link);

    email($to,$to_name,$email_subject,$email_body);
}

function getrandnum($length)
{
    $randstr='';
    srand((double)microtime()*1000000);
    $chars = array ( 'a','b','C','D','e','f','G','h','i','J','k','L','m','N','P','Q','r','s','t','U','V','W','X','y','z','1','2','3','4','5','6','7','8','9');
    for ($rand = 0; $rand <= $length; $rand++)
    {
        $random = rand(0, count($chars) -1);
        $randstr .= $chars[$random];
    }

    return $randstr;
}

function randomPassword() {
    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

function update_profileview($user_id){

    global $config;

    $person = ORM::for_table($config['db']['pre'].'user')->find_one($user_id);
    $person->set_expr('view', 'view+1');
    $person->save();
}


/********************SECURE LOGIN*********************/
function sec_session_start() {
    define("CAN_REGISTER", "any");
    define("DEFAULT_ROLE", "member");
    define("SECURE", FALSE);    // FOR DEVELOPMENT ONLY!!!!
    $session_name = 'sec_session_id';   // Set a custom session name
    $secure = SECURE;
    // This stops JavaScript being able to access the session id.
    $httponly = true;
    // Forces sessions to only use cookies.
    if (ini_set('session.use_only_cookies', 1) === FALSE) {
        header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
        exit();
    }
    // Gets current cookies params.
    $cookieParams = session_get_cookie_params();
    session_set_cookie_params($cookieParams["lifetime"], $cookieParams["path"], $cookieParams["domain"], $secure, $httponly);
    // Sets the session name to the one set above.
    session_name($session_name);
    session_start();            // Start the PHP session
    session_regenerate_id();    // regenerated the session, delete the old one.
}

function checkbrute($user_id) {

    global $config;
    // Get timestamp of current time
    $now = time();

    // All login attempts are counted from the past 2 hours.
    $valid_attempts = $now - (2 * 60 * 60);

    $num_rows = ORM::for_table($config['db']['pre'].'login_attempts')
        ->where_any_is(array(
            array('user_id' => $user_id, 'time' => $valid_attempts)), array('time' => '>'))
        ->count();

    // If there have been more than 5 failed login
    if ($num_rows > 5) {
        return true;
    } else {
        return false;
    }
}

function esc_url($url) {

    if ('' == $url) {
        return $url;
    }

    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);

    $strip = array('%0d', '%0a', '%0D', '%0A');
    $url = (string) $url;

    $count = 1;
    while ($count) {
        $url = str_replace($strip, '', $url, $count);
    }

    $url = str_replace(';//', '://', $url);

    $url = htmlentities($url);

    $url = str_replace('&amp;', '&#038;', $url);
    $url = str_replace("'", '&#039;', $url);

    if ($url[0] !== '/') {
        // We're only interested in relative links from $_SERVER['PHP_SELF']
        return '';
    } else {
        return $url;
    }
}
