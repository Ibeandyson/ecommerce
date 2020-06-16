{OVERALL_HEADER}
<link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/responsive.dataTables.min.css">
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Transactions</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>Transactions</li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <h3 class="page-title margin-bottom-30">All Transactions</h3>
    <table id="datatable">
        <thead>
            <tr>
                <th class="small-width"></th>
                <th>Job Title</th>
                <th class="small-width">Amount</th>
                <th class="small-width">Premium</th>
                <th>Payment Method</th>
                <th>Date</th>
                <th class="small-width">Status</th>
            </tr>
        </thead>
        IF("{T_BLANK}"=="0"){
        <tbody>
        <tr>
            <td colspan="7" class="text-center">{LANG_NO_RESULT_FOUND}</td>
        </tr>
        </tbody>
        {ELSE}
        <tbody>
            {LOOP: TRANSACTIONS}
            <tr>
                <td></td>
                <td><a href="{TRANSACTIONS.product_link}" target="_blank">{TRANSACTIONS.product_name}</a></td>
                <td>
                    IF("{CURRENCY_POS}"=="BEF"){ {CURRENCY_SIGN} {:IF}
                    {TRANSACTIONS.amount}
                    IF("{CURRENCY_POS}"=="AFT"){ {CURRENCY_SIGN} {:IF}
                </td>
                <td>{TRANSACTIONS.premium}</td>
                <td>{TRANSACTIONS.payment_by}</td>
                <td>{TRANSACTIONS.time}</td>
                <td>{TRANSACTIONS.status}</td>
            </tr>
            {/LOOP: TRANSACTIONS}
        </tbody>
        {:IF}
    </table>
    <div class="margin-bottom-50"></div>
</div>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.dataTables.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/dataTables.responsive.min.js"></script>
<script>
    
    $(document).ready(function () {
        $('#datatable').DataTable({
            responsive: {
                details: {
                    type: 'column'
                }
            },
            "language": {
                "paginate": {
                    "previous": "{LANG_PREVIOUS}",
                    "next": "{LANG_NEXT}"
                },
                "search": "{LANG_SEARCH}",
                "lengthMenu": "{LANG_DISPLAY} _MENU_",
                "zeroRecords": "{LANG_NO_RESULT_FOUND}",
                "info": "{LANG_PAGE} _PAGE_ - _PAGES_",
                "infoEmpty": "{LANG_NO_RESULT_FOUND}",
                "infoFiltered": "( {LANG_TOTAL_RECORD} _MAX_)"
            },
            columnDefs: [{
                className: 'control',
                orderable: false,
                targets: 0
            }]
        });
    });

</script>
{OVERALL_FOOTER}
