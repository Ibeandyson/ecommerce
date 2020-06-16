{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_REGISTER}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_REGISTER}</li>
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
                    <h3 style="font-size: 26px;">{LANG_LETS_CREATE_ACC}</h3>
                    <span>{LANG_ALREADY_HAVE_ACC} <a href="{LINK_LOGIN}">{LANG_LOGIN}</a></span>
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
                <form method="post" id="register-account-form" action="#" accept-charset="UTF-8">
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="{LANG_FULL_NAME}" value="{NAME_FIELD}" id="name" name="name" onBlur="checkAvailabilityName()" required/>
                        </div>
                        <span id="name-availability-status">IF("{NAME_ERROR}"!=""){ {NAME_ERROR} {:IF}</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="{LANG_USERNAME}" value="{USERNAME_FIELD}" id="Rusername" name="username" onBlur="checkAvailabilityUsername()" required/>
                        </div>
                        <span id="user-availability-status">IF("{USERNAME_ERROR}"!=""){ {USERNAME_ERROR} {:IF}</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-envelope"></i>
                            <input type="text" class="input-text with-border" placeholder="{LANG_EMAIL}" value="{EMAIL_FIELD}" name="email" id="email" onBlur="checkAvailabilityEmail()" required/>
                        </div>
                        <span id="email-availability-status">IF("{EMAIL_ERROR}"!=""){ {EMAIL_ERROR} {:IF}</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-unlock"></i>
                            <input type="password" class="input-text with-border" placeholder="{LANG_PASSWORD}" id="Rpassword" name="password" onBlur="checkAvailabilityPassword()" required/>
                        </div>
                        <span id="password-availability-status">IF("{PASSWORD_ERROR}"!=""){ {PASSWORD_ERROR} {:IF}</span>
                    </div>
                    <div class="form-group">
                        <div class="text-center">
                            IF("{RECAPTCHA_MODE}"=="1"){
                            <div style="display: inline-block;" class="g-recaptcha" data-sitekey="{RECAPTCHA_PUBLIC_KEY}"></div>
                            {:IF}
                        </div>
                        <span>IF("{RECAPTCH_ERROR}"!=""){ {RECAPTCH_ERROR} {:IF}</span>
                    </div>
                    <span class="text-center">{LANG_BY_CLICK_REGISTER} {LANG_TERM_CON}</span>
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" name="submit" type="submit">{LANG_REGISTER} <i class="icon-feather-arrow-right"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="margin-top-70"></div>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>

    var error = "";

    function checkAvailabilityName() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'name=' + $("#name").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#name").removeClass('has-success');
                    $("#name-availability-status").html(data);
                    $("#name").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#name").removeClass('has-error mar-zero');
                    $("#name-availability-status").html("");
                    $("#name").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityUsername() {
        var $item = $("#Rusername").closest('.form-group');
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'username=' + $("#Rusername").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $item.removeClass('has-success');
                    $("#user-availability-status").html(data);
                    $item.addClass('has-error');
                }
                else {
                    error = 0;
                    $item.removeClass('has-error');
                    $("#user-availability-status").html("");
                    $item.addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityEmail() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'email=' + $("#email").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#email").removeClass('has-success');
                    $("#email-availability-status").html(data);
                    $("#email").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#email").removeClass('has-error mar-zero');
                    $("#email-availability-status").html("");
                    $("#email").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityPassword() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'password=' + $("#Rpassword").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#Rpassword").removeClass('has-success');
                    $("#password-availability-status").html(data);
                    $("#Rpassword").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#Rpassword").removeClass('has-error mar-zero');
                    $("#password-availability-status").html("");
                    $("#Rpassword").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }

</script>
{OVERALL_FOOTER}
