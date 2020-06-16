{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_FAQ}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_FAQ}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
    <div class="container">
        <div class="margin-bottom-50">
            {LOOP: FAQ}
            <dl class="faq-list">
                <dt class="faq-list_h">
                    <h4 class="marker">Q?</h4>
                    <h5 class="marker_head">{FAQ.title}</h5>
                </dt>
                <dd>
                    <h4 class="marker1">A.</h4>
                    <div class="m_13"> {FAQ.content}</div>
                </dd>
            </dl>
            {/LOOP: FAQ}
        </div>
        <!-- faq-page -->
    </div>
{OVERALL_FOOTER}
