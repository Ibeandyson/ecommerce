{OVERALL_HEADER}
<form method="get" action="{LINK_LISTING}" name="locationForm" id="ListingForm">
    <div id="titlebar">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="agent agent-page long-content">

                        <div class="agent-avatar">
                            <img src="{SITE_URL}storage/profile/{USERIMAGE}" alt="{FULLNAME}">
                        </div>

                        <div class="agent-content">
                            <div class="agent-name">
                                <h4>{FULLNAME}
                                    IF("{SUB_IMAGE}"!=""){
                                    <img src="{SUB_IMAGE}" alt="{SUB_TITLE}" title="{SUB_TITLE}" width="28px"/>
                                    {:IF}
                                </h4>
                                <span>@{USERNAME}</span>
                            </div>
                            <p>{ABOUT}</p>
                            <ul class="agent-contact-details">
                                IF("{ADDRESS}"!=""){ <li><i class="icon-feather-map-pin"></i><a href="https://maps.google.com/?q={ADDRESS}" target="_blank" rel="nofollow">{ADDRESS}</a></li>{:IF}
                                IF("{PHONE}"!=""){ <li><i class="icon-feather-phone-call"></i><a href="tel:{PHONE}">{PHONE}</a></li>{:IF}
                                IF("{EMAIL}"!=""){ <li><i class="icon-feather-mail"></i><a href="mailto:{EMAIL}">{EMAIL}</a></li>{:IF}
                                IF("{WEBSITE}"!=""){ <li><i class="icon-feather-globe"></i><a href="{WEBSITE}" target="_blank" rel="nofollow">{WEBSITE}</a></li>{:IF}
                            </ul>

                            <div class="freelancer-socials margin-top-25">
                                <ul>
                                    IF("{FACEBOOK}"!=""){  <li><a href="{FACEBOOK}" target="_blank" class="facebook"><i class="fa fa-facebook"></i></a></li> {:IF}
                                    IF("{TWITTER}"!=""){  <li><a href="{TWITTER}" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a></li>{:IF}
                                    IF("{GPLUS}"!=""){  <li><a href="{GPLUS}" target="_blank" class="google"><i class="fa fa-google-plus"></i></a></li>{:IF}
                                    IF("{LINKEDIN}"!=""){  <li><a href="{LINKEDIN}" target="_blank" class="linkden"><i class="fa fa-linkedin"></i></a></li>{:IF}
                                    IF("{INSTAGRAM}"!=""){  <li><a href="{INSTAGRAM}" target="_blank" class="instagram"><i class="fa fa-instagram"></i></a></li>{:IF}
                                    IF("{YOUTUBE}"!=""){  <li><a href="{YOUTUBE}" target="_blank" class="youtube"><i class="fa fa-youtube"></i></a></li>{:IF}
                                </ul>
                                <!--end social-->
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <h2>{LANG_WE_FOUND} {ADSFOUND} {LANG_ADS_LISTINGS}</h2>
                    <div class="intro-banner-search-form listing-page margin-top-30">
                        <!-- Search Field -->
                        <div class="intro-search-field">
                            <div class="dropdown category-dropdown">
                                <a data-toggle="dropdown" href="#">
                                    <span class="change-text">{LANG_SELECT} {LANG_CATEGORY}</span><i class="fa fa-navicon"></i>
                                </a>
                                {CAT_DROPDOWN}
                            </div>
                        </div>
                        <div class="intro-search-field">
                            <input id="keywords" type="text" name="keywords" placeholder="{LANG_WHAT_LOOK_FOR}" value="{KEYWORDS}">
                        </div>
                        <div class="intro-search-field with-autocomplete">
                            <div class="input-with-icon">
                                <input type="text" id="searchStateCity" name="location" placeholder="{LANG_WHERE}">
                                <i class="la la-map-marker"></i>
                                <input type="hidden" name="placetype" id="searchPlaceType" value="">
                                <input type="hidden" name="placeid" id="searchPlaceId" value="">
                                <input type="hidden" id="input-maincat" name="cat" value="{MAINCAT}"/>
                                <input type="hidden" id="input-subcat" name="subcat" value="{SUBCAT}"/>
                                <input type="hidden" id="input-filter" name="filter" value="{FILTER}"/>
                                <input type="hidden" id="input-sort" name="sort" value="{SORT}"/>
                                <input type="hidden" id="input-order" name="order" value="{ORDER}"/>
                            </div>
                        </div>
                        <div class="intro-search-button">
                            <button class="button ripple-effect">{LANG_SEARCH}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="popup-with-zoom-anim hidden" href="#citiesModal" id="change-city">city</a>
    <div class="zoom-anim-dialog mfp-hide popup-dialog big-dialog" id="citiesModal">
        <div class="popup-tab-content padding-0">
            <div class="quick-states" id="country-popup" data-country-id="{DEFAULT_COUNTRY_ID}" style="display: block;">
            <div id="regionSearchBox" class="title clr">
                <div class="clr">
                    <div class="locationrequest smallBox br5 col-sm-4">
                        <div class="rel input-container">
                            <div class="input-with-icon">
                                <input id="inputStateCity" class="with-border" type="text" placeholder="{LANG_TYPE_YOUR_CITY}">
                                <i class="la la-map-marker"></i>
                            </div>
                            <div id="searchDisplay"></div>
                            <div class="suggest bottom abs small br3 error hidden"><span
                                        class="target abs icon"></span>

                                <p></p>
                            </div>
                        </div>
                        <div id="lastUsedCities" class="last-used binded" style="display: none;">{LANG_LAST_VISITED}
                            <ul id="last-locations-ul">
                            </ul>
                        </div>
                    </div>
                    IF("{COUNTRY_TYPE}"=="multi"){
                    <span style="line-height: 30px;">
                        <span class="flag flag-{USER_COUNTRY}"></span> <a href="#countryModal" class="popup-with-zoom-anim">{LANG_CHANGE_COUNTRY}</a>
                    </span>
                    {:IF}
                </div>
            </div>
            <div class="popular-cities clr">
                <p>{LANG_POPULAR_CITIES}</p>

                <div class="list row">

                    <ul class="col-lg-12 col-md-12 popularcity">
                        {LOOP: POPULARCITY}
                        {POPULARCITY.tpl}
                        {/LOOP: POPULARCITY}
                    </ul>
                </div>
            </div>
            <div class="viewport">
                <div class="full" id="getCities">
                    <div class="col-sm-12 col-md-12 loader" style="display: none"></div>
                    <div id="results" class="animate-bottom">
                        <ul class="column cities">
                            {LOOP: STATELIST}
                            {STATELIST.tpl}
                            {/LOOP: STATELIST}
                        </ul>
                    </div>
                </div>
                <div class="table full subregionslinks hidden" id="subregionslinks"></div>
            </div>
        </div>
        </div>
    </div>
    <div class="container margin-bottom-60">
        <div class="row">
            IF("{LEFT_ADSTATUS}"=="1"){
            <div class="hidden-xs hidden-sm col-md-2 text-center">
                <div class="advertisement" id="quickad-left">{LEFT_ADSCODE}</div>
            </div>
            {:IF}
            <div class="{CATEGORY_COLUMN}">

                <h3 class="page-title">{LANG_SEARCH_RESULTS}</h3>

                <div class="notify-box margin-top-15">
                   <span class="font-weight-600">{ADSFOUND} {LANG_ADS_FOUND}</span>

                    <div class="sort-by">
                        <span>{LANG_SORT_BY}</span>
                        <select class="selectpicker hide-tick" id="sort-filter">
                            <option data-filter-type="sort" data-filter-val="id" data-order="desc">{LANG_NEWEST}</option>
                            <option data-filter-type="sort" data-filter-val="title" data-order="desc">{LANG_NAME}</option>
                            <option data-filter-type="sort" data-filter-val="date" data-order="desc">{LANG_DATE}</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="desc">{LANG_SALARY} ({LANG_HIGH_TO_LOW})</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="asc">{LANG_SALARY} ({LANG_LOW_TO_HIGH})</option>
                        </select>
                    </div>
                </div>

                <div class="row listings-container compact-list-layout margin-top-10" style="padding:0 10px;">
                    {LOOP: ITEM}
                    <!-- I modify line add 'col-6 col-sm-6 col-md-4 col-xl-3'-->
                    <div class='col-6 col-sm-6 col-md-4 col-xl-3 job-listing IF("{ITEM.highlight}"=="1"){ highlight {:IF}' style="padding:5px; border:0;text-align:center">
                        <a href="{ITEM.link}">
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo" style="position:relative;">
                                    <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                                    IF("{ITEM.featured}"=="1" || "{ITEM.urgent}"=="1"){
                                    <span style="background:rgba(0,0,0,.25);border-radius:20px;padding:0px 7px;position:absolute;top:5px;left:5px;">
                                        IF("{ITEM.featured}"=="1"){<i class="la la-star" style="color:green;"></i>{:IF}
                                        IF("{ITEM.urgent}"=="1"){<i class="la la-star" style="color:orange;"></i>{:IF}
                                    </span>
                                    {:IF}
                                    <span style="background:rgba(0,0,0,.25);border-radius:20px;padding:0px 7px;position:absolute;top:5px;right:5px;">
                                        <span class="la la-heart set-item-fav IF('{ITEM.favorite}'){ added {:IF}" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="setFavAd"></span>
                                    </span>
                                </div>
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title">{ITEM.product_name}</h3>
                                </div>

                            </div>
                        </a>
                        <div class="job-listing-footer">
                            <ul>
                                IF("{ITEM.price}"!="0"){

                                <li class="job-listing-price d-inline"> {ITEM.price}</li>
                                IF("{ITEM.alt_price}"!=""){
                                <li class="job-listing-price d-none"> {ITEM.alt_price}</li>
                                <li style="background-color:#76ba1b;color:white; padding:2px 5px;cursor:pointer;border-radius:11px;" onclick="swap_currency(this)">convert</li>
                                {:IF}
                                {:IF}
                            </ul>
                        </div>
                    </div>
                    {/LOOP: ITEM}
                </div>
                    <div class="clearfix"></div>
                    IF("{ADSFOUND}"!="0"){
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Pagination -->
                            <div class="pagination-container margin-top-20">
                                <nav class="pagination">
                                    <ul>
                                        {LOOP: PAGES}
                                        IF("{PAGES.current}"=="0"){
                                        <li><a href="{PAGES.link}">{PAGES.title}</a></li>
                                        {ELSE}
                                        <li><a href="#" class="current-page">{PAGES.title}</a></li>
                                        {:IF}
                                        {/LOOP: PAGES}
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    {:IF}

                </div>

            </div>
             IF("{RIGHT_ADSTATUS}"=="1"){
            <div class="hidden-xs hidden-sm col-md-2 text-center">
                <div class="advertisement" id="quickad-right">{RIGHT_ADSCODE}</div>
            </div>
            {:IF}
        </div>
    </div>
</form>
<script type="text/javascript">

    $('#sort-filter').on('change', function (e) {
        var $item = $(this).find(':selected');

        var filtertype = $item.data('filter-type');
        var filterval = $item.data('filter-val');
        $('#input-' + filtertype).val(filterval);
        $('#input-order').val($item.data('order'));
        $('#ListingForm').submit();
    });

    var getMaincatId = '{MAINCAT}';
    var getSubcatId = '{SUBCAT}';

    $(window).bind("load", function () {
        if (getMaincatId != "") {
            $('li a[data-cat-type="maincat"][data-ajax-id="' + getMaincatId + '"]').trigger('click');
        } else if (getSubcatId != "") {
            $('li ul li a[data-cat-type="subcat"][data-ajax-id="' + getSubcatId + '"]').trigger('click');
        } else {
            $('li a[data-cat-type="all"]').trigger('click');
        }
    });
</script>
{OVERALL_FOOTER}
