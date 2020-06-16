{OVERALL_HEADER}
    <div class="intro-banner" data-background-image="{SITE_URL}storage/banner/{BANNER_IMAGE}">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner-headline">
                        <h3><strong>{LANG_HOME_BANNER_HEADING}</strong>
                            <br>
                            <span>{LANG_HOME_BANNER_TAGLINE}</span></h3>
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
                                        <img src="{CATEGORY.picture}"/>
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
                                <input type="hidden" id="input-maincat" name="cat" value=""/>
                                <input type="hidden" id="input-subcat" name="subcat" value=""/>
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
    <div class="section margin-top-65">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section-headline centered margin-bottom-15">
                        <h3>{LANG_ALL_CATEGORIES}</h3>
                    </div>
                    <div class="categories-container">
                        {LOOP: CAT}
                        <a href="{CAT.catlink}" class="category-box">
                            <div class="category-box-icon margin-bottom-10">
                                IF("{CAT.picture}"==""){
                                <div class="category-icon"><i class="{CAT.icon}"></i></div>
                                {ELSE}
                                <div class="category-icon"><img src="{CAT.picture}"/></div>
                                {:IF}
                            </div>
                            <div class="category-box-counter">{CAT.main_ads_count}</div>
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
                    <div class="listings-container grid-layout margin-top-35">
                        {LOOP: ITEM}
                        <div class='job-listing IF("{ITEM.highlight}"=="1"){ highlight {:IF}'>
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo">
                                    <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                                </div>
                                <div class="job-listing-description">

                                    <h3 class="job-listing-title"><a href="{ITEM.link}">{ITEM.product_name}</a>
                                            IF("{ITEM.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                            IF("{ITEM.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                    </h3>
                                    <h5 class="job-listing-company"><a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a></h5>
                                    <h5 class="job-listing-company"><a href="{LINK_PROFILE}/{ITEM.username}"><i class="la la-user"></i> {ITEM.username}</a></h5>
                                </div>

                            </div>
                            <div class="job-listing-footer">
                                <ul>
                                  <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                                    IF("{ITEM.price}"!="0"){
                                    <li><i class="la la-credit-card"></i> {ITEM.price}</li>
                                    {:IF}
                                  <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
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
                    <div class="listings-container compact-list-layout margin-top-35">
                        {LOOP: ITEM2}
                        <div class="job-listing IF({ITEM2.highlight}){ highlight {:IF}">
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo">
                                    <img src="{SITE_URL}storage/products/{ITEM2.picture}" alt="{ITEM2.product_name}">
                                </div>
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title"><a  href="{ITEM2.link}">{ITEM2.product_name}</a>
                                        IF("{ITEM2.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                        IF("{ITEM2.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                    </h3>

                                    <div class="job-listing-footer">
                                        <ul>
                                            <li><a href="{LINK_PROFILE}/{ITEM2.username}"><i class="la la-user"></i> {ITEM2.username}</a></li>
                                            <li><a href="{ITEM2.citylink}"><i class="la la-map-marker"></i> {ITEM2.location}</a></li>
                                            IF("{ITEM2.price}"!="0"){
                                            <li><i class="la la-credit-card"></i> {ITEM2.price}</li>
                                            {:IF}
                                            <li><i class="la la-clock-o"></i> {ITEM2.created_at}</li>
                                        </ul>
                                    </div>
                                </div>
                                <span class="job-type"><a href="{ITEM2.catlink}">{ITEM2.category}</a></span>
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
