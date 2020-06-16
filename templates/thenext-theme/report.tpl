{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_REPORTVIO}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_REPORTVIO}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container margin-bottom-50">
    <div class="row"><!-- user-login -->
        <div class="col-xl-8 margin-0-auto">
            <div class="user-account clearfix">
                <h2 class="margin-bottom-50">{LANG_REPORTVIO}</h2>
                <form action="#" method="post">
                    <div class="submit-field">
                      <h5>{LANG_YNAME}</h5>
                      <input class="with-border" type="text" name="name" value="{NAME}">
                      IF("{NAME_ERROR}"!=""){ <span style="color: red">{NAME_ERROR}</span>{:IF}
                    </div>
                    <div class="submit-field">
                      <h5>{LANG_YEMAIL}</h5>
                      <input class="with-border" type="email" name="email" value="{EMAIL}">
                      IF("{EMAIL_ERROR}"!=""){ <span style="color: red">{EMAIL_ERROR}</span>{:IF}
                    </div>
                    <div class="submit-field">
                      <h5>{LANG_YUSERNAME}</h5>
                      <input class="with-border" type="text" name="username" value="{USERNAME}">
                    </div>
                    <div class="submit-field">
                        <h5>{LANG_VIOLATION} {LANG_TYPE}</h5>
                        <select name="violation" class="selectpicker with-border">
                            <option>{LANG_SELECT} {LANG_VIOLATION} {LANG_TYPE}</option>
                            <option value="{LANG_POSTCONTACT}">{LANG_POSTCONTACT}</option>
                            <option value="{LANG_ADVWEBSITE}">{LANG_ADVWEBSITE}</option>
                            <option value="{LANG_FAKEPROJ}">{LANG_FAKEPROJ}</option>
                            <option value="{LANG_ABNORMALBID}">{LANG_ABNORMALBID}</option>
                            <option value="{LANG_OTHER}">{LANG_OTHER}</option>
                        </select>
                    </div>
                    <div class="submit-field">
                      <h5>{LANG_USEROTHER}</h5>
                      <input class="with-border" type="text" name="username2" value="{USERNAME2}">
                    </div>
                    <div class="submit-field">
                      <h5>{LANG_URLVIOLATION}</h5>
                      <input class="with-border" type="text" name="url" value="{REDIRECT_URL}">
                    </div>
                    <div class="submit-field">
                      <h5>{LANG_VIODETAILS}</h5>
                      <textarea class="with-border" name="details">{DETAILS}</textarea>
                      IF("{VIOL_ERROR}"!=""){ <span style="color: red">{VIOL_ERROR}</span>{:IF}
                    </div>
                    <button type="submit" name="Submit" id="submit" class="button">{LANG_REPORTVIO}</button>
                </form>
                <!-- checkbox -->
            </div>
        </div>
        <!-- user-login -->
    </div>
    <!-- row -->
</div>
{OVERALL_FOOTER}
