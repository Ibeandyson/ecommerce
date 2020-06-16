{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_FORGOTPASS}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_FORGOTPASS}</li>
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
                    <h3>{LANG_FORGOTPASS}</h3>
                </div>
                IF("{SUCCESS}"!=""){
                    <span class="status-available">
                        <big>{LANG_CONFIRMATION_MAIL_SENT}</big><br>
                        {SUCCESS}
                    </span>
                {:IF}
                IF("{LOGIN_ERROR}"!=""){
                <span class='status-not-available'>{LOGIN_ERROR}</span>
                {:IF}
                <form method="post">
                    <div class="input-with-icon-left">
                        <i class="la la-envelope"></i>
                        <input type="email" class="input-text with-border" name="email" id="email"
                        placeholder="{LANG_EMAIL}" required/>
                    </div>
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" name="submit" type="submit">{LANG_REQ_PASS} <i class="icon-feather-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="margin-top-70"></div>
    {OVERALL_FOOTER}
