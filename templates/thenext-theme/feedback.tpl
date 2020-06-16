{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_FEEDBACK}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_FEEDBACK}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
    <div class="container margin-bottom-50">
        <div class="row">
            <div class="col-xl-8 margin-0-auto">
                <h2 class="margin-bottom-20">{LANG_WHAT_YOU_THINK}</h2>
                <div class="feed-back-form">
                    <form method="post">
                        <div class="submit-field">
                        <h5>{LANG_USER_DETAILS}</h5>
                        <input type="text" class="with-border" name="name" placeholder="{LANG_FULL_NAME}" required="">
                        <input type="text" class="with-border" name="email" placeholder="{LANG_EMAIL}" required="">
                        <input type="text" class="with-border" name="phone" placeholder="{LANG_PHONE_NO}">
                        <input type="text" class="with-border" name="subject" placeholder="{LANG_SUBJECT}" required="">
                        </div>
                        <div class="submit-field">
                        <h5>{LANG_ANYTHING_TO_TELL}</h5>
                        <textarea type="text" class="with-border" name="message" placeholder="{LANG_MESSAGE}..." required=""></textarea>
                        </div>
                        <div class="submit-field">
                            IF("{RECAPTCHA_MODE}"=="1"){
                            <div class="g-recaptcha" data-sitekey="{RECAPTCHA_PUBLIC_KEY}"></div>
                            {:IF}

                            <span style="color:red;font-size: 14px">IF("{RECAPTCH_ERROR}"!=""){ {RECAPTCH_ERROR} {:IF}</span>
                        </div>

                        <input type="submit" name="Submit" class="button" value="{LANG_SUBMIT}">
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- main -->
<script src='https://www.google.com/recaptcha/api.js'></script>
{OVERALL_FOOTER}
