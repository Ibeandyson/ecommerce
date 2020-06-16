$(document).ready(function () {
    // -------------------------------------------------------------
    //  prepare the form when the DOM is ready
    // -------------------------------------------------------------
    $('#submit_job_button').on('click', function (e) {
        e.stopPropagation();
        e.preventDefault();
        post_advertise();
    });
});
var payment_uri = '';

function post_advertise() {
    $('#submit_job_button').addClass('button-progress').prop('disabled', true);

    // submit the form
    $('#post_job_form').ajaxSubmit(function (data) {
        data = JSON.parse(data);

        if (data.status == "error") {
            if (data["errors"].length > 0) {
                for (var i = 0; i < data["errors"].length; i++) {
                    var $message = data["errors"][i]["message"];
                    if (i == 0) {
                        $('#post_error').html('<span class="status-not-available">! ' + $message + '</span>');
                    } else {
                        $('#post_error .status-not-available').append('<br>! ' + $message);
                    }
                }
                $('html, body').animate({
                    scrollTop: $("#post_error").offset().top
                }, 2000);
            }
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);
        }
        else if (data.status == "success") {
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);
            $('#post_ad_email_exist').fadeOut();
            $('#post_job_form').fadeOut();
            $('.payment-confirmation-page').fadeIn();
            var delay = 2000;
            setTimeout(function () {
                window.location = data.redirect;
            }, delay);
        }
        else if (data.status == "email-exist") {
            $('#email_exists_user').hide();
            $('#email_exists_login').show();

            $('#post_ad_email_exist #quickad_email_already_linked').html(data.errors);
            $('#post_ad_email_exist #quickad_username_display').html(data.username);
            $('#post_ad_email_exist #quickad_email_display').html(data.email);
            $('#post_ad_email_exist #username').val(data.username);
            $('#post_ad_email_exist #email').val(data.email);

            $('#post_ad_email_exist').fadeIn();
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);
        }

    });
    // return false to prevent normal browser submit and page navigation
    return false;
}

$('#post_ad_email_exist .mfp-close, #post_ad_email_exist #change-email').on('click', function (e) {
    $('#post_ad_email_exist').fadeOut();
});

$("#post_ad_email_exist #link_account").on('click', function (event) {
    $('#link_account').addClass('button-progress').prop('disabled', true);
    var action = "ajaxlogin";
    var $formData = {
        action: action,
        username: $("#username").val(),
        password: $("#password").val(),
        is_ajax: 1
    };

    $.ajax({
        type: "POST",
        url: ajaxurl,
        data: $formData,
        success: function (response) {
            if (response == "success") {
                $('#post_ad_email_exist #email_exists_success').fadeIn();
                $('#post_ad_email_exist #email_exists_error').html('').fadeOut();

                post_advertise();
            } else {
                $('#post_ad_email_exist #email_exists_error').html('<span class="status-not-available">' + response + '</span>').fadeIn();
                post_advertise();
            }
            $('#link_account').removeClass('button-progress').prop('disabled', false);
        }
    });
    return false;
});

/* Get and Bind cities */
$('#jobcity').select2({
    ajax: {
        url: ajaxurl + '?action=searchCityFromCountry',
        dataType: 'json',
        delay: 50,
        data: function (params) {
            var query = {
                q: params.term, /* search term */
                page: params.page
            };

            return query;
        },
        processResults: function (data, params) {
            /*
             // parse the results into the format expected by Select2
             // since we are using custom formatting functions we do not need to
             // alter the remote JSON data, except to indicate that infinite
             // scrolling can be used
             */
            params.page = params.page || 1;

            return {
                results: data.items,
                pagination: {
                    more: (params.page * 10) < data.totalEntries
                }
            };
        },
        cache: true
    },
    escapeMarkup: function (markup) {
        return markup;
    }, /* let our custom formatter work */
    minimumInputLength: 2,
    templateResult: function (data) {
        return data.text;
    },
    templateSelection: function (data, container) {
        return data.text;
    }
});

