{OVERALL_HEADER}
<form method="get" action="{LINK_LISTING}" name="locationForm" id="ListingForm">
    <div id="titlebar">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>{LANG_WE_FOUND} {ADSFOUND} {LANG_ADS_LISTINGS}</h2>
                    <!-- Breadcrumbs -->
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                            IF("{MAINCATEGORY}"!=""){ 
                                <li>{MAINCATEGORY}</li>
                            {:IF}
                            IF("{SUBCATEGORY}"!=""){ 
                                <li>{SUBCATEGORY}</li>
                            {:IF}
                            IF("{MAINCATEGORY}{SUBCATEGORY}"==""){ 
                                <li>{LANG_ALL_CATEGORIES}</li>
                            {:IF}
                        </ul>
                    </nav>
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
                            <input id="keywords" type="text" name="keywords" placeholder="{LANG_WHAT} ?" value="{KEYWORDS}">
                        </div>
                        <div class="intro-search-field with-autocomplete live-location-search">
                            <div class="input-with-icon">
                                <input type="text" id="searchStateCity" name="location" placeholder="{LANG_WHERE}">
                                <i class="la la-map-marker"></i>
                                <div data-option="{AUTO_DETECT_LOCATION}" class="loc-tracking"><i class="fa fa-crosshairs"></i></div>
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
                    <div class="hide-under-768px margin-top-20">
                        <ul class="categories-list">
                            {LOOP: SUBCATLIST}
                            <li>
                                <a href="{SUBCATLIST.link}">{SUBCATLIST.name} <span class="count">({SUBCATLIST.adcount})</span></a>
                            </li>
                            {/LOOP: SUBCATLIST}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4">
                <div class="filter-button-container">
                    <button type="button" class="enable-filters-button">
                        <i class="enable-filters-button-icon"></i>
                        <span class="show-text">{LANG_ADVANCE_SEARCH}</span>
                        <span class="hide-text">{LANG_ADVANCE_SEARCH}</span>
                    </button>
                </div>
                <div class="sidebar-container search-sidebar">
                    {LOOP: CUSTOMFIELDS}
                        IF("{CUSTOMFIELDS.type}"=="text-field"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.textbox}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="textarea"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.textarea}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="drop-down"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            <select class="selectpicker with-border" name="custom[{CUSTOMFIELDS.id}]">
                                <option value="" selected>{LANG_SELECT} {CUSTOMFIELDS.title}</option>
                                {CUSTOMFIELDS.selectbox}
                            </select>
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="radio-buttons"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.radio}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="checkboxes"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.thenextThemeCheckbox}
                        </div>
                    {:IF}
                    {/LOOP: CUSTOMFIELDS}
                    <div class="sidebar-widget">
                        <h3>{LANG_PRICE}</h3>
                        <div class="range-widget">
                            <div class="range-inputs">
                                <input type="text" placeholder="From" name="range1" value="{RANGE1}">
                                <input type="text" placeholder="To" name="range2" value="{RANGE2}">
                            </div>
                            <button type="submit" class="button"><i class="icon-feather-arrow-right"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8">

                <h3 class="page-title">{LANG_SEARCH_RESULTS}</h3>

                <div class="notify-box margin-top-15">
                   <span class="font-weight-600">{ADSFOUND} {LANG_ADS_FOUND}</span>

                    <div class="sort-by">
                        <span>{LANG_SORT_BY}</span>
                        <select class="selectpicker hide-tick" id="sort-filter">
                            <option data-filter-type="sort" data-filter-val="id" data-order="desc">{LANG_NEWEST}</option>
                            <option data-filter-type="sort" data-filter-val="title" data-order="desc">{LANG_NAME}</option>
                            <option data-filter-type="sort" data-filter-val="date" data-order="desc">{LANG_DATE}</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="desc">{LANG_PRICE} ({LANG_HIGH_TO_LOW})</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="asc">{LANG_PRICE} ({LANG_LOW_TO_HIGH})</option>
                        </select>
                    </div>
                </div>

                <div class="listings-container margin-top-35">
                    {LOOP: ITEM}
                    <div class="job-listing IF({ITEM.highlight}){ highlight {:IF}">
                        <div class="job-listing-details">
                            <div class="job-listing-company-logo">
                                <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                            </div>
                            <div class="job-listing-description">
                                <h3 class="job-listing-title"><a href="{ITEM.link}">{ITEM.product_name}</a>
                                    IF("{ITEM.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                    IF("{ITEM.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                </h3>
                                <ol class="breadcrumb">
                                    <li><a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a></li>
                                    <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a></li>
                                </ol>
                                <p class="job-listing-text">{ITEM.desc}</p>
                            </div>
                        </div>
                        <div class="job-listing-footer with-icon">
                            <ul>
                                <li><a href="{LINK_PROFILE}/{ITEM.username}"><i class="la la-user"></i> {ITEM.username}</a></li>
                                <li><a href="{ITEM.citylink}"><i class="la la-map-marker"></i> {ITEM.city}, {ITEM.state}</a></li>
                                IF("{ITEM.price}"!="0"){
                                <li><i class="la la-credit-card"></i> {ITEM.price}</li>
                                {:IF}
                                <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                            </ul>
                            <span class="fav-icon set-item-fav IF('{ITEM.favorite}'){ added {:IF}" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="setFavAd"></span>
                        </div>
                    </div>
                    {/LOOP: ITEM}
                    <div class="clearfix"></div>
                    IF("{ADSFOUND}"!="0"){
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Pagination -->
                            <div class="pagination-container margin-top-20 margin-bottom-60">
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
