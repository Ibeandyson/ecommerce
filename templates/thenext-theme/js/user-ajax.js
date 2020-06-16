/* 1 */
/* Live Location Detect
/* ========================================================================== */
jQuery(document).ready(function($) {
    var loc = jQuery('.loc-tracking').data('option');
    var apiType = jQuery('#page').data('ipapi');
    var currentlocationswitch = '1';
    currentlocationswitch = jQuery('#page').data('showlocationicon');

    if (currentlocationswitch == "0") {
        loc = 'locationifoff';
        jQuery('.loc-tracking > i').fadeOut('fast');
    }

    if (loc == 'yes') {
        if (jQuery('.intro-search-field').is('.live-location-search')) {
            if (apiType === "geo_ip_db") {
                jQuery.getJSON('https://geoip-db.com/json/geoip.php?jsonp=?')
                    .done(function (location) {

                        getCityidByCityName(location.country_code, location.state, location.city);
                        jQuery('input[name=location]').val(location.city);

                        jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');
                    });
            }
            else if (apiType === "ip_api") {
                jQuery.get("https://ipapi.co/json", function (location) {

                    getCityidByCityName(location.country, location.region, location.city);
                    jQuery('input[name=location]').val(location.city);

                    jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');
                }, "json");
            }
            else {
                GetCurrentGpsLoc(function (GpsLocationCityData) {
                    myCurrentGpsLocation = GpsLocationCityData;
                    getCityidByCityName(myCurrentGpsLocation.country, myCurrentGpsLocation.region, myCurrentGpsLocation.city);
                    jQuery('input[name=location]').val(myCurrentGpsLocation.city);

                    jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');
                });
            }

        }
    }
    else if (loc == 'no') {
        jQuery('.live-location-search .loc-tracking > i').on('click', function (event) {
            event.preventDefault();
            jQuery(this).addClass('fa-circle-o-notch fa-spin');
            jQuery(this).removeClass('fa-crosshairs');
            if (jQuery('.intro-search-field').is('.live-location-search')) {
                if (apiType === "geo_ip_db") {
                    jQuery.getJSON('https://geoip-db.com/json/geoip.php?jsonp=?')
                        .done(function (location) {

                            if (location.city == null) {
                            }
                            else {
                                getCityidByCityName(location.country_code, location.state, location.city);
                                jQuery('input[name=latitude]').val(location.latitude);
                                jQuery('input[name=longitude]').val(location.longitude);
                                jQuery('input[name=location]').val(location.city);
                            }
                            jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');
                        });
                }
                else if (apiType === "ip_api") {
                    jQuery.get("https://ipapi.co/json", function (location) {
                        if (location.city == null) {
                        }
                        else {
                            getCityidByCityName(location.country, location.region, location.city);

                            jQuery('input[name=latitude]').val(location.latitude);
                            jQuery('input[name=longitude]').val(location.longitude);
                            jQuery('input[name=location]').val(location.city);
                        }
                        jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');

                    }, "json");
                }
                else {

                    GetCurrentGpsLoc(function (GpsLocationCityData) {
                        myCurrentGpsLocation = GpsLocationCityData;
                        getCityidByCityName(myCurrentGpsLocation.country, myCurrentGpsLocation.region, myCurrentGpsLocation.city);
                        jQuery('input[name=location]').val(myCurrentGpsLocation.city);
                        jQuery('.live-location-search .loc-tracking > i').fadeOut('slow');
                    });

                }
            }
        });
    }
});

//GPS LIVE LOCATION
var geocoderr;
function GetCurrentGpsLoc(lpcalback){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
            var clat = position.coords.latitude;
            var clong = position.coords.longitude;
            jpCodeLatLng(clat,clong, function(citynamevalue){

                lpcalback(citynamevalue);

            });
        });

    } else {
        alert("Geolocation is not supported by this browser.");
    }

}

function lpgeocodeinitialize() {
    geocoderr = new google.maps.Geocoder();
}

function jpCodeLatLng(lat, lng, lpcitycallback) {

    latlng 	 = new google.maps.LatLng(lat, lng),
        geocoderrr = new google.maps.Geocoder();
    geocoderrr.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                for (var i = 0; i < results.length; i++) {
                    if (results[i].types[0] === "locality") {
                        var city = results[i].address_components[0].short_name;
                        var region = results[i].address_components[2].long_name;
                        var country = results[i].address_components[3].short_name;

                        var $citydata = {};
                        $citydata['city'] = city;
                        $citydata['region'] = region;
                        $citydata['country'] = country;
                        lpcitycallback($citydata);
                    }
                }
            }
            else {console.log("No reverse geocode results.")}
        }
        else {console.log("Geocoder failed: " + status)}
    });

}

function getCityidByCityName(country,state,city) {
    var data = {action: "getCityidByCityName", city: city, state: state, country: country};
    $.ajax({
        type: "POST",
        url: ajaxurl,
        data: data,
        success: function (result) {
            $('#searchPlaceType').val("city");
            $('#searchPlaceId').val(result);
        }
    });
}