/*--------------------------------------
 POST SLIDER
 --------------------------------------*/
if (jQuery('#tg-dbcategoriesslider').length > 0) {

    if ($("body").hasClass("rtl")) var rtl = true;
    else rtl = false;
    var _tg_postsslider = jQuery('#tg-dbcategoriesslider');
    _tg_postsslider.owlCarousel({
        items: 4,
        nav: true,
        rtl: rtl,
        loop: false,
        dots: false,
        autoplay: false,
        dotsClass: 'tg-sliderdots',
        navClass: ['tg-prev', 'tg-next'],
        navContainerClass: 'tg-slidernav',
        navText: ['<span class="icon-chevron-left"></span>', '<span class="icon-chevron-right"></span>'],
        responsive: {
            0: {items: 2,},
            640: {items: 3,},
            768: {items: 4,},
        }
    });
}
// -------------------------------------------------------------
//  select-main-category Change
// -------------------------------------------------------------
$('.select-category.post-option .tg-category').on('click', function () {
    $('.select-category.post-option .tg-category.selected').removeClass('selected');
    $(this).addClass('selected');
    $('#sub-category-loader').css("visibility", "visible");
    $("#sub_category").html('');
    var catid = $(this).data('ajax-catid');
    var action = $(this).data('ajax-action');
    var data = {action: action, catid: catid};
    $('#main-category-text').html($(this).data('cat-name'));
    $('#input-maincatid').val(catid);
    getsubcat(catid, action, "");
    $(".tg-subcategories").show();
    $('#input-subcatid').val('');
    $('#sub-category-text').html('--');
});
// -------------------------------------------------------------
//  select-sub-category Change
// -------------------------------------------------------------
$('#sub_category').on('click', 'li', function (e) {
    e.preventDefault();
    var $item = $(this).closest('li');
    $('#sub_category li.selected').removeClass('selected active');
    $item.addClass('selected');
    var subcatid = $item.data('ajax-subcatid');
    var photoshow = $item.data('photo-show');
    var priceshow = $item.data('price-show');
    $('#input-subcatid').val(subcatid);
    $('#sub-category-text').html($item.text());

    $('#change-category-btn').show();
    // -------------------------------------------------------------
    //  Get custom fields
    // -------------------------------------------------------------
    var catid = $('#input-maincatid').val();
    var action = 'getCustomFieldByCatID';
    var data = {action: action, catid: catid, subcatid: subcatid};
    $.ajax({
        type: "POST",
        url: ajaxurl + "?action=" + action,
        data: data,
        success: function (result) {
            if (result != 0) {
                $("#ResponseCustomFields").html(result);
                $('#custom-field-block').show();
            }
            else {
                $('#custom-field-block').hide();
                $("#ResponseCustomFields").html('');
            }

        }
    });
    if (photoshow == 1) {
        $('#quickad-photo-field').show();
    } else {
        $('#quickad-photo-field').hide();
    }
    if (priceshow == 1) {
        $('#quickad-price-field').show();
    } else {
        $('#quickad-price-field').hide();
    }
    $('#choose-category').html(lang_edit_cat);
    $.magnificPopup.close();
});

function getsubcat(catid, action, selectid) {
    var data = {action: action, catid: catid, selectid: selectid};
    $.ajax({
        type: "POST",
        url: ajaxurl + '?action=' + action,
        data: data,
        success: function (result) {
            $("#sub_category").html(result);
            $('#sub-category-loader').css("visibility", "hidden");
        }
    });
}

function fillPrice(obj, val) {
    if ($(obj).is(':checked')) {
        var a = $('#totalPrice').text();
        var c = (parseFloat(a) + parseFloat(val)).toFixed(2);
    } else {
        var a = $('#totalPrice').text();
        var c = (parseFloat(a) - parseFloat(val)).toFixed(2);
    }

    $('#ad_total_cost_container').fadeIn();
    if (c == 0) {
        $('#ad_total_cost_container').fadeOut();
    }
    $('#totalPrice').html(c);
}
