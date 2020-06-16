{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_LOGIN}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_LOGIN}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xl-5 margin-0-auto">
            <div class="login-register-page">
                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h3>{LANG_WELCOME_BACK}</h3>
                    <span>{LANG_DONT_HAVE_ACCOUNT} <a href="{LINK_SIGNUP}">{LANG_SIGNUP_NOW}</a></span>
                </div>
                IF('{FACEBOOK_APP_ID}'!='' || '{GOOGLE_APP_ID}'!=''){
                <div class="social-login-buttons">
                     IF('{FACEBOOK_APP_ID}'!=''){
                    <button class="facebook-login ripple-effect" onclick="fblogin()"><i class="fa fa-facebook"></i> {LANG_LOGIN_VIA_FACEBOOK}
                    </button>
                    {:IF}

                     IF('{GOOGLE_APP_ID}'!=''){
                    <button class="google-login ripple-effect" onclick="gmlogin()"><i class="fa fa-google"></i> {LANG_LOGIN_VIA_GOOGLE}
                    </button>
                    {:IF}
                </div>
                <div class="social-login-separator"><span>{LANG_OR}</span></div>
                {:IF}
                <!-- Form -->
                IF("{ERROR}"!=""){
                <span class='status-not-available'>{ERROR}</span>
                {:IF}
                <form method="post">
                    <div class="input-with-icon-left">
                        <i class="la la-user"></i>
                        <input type="text" class="input-text with-border" name="username" id="username"
                        placeholder="{LANG_USERNAME} / {LANG_EMAIL}" required/>
                    </div>

                    <div class="input-with-icon-left">
                        <i class="la la-unlock"></i>
                        <input type="password" class="input-text with-border" name="password" id="password"
                        placeholder="{LANG_PASSWORD}" required/>
                    </div>
                    <a href="{LINK_LOGIN}?fstart=1" class="forgot-password">{LANG_FORGOTPASS}</a>
                    <input type="hidden" name="ref" value="{REF}"/>
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" name="submit" type="submit">{LANG_LOGIN} <i class="icon-feather-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="margin-top-70"></div>
    {OVERALL_FOOTER}
