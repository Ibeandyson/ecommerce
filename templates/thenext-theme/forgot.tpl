{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_CHANGE_PASS}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_CHANGE_PASS}</li>
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
                    <h3>{LANG_CHANGE_PASS}</h3>
                </div>

                IF("{FORGOT_ERROR}"!=""){
                <span class='status-not-available'>{FORGOT_ERROR}</span>
                {:IF}
                <form method="post">
                    <span class="status-available">
                        <strong>{LANG_USERNAME} : </strong> {USERNAME}
                    </span>
                    <div class="input-with-icon-left">
                        <i class="la la-unlock"></i>
                        <input type="password" class="input-text with-border" name="password" id="password"
                        placeholder="{LANG_PASSWORD}" required/>
                    </div>
                    <div class="input-with-icon-left">
                        <i class="la la-unlock"></i>
                        <input type="password" class="input-text with-border" name="password2" id="password2"
                        placeholder="{LANG_CONPASS}" required/>
                    </div>
                    <input type="hidden" name="forgot" id="forgot" value="{FIELD_FORGOT}">
                    <input type="hidden" name="r" id="r" value="{FIELD_R}">
                    <input type="hidden" name="e" id="e" value="{FIELD_E}">
                    <input type="hidden" name="t" id="t" value="{FIELD_T}">
                    <input type="hidden" name="type" id="type" value="{FIELD_TYPE}">
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" name="submit" type="submit">{LANG_CHANGE_PASS} <i class="icon-feather-arrow-right"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="margin-top-70"></div>
{OVERALL_FOOTER}
