{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_RESUBMITED_ADS}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_RESUBMITED_ADS}</li>
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
                                        <li><a href="{LINK_FAVADS}"><i class="icon-feather-heart"></i> {LANG_FAVOURITE_ADS} <span class="nav-tag">{FAVORITEADS}</span></a></li>

                                        <li><a href="{LINK_PENDINGADS}"><i class="icon-feather-clock"></i> {LANG_PENDING_ADS} <span class="nav-tag">{PENDINGADS}</span></a></li>
                                        <li><a href="{LINK_HIDDENADS}"><i class="icon-feather-eye-off"></i> {LANG_HIDDEN_ADS} <span class="nav-tag">{HIDDENADS}</span></a></li>
                                        <li><a href="{LINK_EXPIREADS}"><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRE_ADS} <span class="nav-tag">{EXPIREADS}</span></a></li>
                                        <li class="active"><a href="{LINK_RESUBMITADS}"><i class="icon-feather-rotate-cw"></i> {LANG_RESUBMITED_ADS} <span class="nav-tag">{RESUBMITADS}</span></a></li>
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
                        <h3><i class="icon-feather-rotate-cw"></i> {LANG_RESUBMITED_ADS}</h3>
                    </div>
                    <div class="content with-padding">
                        <div class="table-responsive">
                            <table id="js-table-list" class="basic-table dashboard-box-list">
                                <tr>
                                    <th class="big-width">{LANG_ADS}</th>
                                    <th class="small-width">{LANG_STATUS}</th>
                                    <th class="small-width">{LANG_ACTIONS}</th>
                                </tr>
                                IF({TOTALITEM}){
                                {LOOP: ITEM}
                                <tr class="ajax-item-listing" data-item-id="{ITEM.id}">
                                    <td>
                                        <div class="job-listing">
                                            <div class="job-listing-details">
                                                <div class="job-listing-description">
                                                    <div class="job-listing-company-logo company-logo-myads">
                                                        <img src="{SITE_URL}storage/products/{ITEM.picture}" alt="{ITEM.product_name}">
                                                    </div>
                                                    <div>
                                                        <h3 class="job-listing-title margin-bottom-5">
                                                            <a href="{ITEM.link}">{ITEM.product_name}</a>
                                                            <label class="label-wrap hidden-sm hidden-xs margin-zero d-inline-block">
                                                                IF("{ITEM.featured}"=="1"){ <span class="badge blue"> {LANG_FEATURED}</span> {:IF}
                                                                IF("{ITEM.urgent}"=="1"){ <span class="badge yellow"> {LANG_URGENT}</span> {:IF}
                                                                IF("{ITEM.highlight}"=="1"){ <span class="badge red"> {LANG_HIGHLIGHT}</span> {:IF}
                                                            </label>
                                                        </h3>
                                                        <ol class="breadcrumb">
                                                            <li><a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a></li>
                                                            <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a></li>
                                                        </ol>
                                                        <div class="job-listing-footer font-14">
                                                            <ul>
                                                                <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                                                            </ul>
                                                            IF("{ITEM.price}"!="0"){
                                                            <span class="table-property-price">{ITEM.price}</span>
                                                            {:IF}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                       <span class="badge blue">{LANG_RESUBMITED}</span>
                                    </td>
                                    <td>
                                        <a href="#" data-ajax-action="deleteResumitAd" class="button gray ripple-effect ico item-js-delete" data-tippy-placement="top" title="{LANG_DELETE}"><i class="icon-feather-trash-2"></i></a>
                                    </td>
                                </tr>
                                {/LOOP: ITEM}
                                {ELSE}
                                <tr>
                                    <td colspan="3" class="text-center">{LANG_NO_RESUBMISSION_JOB}</td>
                                </tr>
                                {:IF}
                            </table>
                        </div>
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
</div>
{OVERALL_FOOTER}
