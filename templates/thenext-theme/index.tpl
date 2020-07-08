{OVERALL_HEADER}
<div class="intro-banner" data-background-image="{SITE_URL}storage/banner/{BANNER_IMAGE}">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="banner-headline">
                    <h5><strong>{LANG_HOME_BANNER_HEADING}</strong>
                        <br>
                        <!--<span>{LANG_HOME_BANNER_TAGLINE}</span>--></h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form autocomplete="off" method="get" action="{LINK_LISTING}" accept-charset="UTF-8">
                    <div class="intro-banner-search-form margin-top-45">
                        <div class="intro-search-field">
                            <input id="intro-keywords" type="text" class="qucikad-ajaxsearch-input" placeholder="{LANG_WHAT_LOOK_FOR}" data-prev-value="0" data-noresult="{LANG_MORE_RESULTS_FOR}">
                            <div id="qucikad-ajaxsearch-dropdown" size="0" tabindex="0">
                                <ul>
                                    {LOOP: CATEGORY}
                                    <li class="qucikad-ajaxsearch-li-cats" data-catid="{CATEGORY.slug}">
                                        IF("{CATEGORY.picture}"==""){
                                        <i class="qucikad-as-caticon {CATEGORY.icon}"></i>
                                        {:IF}
                                        IF("{CATEGORY.picture}"!=""){
                                        <img src="{CATEGORY.picture}" />
                                        {:IF}
                                        <span class="qucikad-as-cat">{CATEGORY.name}</span>
                                    </li>
                                    {/LOOP: CATEGORY}
                                </ul>

                                <div style="display:none" id="def-cats">

                                </div>
                            </div>
                        </div>
                        <div class="intro-search-field with-autocomplete live-location-search">
                            <div class="input-with-icon">
                                <input type="text" id="searchStateCity" name="location" placeholder="{LANG_WHERE}">
                                <i class="la la-map-marker"></i>
                                <div data-option="{AUTO_DETECT_LOCATION}" class="loc-tracking"><i class="fa fa-crosshairs"></i></div>
                                <input type="hidden" name="latitude" id="latitude" value="">
                                <input type="hidden" name="longitude" id="longitude" value="">
                                <input type="hidden" name="placetype" id="searchPlaceType" value="">
                                <input type="hidden" name="placeid" id="searchPlaceId" value="">
                                <input type="hidden" id="input-keywords" name="keywords" value="">
                                <input type="hidden" id="input-maincat" name="cat" value="" />
                                <input type="hidden" id="input-subcat" name="subcat" value="" />
                            </div>
                        </div>
                        <div class="intro-search-button">
                            <button class="button ripple-effect">{LANG_SEARCH}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Category Boxes -->
<div class="section margin-top-45">
    <div class="container">
        <div class="row">
            <div class="col-xl-12 px-0">

                <div class="categories-container">
                    <a href="#" class="category-box">
                        <div class="category-box-icon">
                            <div class="category-icon"><img src="/templates/thenext-theme/images/engineer.png" /></div>
                        </div>
                        <div class="category-box-content">
                            <h3>{LANG_FARMERS_CLUB}</h3>
                        </div>
                    </a>
                    {LOOP: CAT}
                    <a href="{CAT.catlink}" class="category-box">
                        <div class="category-box-icon margin-bottom-10">
                            IF("{CAT.picture}"==""){
                            <div class="category-icon"><i class="{CAT.icon}"></i></div>
                            {ELSE}
                            <div class="category-icon"><img src="{CAT.picture}" /></div>
                            {:IF}
                        </div>
                        <!--<div class="category-box-counter">{CAT.main_ads_count}</div>-->
                        <div class="category-box-content">
                            <h3>{CAT.main_title}</h3>
                        </div>
                    </a>
                    {/LOOP: CAT}
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Features Jobs -->
<div class="section gray margin-top-45 padding-top-65 padding-bottom-65">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section-headline margin-top-0 margin-bottom-35">
                    <h3>{LANG_PREMIUM_ADS}</h3>
                    <a href="{LINK_LISTING}?filter=premium" class="headline-link">{LANG_VIEW_MORE}</a>
                </div>
                <!-- I modify line add 'row' @python-->
                <div class="row listings-container compact-list-layout margin-top-35">
                    {LOOP: ITEM}
                    <!-- I modify line add 'col-6 col-sm-6 col-md-4 col-xl-3'-->
                    <div class='col-6 col-sm-6 col-md-4 col-xl-3 job-listing' style="padding:5px; border:0;text-align:center">
                        <a href="{ITEM.link}">
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo" style="position:relative;">
                                    <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                                    IF("{ITEM.urgent}"=="1"){
                                    <div style="position:absolute;top:4px;left:4px;">
                                        <span style="background:rgba(255,255,255,1);padding:0px 7px;border-radius:15px;color:#f00;display:block;font-size:12px;line-height:1.5rem;"><b>Urgent</b></span>
                                    </div>
                                    {:IF}
                                    IF("{ITEM.featured}"=="1"){
                                    <div style="position:absolute;top:4px;right:4px;">
                                        <span style="background:rgba(255,255,255,1);padding:0px 7px;border-radius:15px;color:rgb(118, 186, 27);display:block;font-size:12px;line-height:1.5rem;"><i class="la la-star"></i> Featured</span>
                                    </div>
                                    {:IF}
                                    IF("{ITEM.highlight}"=="1"){
                                    <div style="position:absolute;bottom:5px;left:5px;">
                                        <span style="background:rgba(255,255,255,1);padding:4px;border-radius:15px;box-shadow:1px 1px 2px #666;color: rgba(255,165,0,1);display:block;font-size:14px;line-height:1rem;"> <i class="la la-star"></i> Highlight</span>
                                    </div>
                                    {:IF}
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
            </div>
        </div>
    </div>
</div>
<!-- Featured Jobs / End -->

<!-- Latest Jobs -->
<div class="section padding-top-65 padding-bottom-75">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section-headline margin-top-0 margin-bottom-35">
                    <h3>{LANG_LATEST_ADS}</h3>
                    <a href="{LINK_LISTING}" class="headline-link">{LANG_VIEW_MORE}</a>
                </div>
                <!-- I modify line add 'row' @python-->
                <div class="row listings-container compact-list-layout margin-top-35">
                    {LOOP: ITEM2}
                    <!-- I modify line add 'col-6 col-sm-6 col-md-4 col-xl-3'-->
                    <div class="col-6 col-sm-6 col-md-4 col-xl-3 job-listing" style="padding:5px; border:0;text-align:center">
                        <a href="{ITEM2.link}">
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo" style="position:relative;">
                                    <!-- I modify line remove some unnessary data wey dey cum from back end. like the time, person wake past am and location @python-->
                                    <img src="{SITE_URL}storage/products/{ITEM2.picture}" alt="{ITEM2.product_name}">
                                    IF("{ITEM2.urgent}"=="1"){
                                    <div style="position:absolute;top:4px;left:4px;">
                                        <span style="background:rgba(255,255,255,1);padding:0px 7px;border-radius:15px;color:#f00;display:block;font-size:12px;line-height:1.5rem;"><b>Urgent</b></span>
                                    </div>
                                    {:IF}
                                    IF("{ITEM2.featured}"=="1"){
                                    <div style="position:absolute;top:4px;right:4px;">
                                        <span style="background:rgba(255,255,255,1);padding:0px 7px;border-radius:15px;color:rgb(118, 186, 27);display:block;font-size:12px;line-height:1.5rem;"><i class="la la-star"></i> Featured</span>
                                    </div>
                                    {:IF}
                                    IF("{ITEM2.highlight}"=="1"){
                                    <div style="position:absolute;bottom:5px;left:5px;">
                                        <span style="background:rgba(255,255,255,1);padding:4px;border-radius:15px;box-shadow:1px 1px 2px #666;color: rgba(255,165,0,1);display:block;font-size:14px;line-height:1rem;"> <i class="la la-star"></i> Highlight</span>
                                    </div>
                                    {:IF}
                                </div>
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title">{ITEM2.product_name}</h3>
                                </div>
                            </div>
                        </a>
                        <div class="job-listing-footer">
                            <ul>
                                IF("{ITEM2.price}"!="0"){
                                <!-- I modify line add 'job-listing-price' @python-->
                                <li class="job-listing-price d-inline">{ITEM2.price}</li>
                                IF("{ITEM2.alt_price}"!=""){
                                <li class="job-listing-price d-none"> {ITEM2.alt_price}</li>
                                <li style="background-color:#76ba1b;color:white; padding:2px 5px;cursor:pointer;border-radius:11px;" onclick="swap_currency(this)">convert</li>
                                {:IF}
                                {:IF}
                            </ul>
                        </div>
                    </div>
                {/LOOP: ITEM2}
            </div>
        </div>
    </div>
</div>
</div>
<!-- Latest Jobs / End -->
<script>
    var loginurl = "{LINK_LOGIN}?ref=index.php";
</script>
<!-- If address mode enable: ADDRESS FIELD JAVASCRIPT -->
<link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>

{OVERALL_FOOTER}