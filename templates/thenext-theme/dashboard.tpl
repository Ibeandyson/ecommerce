{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_DASHBOARD}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_DASHBOARD}</li>
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
                            <a href="#" class="dashboard-responsive-nav-trigger">
                                <span class="hamburger hamburger--collapse" >
                                    <span class="hamburger-box"><span class="hamburger-inner"></span></span>
                                </span>
                                <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                            </a>
                            <div class="dashboard-nav">
                                <div class="dashboard-nav-inner">
                                    <ul data-submenu-title="{LANG_MY_CLASSIFIED}">
                                        <li class="active"><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                                        <li><a href="{LINK_PROFILE}/{USERNAME}"><i class="icon-feather-user"></i> {LANG_PROFILE_PUBLIC}</a></li>
                                        <li><a href="{LINK_MEMBERSHIP}"><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}</a></li>
                                    </ul>

                                    <ul data-submenu-title="{LANG_MY_ADS}">
                                        <li><a href="{LINK_MYADS}"><i class="icon-feather-briefcase"></i> {LANG_MY_ADS} <span class="nav-tag">{MYADS}</span></a></li>
                                        <li><a href="{LINK_FAVADS}"><i class="icon-feather-heart"></i> {LANG_FAVOURITE_ADS} <span class="nav-tag">{FAVORITEADS}</span></a></li>

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
                    <div class="content with-padding">
                        <div class="row dashboard-profile">
                            <div class="col-xl-6 col-md-6 col-sm-12">
                                <div class="user-img"><img src="{SITE_URL}storage/profile/small_{AUTHORIMG}" alt="{AUTHORNAME}" class="img-responsive"></div>
                                <div>
                                    <h2>{AUTHORNAME}
                                        IF("{SUB_IMAGE}"!=""){
                                        <img src="{SUB_IMAGE}" alt="{SUB_TITLE}" title="{SUB_TITLE}" width="28px"/>
                                        {:IF}
                                    </h2>
                                    <span><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}  :
                                        IF("{SUB_TITLE}"!=""){
                                            {SUB_TITLE}
                                        {ELSE}
                                            {LANG_FREE}
                                        {:IF}
                                    </span><br>
                                    <small>{LANG_JOIN_DATE}: {JOIN_DATE}</small>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-sm-12 text-right">
                                <span class="dashboard-badge"><strong>{FAVORITEADS}</strong><i class="icon-feather-heart"></i> {LANG_FAVOURITES}</span>
                                <span class="dashboard-badge"><strong>{MYADS}</strong><i class="icon-feather-briefcase"></i> {LANG_MY_ADS}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <form method="post" accept-charset="UTF-8" enctype="multipart/form-data">
                    <div class="dashboard-box">
                        <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-user"></i> {LANG_MY_DETAILS}</h3>
                        </div>
                        <div class="content with-padding">
                            <div class="row">
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_NAME} *</h5>
                                        <div class="input-with-icon-left">
                                            <i class="la la-user"></i>
                                            <input type="text" class="with-border" name="name" value="{AUTHORNAME}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_PHONE_NO}</h5>
                                        <div class="input-with-icon-left">
                                            <i class="flag-image"><img src="{SITE_URL}templates/{TPL_NAME}/images/flags/us.png"></i>
                                            <input type="text" name="phone" class="with-border margin-bottom-0" value="{PHONE}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_ADDRESS}</h5>
                                        <div class="input-with-icon-left">
                                            <i class="la la-user"></i>
                                            <input type="text" class="with-border" name="address" value="{ADDRESS}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_COUNTRY}</h5>
                                        <select name="country" class="multiselect2">
                                            {LOOP: COUNTRY}
                                                <option value="{COUNTRY.asciiname}" IF("{COUNTRY}"=="{COUNTRY.asciiname}"){ selected {:IF}>{COUNTRY.asciiname}</option>
                                            {/LOOP: COUNTRY}
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_WEBSITE}</h5>
                                        <div class="input-with-icon-left">
                                            <i class="la la-user"></i>
                                            <input type="text" class="with-border" name="website" value="{WEBSITE}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_ABOUT_ME}</h5>
                                        <textarea class="with-border" id="pageContent" rows="2" name="content">{AUTHORABOUT}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_AVATAR}</h5>
                                        <div class="BrowseButton">
                                            <input class="BrowseButton-input" type="file" accept="image/*" id="upload" name="avatar"/>
                                            <label class="BrowseButton-button ripple-effect" for="upload">{LANG_CHOOSE_FILE}</label>
                                            <span class="BrowseButton-file-name">{LANG_LOGO_HINT}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="dashboard-box">
                        <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-lock"></i> {LANG_SOCIAL_NETWORKS}</h3>
                        </div>

                        <div class="content with-padding">
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Facebook</h5>
                                        <input type="text" name="facebook" class="with-border" value="{FACEBOOK}">
                                    </div>
                                </div>

                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Twitter</h5>
                                        <input type="text" name="twitter" class="with-border" value="{TWITTER}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Google+</h5>
                                        <input type="text" name="googleplus" class="with-border" value="{GOOGLEPLUS}">
                                    </div>
                                </div>

                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Instagram</h5>
                                        <input type="text" name="instagram" class="with-border" value="{INSTAGRAM}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Linked In</h5>
                                        <input type="text" name="linkedin" class="with-border" value="{LINKEDIN}">
                                    </div>
                                </div>

                                <div class="col-xl-6">
                                    <div class="submit-field">
                                        <h5>Youtube</h5>
                                        <input type="text" name="youtube" class="with-border" value="{YOUTUBE}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-box">
                        <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-lock"></i> {LANG_NEWSLETTER}</h3>
                        </div>

                        <div class="content with-padding">
                            <div class="row">
                                <div class="col-xl-6 subscribe-category">
                                    <div class="checkbox">
                                        <input type="checkbox" name="notify" id="notify" value="1" onchange="NotifyValueChanged()" IF("{NOTIFY}"=="1"){ checked {:IF}>
                                        <label for="notify"><span class="checkbox-icon"></span> {LANG_NOTIFYEMAIL}</label>
                                    </div>
                                    <div class="skills" style="margin: 0 25px">
                                        {LOOP: CATEGORY}
                                            <div class="checkbox d-block">
                                                <input type="checkbox" name="choice[{CATEGORY.id}]" id="{CATEGORY.id}" value="{CATEGORY.id}" {CATEGORY.selected}>
                                                <label for="{CATEGORY.id}"><span class="checkbox-icon"></span> {CATEGORY.name}</label>
                                            </div>
                                        {/LOOP: CATEGORY}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="padding-30">
                        <button type="submit" name="submit" class="button ripple-effect">{LANG_UPDATE}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- CRUD FORM CONTENT - crud_fields_scripts stack -->
<link media="all" rel="stylesheet" type="text/css" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/styles/simditor.css" />
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/mobilecheck.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/module.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/uploader.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/hotkeys.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/simditor.js"></script>
<script>
    (function() {
        $(function() {
            var $preview, editor, mobileToolbar, toolbar, allowedTags;
            Simditor.locale = 'en-US';
            toolbar = ['bold','italic','underline','|','ol','ul','blockquote','table','link'];
            mobileToolbar = ["bold", "italic", "underline", "ul", "ol"];
            if (mobilecheck()) {
                toolbar = mobileToolbar;
            }
            allowedTags = ['br','span','a','img','b','strong','i','strike','u','font','p','ul','ol','li','blockquote','pre','h1','h2','h3','h4','hr','table'];
            editor = new Simditor({
                textarea: $('#pageContent'),
                placeholder: '',
                toolbar: toolbar,
                pasteImage: false,
                defaultImage: '{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/images/image.png',
                upload: false,
                allowedTags: allowedTags
            });
            $preview = $('#preview');
            if ($preview.length > 0) {
                return editor.on('valuechanged', function(e) {
                    return $preview.html(editor.getValue());
                });
            }
        });
    }).call(this);
</script>

<script type="text/javascript">
    function NotifyValueChanged()
    {
        if($('#notify').is(":checked"))
            $(".skills").show();
        else
            $(".skills").hide();
    }
    NotifyValueChanged();
</script>
{OVERALL_FOOTER}
