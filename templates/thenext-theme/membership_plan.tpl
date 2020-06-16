{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_MEMBERSHIPPLAN}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_MEMBERSHIPPLAN}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <h3 class="page-title margin-bottom-30">{LANG_ALL_PLANS}</h3>
    <div class="row">
        <div class="col-xl-12">
            <div class="pricing-plans-container margin-bottom-50">
                {LOOP: SUB_TYPES}
                <!-- Plan -->
                <div class='pricing-plan IF("{SUB_TYPES.recommended}"=="yes"){ recommended {:IF}'>
                    <h3>{SUB_TYPES.title}</h3>
                    <div class="pricing-plan-label billed-monthly-label"><strong>{CURRENCY_SIGN}{SUB_TYPES.cost}</strong>/ {SUB_TYPES.term}</div>
                    <div class="pricing-plan-features">
                        <strong>{LANG_FEATURES_OF} {SUB_TYPES.title}</strong>
                        <ul>
                            <li>
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {LANG_AD_POST_LIMIT} : <span class="font-weight-bold">{SUB_TYPES.limit} </span>
                            </li>
                            <li>
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {LANG_AD_EXP_IN} : <span class="font-weight-bold">{SUB_TYPES.duration} </span> {LANG_DAYS}
                            </li>
                            <li>
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {LANG_FEATURED_FEE} <span class="font-weight-bold">{CURRENCY_SIGN}{SUB_TYPES.featured_fee} {LANG_FOR} {SUB_TYPES.featured_duration} {LANG_DAYS}</span>
                            </li>
                            <li>
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {LANG_URGENT_FEE} <span class="font-weight-bold">{CURRENCY_SIGN}{SUB_TYPES.urgent_fee} {LANG_FOR} {SUB_TYPES.urgent_duration} {LANG_DAYS}</span>
                            </li>
                            <li>
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {LANG_HIGHLIGHT_FEE} <span class="font-weight-bold">{CURRENCY_SIGN}{SUB_TYPES.highlight_fee} {LANG_FOR} {SUB_TYPES.highlight_duration} {LANG_DAYS}</span>
                            </li>

                            <li>
                                IF("{SUB_TYPES.top_search_result}"=="yes"){
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {:IF}
                                IF("{SUB_TYPES.top_search_result}"=="no"){
                                <span class="icon-text no"><i class="icon-feather-x-circle margin-right-2"></i></span>
                                {:IF}
                                {LANG_TOP_SEARCH_RESULT}</li>
                            <li>
                                IF("{SUB_TYPES.show_on_home}"=="yes"){
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {:IF}
                                IF("{SUB_TYPES.show_on_home}"=="no"){
                                <span class="icon-text no"><i class="icon-feather-x-circle margin-right-2"></i></span>
                                {:IF}
                                {LANG_SHOW_ON_HOME}</li>
                            <li>
                                IF("{SUB_TYPES.show_in_home_search}"=="yes"){
                                <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                {:IF}
                                IF("{SUB_TYPES.show_in_home_search}"=="no"){
                                <span class="icon-text no"><i class="icon-feather-x-circle margin-right-2"></i></span>
                                {:IF}
                                {LANG_SHOW_IN_HOME_SEARCH}</li>
                        </ul>
                    </div>
                    IF("{SUB_TYPES.Selected}"=="0"){
                    <form name="form1" method="post" action="">
                        <input class="signup cursor" name="upgrade" type="hidden" value="{SUB_TYPES.id}">
                        <button type="submit" class="button full-width margin-top-20" name="Submitup">{LANG_UPGRADE}</button>
                    </form>
                    {:IF}
                    IF("{SUB_TYPES.Selected}"=="1"){
                    <a href="#" class="button full-width margin-top-20">
                        {LANG_CURRENT_PLAN}
                    </a>
                    {:IF}
                </div>
                {/LOOP: SUB_TYPES}
            </div>
        </div>
    </div>
</div>
{OVERALL_FOOTER}
