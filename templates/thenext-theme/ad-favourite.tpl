{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_FAVOURITE_ADS}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_FAVOURITE_ADS}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="section gray padding-bottom-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12">
                <div class="dashboard-sidebar">
                    <div class="dashboard-sidebar-inner">
                        <div class="dashboard-nav-container">
                            <!-- Responsive Navigation Trigger -->
                            <a href="#" class="dashboard-responsive-nav-trigger">
                                <span class="hamburger hamburger--collapse" >
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </span>
                                <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                            </a>

                            <div class="dashboard-nav">
                                <div class="dashboard-nav-inner">
                                    <ul data-submenu-title="{LANG_MY_CLASSIFIED}">
                                        <li><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                                        <li><a href="{LINK_PROFILE}/{USERNAME}"><i class="icon-feather-user"></i> {LANG_PROFILE_PUBLIC}</a></li>
                                        <li><a href="{LINK_MEMBERSHIP}"><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}</a></li>
                                    </ul>

                                    <ul data-submenu-title="{LANG_MY_ADS}">
                                        <li><a href="{LINK_MYADS}"><i class="icon-feather-briefcase"></i> {LANG_MY_ADS} <span class="nav-tag">{MYADS}</span></a></li>
                                        <li class="active"><a href="{LINK_FAVADS}"><i class="icon-feather-heart"></i> {LANG_FAVOURITE_ADS} <span class="nav-tag">{FAVORITEADS}</span></a></li>

                                        <li><a href="{LINK_PENDINGADS}"><i class="icon-feather-clock"></i> {LANG_PENDING_ADS} <span class="nav-tag">{PENDINGADS}</span></a></li>
                                        <li><a href="{LINK_HIDDENADS}"><i class="icon-feather-eye-off"></i> {LANG_HIDDEN_ADS} <span class="nav-tag">{HIDDENADS}</span></a></li>
                                        <li><a href="{LINK_EXPIREADS}"><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRE_ADS} <span class="nav-tag">{EXPIREADS}</span></a></li>
                                        <li><a href="{LINK_RESUBMITADS}"><i class="icon-feather-rotate-cw"></i> {LANG_RESUBMITED_ADS} <span class="nav-tag">{RESUBMITADS}</span></a></li>
                                    </ul>

                                    <ul data-submenu-title="{LANG_MY_ACCOUNT}">
                                        <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                        <li><a href="{LINK_TRANSACTION}"><i class="icon-feather-file-text"></i> {LANG_TRANSACTION}</a></li>
                                        <li><a href="{LINK_ACCOUNT_SETTING}"><i class="icon-feather-settings"></i> {LANG_ACCOUNT_SETTING}</a></li>
                                        <li><a href="{LINK_LOGOUT}"><i class="icon-feather-log-out"></i> {LANG_LOGOUT}</a></li>
                                    </ul>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-12">
            <div class="dashboard-box margin-top-0">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-heart"></i> {LANG_FAVOURITE_ADS}</h3>
                </div>
                IF(!{TOTALITEM}){
                <div class="content with-padding text-center">
                    {LANG_NO_FAV_JOB}
                </div>
                {:IF}
            </div>
            <div class="listings-container margin-top-30">
                {LOOP: ITEM}
                <div class="job-listing fav-listing">
                    <div class="job-listing-details">
                        <div class="job-listing-company-logo">
                            <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                        </div>
                        <div class="job-listing-description">
                            <h4 class="job-listing-company">
                                <a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a>
                                -
                                <a href="{ITEM.subcatlink}">{ITEM.sub_category}</a>
                            </h4>
                            <h3 class="job-listing-title"><a href="{ITEM.link}">{ITEM.product_name}</a></h3>
                            <p class="job-listing-text">{ITEM.desc}</p>
                        </div>
                        <!-- <span class="job-type"><a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a></span> -->
                    </div>
                    <div class="job-listing-footer with-icon">
                        <ul>
                            <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                            IF("{ITEM.price}"!="0"){
                            <li><i class="la la-credit-card"></i> {ITEM.price}</li>
                            {:IF}
                            <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                        </ul>
                        <span class="fav-icon added set-item-fav" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="removeFavAd"></span>
                    </div>
                </div>
                {/LOOP: ITEM}

                <!-- Pagination -->
                <div class="clearfix"></div>
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
            </div>
        </div>
    </div>
</div>
</div>
{OVERALL_FOOTER}
