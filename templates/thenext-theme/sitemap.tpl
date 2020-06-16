{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_SITE_MAP}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_SITE_MAP}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
    <div class="container margin-bottom-50">
        <div class="section">
            <h2 class="text-center sitemap-h2">{LANG_LIST_CAT_SUBCAT}</h2>
            <hr>
            <div class="row cg-nav-wrapper cg-nav-wrapper-row-2" data-role="cg-nav-wrapper">
                {LOOP: CAT}
                <div style="">
                    <div class="anchor-wrap anchor{CAT.main_id}-wrap" data-role="anchor{CAT.main_id}">
                        <a class="anchor{CAT.main_id} jumper" data-role="cont" href="#anchor{CAT.main_id}">
                            <i class="caticon {CAT.icon}"></i>
                        <span class="desc">
                            {CAT.main_title}
                        </span>
                        </a>
                    </div>
                </div>
                {/LOOP: CAT}
            </div>
            <div class="cg-main">
                {LOOP: SUBCAT}
                <div class="item clearfix" data-spm="0">
                    <h3 class="big-title anchor{SUBCAT.main_id} anchor-agricuture" data-role="anchor{SUBCAT.main_id}-scroll">
                        <span id="anchor{SUBCAT.main_id}" class="anchor-subsitution"></span>
                        <i class="cg-icon {SUBCAT.icon}"></i>{SUBCAT.main_title}
                    </h3>
                    <div class="sub-item-wrapper clearfix">
                        <div class="sub-item">
                            <h4 class="sub-title">
                                <a href="{SUBCAT.catlink}">{SUBCAT.main_title}</a><span> ({SUBCAT.main_ads_count})</span>
                            </h4>
                            <div class="sub-item-cont-wrapper">
                                <ul class="sub-item-cont clearfix">
                                    {SUBCAT.sub_title}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                {/LOOP: SUBCAT}
            </div>

        </div>
    </div>
<script>
    $(document).ready(function() {
        $(".jumper").on("click", function( e ) {

            e.preventDefault();

            $("body, html").animate({
                scrollTop: $( $(this).attr('href') ).offset().top
            }, 600);

        });
    });
</script>
{OVERALL_FOOTER}
