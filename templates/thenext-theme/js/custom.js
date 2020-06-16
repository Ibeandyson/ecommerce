(function ($) {
    $(document).ready(function () {
        // Mobile menu
        $(function () {
            function mmenuInit() {
                $(".mmenu-init").mmenu({"counters": true}, {offCanvas: {pageNodetype: "#wrapper"}});
                var mmenuAPI = $(".mmenu-init").data("mmenu");
                var $icon = $(".mmenu-trigger .hamburger");
                $(".mmenu-trigger").on('click', function () {
                    mmenuAPI.open();
                });
                $(".mm-next").addClass("mm-fullsubopen");
            }

            mmenuInit();
        });

        // Back to top
        function backToTop() {
            $('body').append('<div id="backtotop"><a href="#"></a></div>');
        }

        backToTop();
        var pxShow = 600;
        var scrollSpeed = 500;
        $(window).scroll(function () {
            if ($(window).scrollTop() >= pxShow) {
                $("#backtotop").addClass('visible');
            } else {
                $("#backtotop").removeClass('visible');
            }
        });
        $('#backtotop a').on('click', function () {
            $('html, body').animate({scrollTop: 0}, scrollSpeed);
            return false;
        });

        // Ripple effect
        $('.ripple-effect, .ripple-effect-dark').on('click', function (e) {
            var rippleDiv = $('<span class="ripple-overlay">'), rippleOffset = $(this).offset(), rippleY = e.pageY - rippleOffset.top, rippleX = e.pageX - rippleOffset.left;
            rippleDiv.css({
                top: rippleY - (rippleDiv.height() / 2),
                left: rippleX - (rippleDiv.width() / 2),
            }).appendTo($(this));
            window.setTimeout(function () {
                rippleDiv.remove();
            }, 800);
        });

        $(".switch, .radio").each(function () {
            var intElem = $(this);
            intElem.on('click', function () {
                intElem.addClass('interactive-effect');
                setTimeout(function () {
                    intElem.removeClass('interactive-effect');
                }, 400);
            });
        });


        $(window).on('load', function () {
            $(".button.button-sliding-icon").each(function () {
                var buttonWidth = $(this).outerWidth() + 30;
                $(this).css('width', buttonWidth);
            });
        });

        $('.set-item-fav').on('click', function (e) {
            e.stopPropagation();
            e.preventDefault();

            var adId = $(this).data('item-id');
            var userId = $(this).data('userid');
            var action = $(this).data('action');
            var $item = $(this).closest('.fav-listing');
            var $this = $(this);

            if (userId == 0) {
                //window.location.href = loginurl;
                $('[href="#sign-in-dialog"]').trigger('click');
                return;
            }
            $this.addClass('button-loader');
            var data = {action: action, id: adId, userId: userId};
            $.ajax({
                type: "POST",
                url: ajaxurl,
                data: data,
                success: function (result) {
                    if (result == 1) {
                        if (action == 'removeFavAd') {
                            $item.remove();
                            var val = $('.fav-ad-count').text();
                            var favcount = val - 1;
                            $('.fav-ad-count').html(favcount);
                        }
                        else {
                            $this.removeClass('button-loader').addClass('added');
                        }

                    }
                    else if (result == 2) {
                        $this.removeClass('button-loader').removeClass('added');
                    }
                    else {
                        //alert("else");
                    }
                }
            });
        });

        $("a.close").removeAttr("href").on('click', function () {
            function slideFade(elem) {
                var fadeOut = {opacity: 0, transition: 'opacity 0.5s'};
                elem.css(fadeOut).slideUp();
            }

            slideFade($(this).parent());
        });

        $(".header-notifications").each(function () {
            var userMenu = $(this);
            var userMenuTrigger = $(this).find('.header-notifications-trigger a');
            $(userMenuTrigger).on('click', function (event) {
                event.preventDefault();
                if ($(this).closest(".header-notifications").is(".active")) {
                    close_user_dropdown();
                } else {
                    close_user_dropdown();
                    userMenu.addClass('active');
                }
            });
        });
        function close_user_dropdown() {
            $('.header-notifications').removeClass("active");
        }

        var mouse_is_inside = false;
        $(".header-notifications").on("mouseenter", function () {
            mouse_is_inside = true;
        });
        $(".header-notifications").on("mouseleave", function () {
            mouse_is_inside = false;
        });
        $("body").mouseup(function () {
            if (!mouse_is_inside) close_user_dropdown();
        });
        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                close_user_dropdown();
            }
        });

        $('.enable-filters-button').on('click', function () {
            $('.sidebar-container').slideToggle();
            $(this).toggleClass("active");
        });

        function avatarSwitcher() {
            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('.profile-pic').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            };
            $(".file-upload").on('change', function () {
                readURL(this);
            });
            $(".upload-button").on('click', function () {
                $(".file-upload").click();
            });
        }

        avatarSwitcher();

        $('.dashboard-nav ul li a').on('click', function (e) {
            if ($(this).closest("li").children("ul").length) {
                if ($(this).closest("li").is(".active-submenu")) {
                    $('.dashboard-nav ul li').removeClass('active-submenu');
                } else {
                    $('.dashboard-nav ul li').removeClass('active-submenu');
                    $(this).parent('li').addClass('active-submenu');
                }
                e.preventDefault();
            }
        });
        $('.dashboard-responsive-nav-trigger').on('click', function (e) {
            e.preventDefault();
            $(this).toggleClass('active');
            var dashboardNavContainer = $('body').find(".dashboard-nav");
            if ($(this).hasClass('active')) {
                $(dashboardNavContainer).addClass('active');
            } else {
                $(dashboardNavContainer).removeClass('active');
            }
            $('.dashboard-responsive-nav-trigger .hamburger').toggleClass('is-active');
        });


        function starRating(ratingElem) {
            $(ratingElem).each(function () {
                var dataRating = $(this).attr('data-rating');

                function starsOutput(firstStar, secondStar, thirdStar, fourthStar, fifthStar) {
                    return ('' +
                    '<span class="' + firstStar + '"></span>' +
                    '<span class="' + secondStar + '"></span>' +
                    '<span class="' + thirdStar + '"></span>' +
                    '<span class="' + fourthStar + '"></span>' +
                    '<span class="' + fifthStar + '"></span>');
                }

                var fiveStars = starsOutput('star', 'star', 'star', 'star', 'star');
                var fourHalfStars = starsOutput('star', 'star', 'star', 'star', 'star half');
                var fourStars = starsOutput('star', 'star', 'star', 'star', 'star empty');
                var threeHalfStars = starsOutput('star', 'star', 'star', 'star half', 'star empty');
                var threeStars = starsOutput('star', 'star', 'star', 'star empty', 'star empty');
                var twoHalfStars = starsOutput('star', 'star', 'star half', 'star empty', 'star empty');
                var twoStars = starsOutput('star', 'star', 'star empty', 'star empty', 'star empty');
                var oneHalfStar = starsOutput('star', 'star half', 'star empty', 'star empty', 'star empty');
                var oneStar = starsOutput('star', 'star empty', 'star empty', 'star empty', 'star empty');
                if (dataRating >= 4.75) {
                    $(this).append(fiveStars);
                } else if (dataRating >= 4.25) {
                    $(this).append(fourHalfStars);
                } else if (dataRating >= 3.75) {
                    $(this).append(fourStars);
                } else if (dataRating >= 3.25) {
                    $(this).append(threeHalfStars);
                } else if (dataRating >= 2.75) {
                    $(this).append(threeStars);
                } else if (dataRating >= 2.25) {
                    $(this).append(twoHalfStars);
                } else if (dataRating >= 1.75) {
                    $(this).append(twoStars);
                } else if (dataRating >= 1.25) {
                    $(this).append(oneHalfStar);
                } else if (dataRating < 1.25) {
                    $(this).append(oneStar);
                }
            });
        }

        starRating('.star-rating');

        tippy('[data-tippy-placement]', {
            delay: 100,
            arrow: true,
            arrowType: 'sharp',
            size: 'regular',
            duration: 200,
            animation: 'shift-away',
            animateFill: true,
            theme: 'dark',
            distance: 10,
            dynamicTitle: true
        });

        var accordion = (function () {
            var $accordion = $('.js-accordion');
            var $accordion_header = $accordion.find('.js-accordion-header');
            var settings = {speed: 400, oneOpen: false};
            return {
                init: function ($settings) {
                    $accordion_header.on('click', function () {
                        accordion.toggle($(this));
                    });
                    $.extend(settings, $settings);
                    if (settings.oneOpen && $('.js-accordion-item.active').length > 1) {
                        $('.js-accordion-item.active:not(:first)').removeClass('active');
                    }
                    $('.js-accordion-item.active').find('> .js-accordion-body').show();
                }, toggle: function ($this) {
                    if (settings.oneOpen && $this[0] != $this.closest('.js-accordion').find('> .js-accordion-item.active > .js-accordion-header')[0]) {
                        $this.closest('.js-accordion').find('> .js-accordion-item').removeClass('active').find('.js-accordion-body').slideUp();
                    }
                    $this.closest('.js-accordion-item').toggleClass('active');
                    $this.next().stop().slideToggle(settings.speed);
                }
            };
        })();

        $(document).ready(function () {
            accordion.init({speed: 300, oneOpen: true});
        });

        $(window).on('load resize', function () {
            if ($(".tabs")[0]) {
                $('.tabs').each(function () {
                    var thisTab = $(this);
                    var activePos = thisTab.find('.tabs-header .active').position();

                    function changePos() {
                        activePos = thisTab.find('.tabs-header .active').position();
                        thisTab.find('.tab-hover').stop().css({
                            left: activePos.left,
                            width: thisTab.find('.tabs-header .active').width()
                        });
                    }

                    changePos();
                    var tabHeight = thisTab.find('.tab.active').outerHeight();

                    function animateTabHeight() {
                        tabHeight = thisTab.find('.tab.active').outerHeight();
                        thisTab.find('.tabs-content').stop().css({height: tabHeight + 'px'});
                    }

                    animateTabHeight();
                    function changeTab() {
                        var getTabId = thisTab.find('.tabs-header .active a').attr('data-tab-id');
                        thisTab.find('.tab').stop().fadeOut(300, function () {
                            $(this).removeClass('active');
                        }).hide();
                        thisTab.find('.tab[data-tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
                            $(this).addClass('active');
                            animateTabHeight();
                        });
                    }

                    thisTab.find('.tabs-header a').on('click', function (e) {
                        e.preventDefault();
                        var tabId = $(this).attr('data-tab-id');
                        thisTab.find('.tabs-header a').stop().parent().removeClass('active');
                        $(this).stop().parent().addClass('active');
                        changePos();
                        tabCurrentItem = tabItems.filter('.active');
                        thisTab.find('.tab').stop().fadeOut(300, function () {
                            $(this).removeClass('active');
                        }).hide();
                        thisTab.find('.tab[data-tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
                            $(this).addClass('active');
                            animateTabHeight();
                        });
                    });
                    var tabItems = thisTab.find('.tabs-header ul li');
                    var tabCurrentItem = tabItems.filter('.active');
                    thisTab.find('.tab-next').on('click', function (e) {
                        e.preventDefault();
                        var nextItem = tabCurrentItem.next();
                        tabCurrentItem.removeClass('active');
                        if (nextItem.length) {
                            tabCurrentItem = nextItem.addClass('active');
                        } else {
                            tabCurrentItem = tabItems.first().addClass('active');
                        }
                        changePos();
                        changeTab();
                    });
                    thisTab.find('.tab-prev').on('click', function (e) {
                        e.preventDefault();
                        var prevItem = tabCurrentItem.prev();
                        tabCurrentItem.removeClass('active');
                        if (prevItem.length) {
                            tabCurrentItem = prevItem.addClass('active');
                        } else {
                            tabCurrentItem = tabItems.last().addClass('active');
                        }
                        changePos();
                        changeTab();
                    });
                });
            }
        });

        var radios = document.querySelectorAll('.payment-tab-trigger > input');
        for (var i = 0; i < radios.length; i++) {
            radios[i].addEventListener('change', expandAccordion);
        }
        function expandAccordion(event) {
            var tabber = this.closest('.payment');
            var allTabs = tabber.querySelectorAll('.payment-tab');
            for (var i = 0; i < allTabs.length; i++) {
                allTabs[i].classList.remove('payment-tab-active');
            }
            event.target.parentNode.parentNode.classList.add('payment-tab-active');
        }

        $('.billing-cycle-radios').on("click", function () {
            if ($('.billed-yearly-radio input').is(':checked')) {
                $('.pricing-plans-container').addClass('billed-yearly');
            }
            if ($('.billed-monthly-radio input').is(':checked')) {
                $('.pricing-plans-container').removeClass('billed-yearly');
            }
        });
        function qtySum() {
            var arr = document.getElementsByName('qtyInput');
            var tot = 0;
            for (var i = 0; i < arr.length; i++) {
                if (parseInt(arr[i].value))
                    tot += parseInt(arr[i].value);
            }
        }

        qtySum();
        $(".qtyDec, .qtyInc").on("click", function () {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();
            if ($button.hasClass('qtyInc')) {
                $button.parent().find("input").val(parseFloat(oldValue) + 1);
            } else {
                if (oldValue > 1) {
                    $button.parent().find("input").val(parseFloat(oldValue) - 1);
                } else {
                    $button.parent().find("input").val(1);
                }
            }
            qtySum();
            $(".qtyTotal").addClass("rotate-x");
        });
        function inlineBG() {
            $(".single-page-header, .intro-banner").each(function () {
                var attrImageBG = $(this).attr('data-background-image');
                if (attrImageBG !== undefined) {
                    $(this).append('<div class="background-image-container"></div>');
                    $('.background-image-container').css('background-image', 'url(' + attrImageBG + ')');
                }
            });
        }

        inlineBG();
        $(".intro-search-field").each(function () {
            var bannerLabel = $(this).children("label").length;
            if (bannerLabel > 0) {
                $(this).addClass("with-label");
            }
        });
        $(".photo-box, .photo-section, .video-container").each(function () {
            var photoBox = $(this);
            var photoBoxBG = $(this).attr('data-background-image');
            if (photoBox !== undefined) {
                $(this).css('background-image', 'url(' + photoBoxBG + ')');
            }
        });

        $(".share-buttons-icons a").each(function () {
            var buttonBG = $(this).attr("data-button-color");
            if (buttonBG !== undefined) {
                $(this).css('background-color', buttonBG);
            }
        });
        var $tabsNav = $('.popup-tabs-nav'), $tabsNavLis = $tabsNav.children('li');
        $tabsNav.each(function () {
            var $this = $(this);
            $this.next().children('.popup-tab-content').stop(true, true).hide().first().show();
            $this.children('li').first().addClass('active').stop(true, true).show();
        });
        $tabsNavLis.on('click', function (e) {
            var $this = $(this);
            $this.siblings().removeClass('active').end().addClass('active');
            $this.parent().next().children('.popup-tab-content').stop(true, true).hide().siblings($this.find('a').attr('href')).fadeIn();
            e.preventDefault();
        });

        var hash = window.location.hash;
        var anchor = $('.tabs-nav a[href="' + hash + '"]');
        if (anchor.length === 0) {
            $(".popup-tabs-nav li:first").addClass("active").show();
            $(".popup-tab-content:first").show();
        } else {
            anchor.parent('li').click();
        }
        $('.popup-tabs-nav').each(function () {
            var listCount = $(this).find("li").length;
            if (listCount < 2) {
                $(this).css({'pointer-events': 'none'});
            }
        });
        $('.indicator-bar').each(function () {
            var indicatorLenght = $(this).attr('data-indicator-percentage');
            $(this).find("span").css({width: indicatorLenght + "%"});
        });


        var BrowseButton = {$button: $('.BrowseButton-input'), $nameField: $('.BrowseButton-file-name')};
        BrowseButton.$button.on('change', function () {
            _populateFileField($(this));
        });
        function _populateFileField($button) {
            var selectedFile = [];
            for (var i = 0; i < $button.get(0).files.length; ++i) {
                selectedFile.push($button.get(0).files[i].name + '<br>');
            }
            BrowseButton.$nameField.html(selectedFile);
        }

        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in',
        });

        $('.mfp-image').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            mainClass: 'mfp-fade',
            image: {verticalFit: true}
        });

        $(document).on('click', '[data-toggle="tab"]', function (e) {
            e.preventDefault();
            var id = $(this).attr('href');
            id = id.replace('#', '');
            var parent = $(this).parents('.smiley-panel');
            $(parent).find('.tab-content .tab-pane').removeClass('active in');
            $(parent).find('.tab-content .tab-pane#' + id).addClass('active in');
            $(parent).find('.menu-item').removeClass('active');
            $(this).parents('li').addClass('active');
        });

        /* === Search city === */
        $('#country-popup').on('click', '#getCities ul li .statedata', function (e) {
            e.stopPropagation();
            e.preventDefault();
            $('#getCities #results').hide();
            $('#getCities .loader').show();
            var $item = $(this).closest('.statedata');
            var id = $item.data('id');
            var action = "ModelGetCityByStateID";
            var data = {action: action, id: id};

            $.post(ajaxurl, data, function (result) {
                $("#getCities #results").html(result);
                $('#getCities .loader').hide();
                $('#getCities #results').show();
            });
        });

        $('#country-popup').on('click', '#getCities ul li #changeState', function (e) {
            // Keep ads item click from being executed.
            e.stopPropagation();
            // Prevent navigating to '#'.
            e.preventDefault();
            // Ask user if he is sure.
            $('#getCities #results').hide();
            $('#getCities .loader').show();
            var $item = $(this).closest('.quick-states');
            var id = $item.data('country-id');
            var action = "ModelGetStateByCountryID";
            var data = {action: action, id: id};

            $.post(ajaxurl, data, function (result) {
                $("#getCities #results").html(result);
                $('#getCities .loader').hide();
                $('#getCities #results').show();
            });
        });

        $('#country-popup').on('click', 'ul li .selectme', function (e) {
            e.stopPropagation();
            e.preventDefault();
            var id = $(this).data('id');
            var name = $(this).data('name');
            var type = $(this).data('type');
            $('#inputStateCity').val(name);
            $('#searchStateCity').val(name);
            $('#headerStateCity').html(name + ' <i class="fa fa-pencil"></i>');
            $('#searchPlaceType').val(type);
            $('#searchPlaceId').val(id);
            if ($('#countryModal').length) {
                $.magnificPopup.close();
            }

            localStorage.Quick_placeText = name;
            localStorage.Quick_PlaceId = id;
            localStorage.Quick_PlaceType = type;
            $("#searchDisplay").html('').hide();
        });

        $('.category-dropdown').on('click', '#category-change a', function (ev) {
            if ("#" === $(this).attr('href')) {
                ev.preventDefault();
                var parent = $(this).parents('.category-dropdown');
                parent.find('.change-text').html($(this).html());
                var id = $(this).data('ajax-id');
                var type = $(this).data('cat-type');

                if (type == "all") {
                    $('#input-subcat').val('');
                    $('#input-maincat').val('');
                }
                else if (type == "maincat") {
                    $('#input-subcat').val('');
                }
                else {
                    $('#input-maincat').val('');
                }
                $('#input-' + type).val(id);
            }
        });

        $('#searchStateCity').on('click', function () {
            $('#change-city').trigger('click');
        });

        if (localStorage.Quick_placeText != "") {
            var placeText = localStorage.Quick_placeText;
            var PlaceId = localStorage.Quick_PlaceId;
            var PlaceType = localStorage.Quick_PlaceType;

            if (placeText != null) {
                $('#inputStateCity').val(placeText);
                $('#searchStateCity').val(placeText);
                $('#headerStateCity').html(placeText + ' <i class="fa fa-pencil"></i>');
                $('#searchPlaceId').val(PlaceId);
                $('#searchPlaceType').val(PlaceType);
            }
        }

        var searchCityAjax = null;
        $("#inputStateCity").keyup(function () {
            if (searchCityAjax) {
                searchCityAjax.abort();
            }
            var searchbox = $(this).val();
            var dataString = 'searchword1=' + searchbox;

            var action = "searchStateCountry";
            var data = {action: action, dataString: searchbox};

            if (searchbox == '') {
                $('#searchDisplay').hide();
            }
            else {
                $('#searchDisplay').show();
                searchCityAjax = $.post(ajaxurl, data, function (result) {
                    $("#searchDisplay").html(result).show();
                });
            }
            return false;
        });


        var inputField = jQuery('.qucikad-ajaxsearch-input');
        var inputSubcatField = jQuery('#input-subcat');
        var inputCatField = jQuery('#input-maincat');
        var inputKeywordsField = jQuery('#input-keywords');
        var myDropDown = jQuery("#qucikad-ajaxsearch-dropdown");
        var myDropDown1 = jQuery("#qucikad-ajaxsearch-dropdown ul li");
        var myDropOption = jQuery('#qucikad-ajaxsearch-dropdown > option');
        var html = jQuery('html');
        var select = jQuery('.qucikad-ajaxsearch-input, #qucikad-ajaxsearch-dropdown > option');
        var lps_tag = jQuery('.qucikad-as-tag');
        var lps_cat = jQuery('.qucikad-as-cat');


        jQuery("#def-cats").append(jQuery('#qucikad-ajaxsearch-dropdown ul').html());

        var length = myDropOption.length;
        inputField.on('click', function (event) {
            //event.preventDefault();
            myDropDown.attr('size', length);
            myDropDown.css('display', 'block');
        });

        //myDropDown1.on('click', function(event) {
        jQuery(document).on('click', '#qucikad-ajaxsearch-dropdown ul li', function (event) {
            myDropDown.attr('size', 0);
            var dropValue = jQuery.trim(jQuery(this).text());
            var tagVal = jQuery(this).data('tagid');
            var catVal = jQuery(this).data('catid');
            var moreVal = jQuery(this).data('moreval');

            inputField.val(dropValue);
            inputSubcatField.val(tagVal);
            inputCatField.val(catVal);
            inputKeywordsField.val("");
            if (tagVal == null && catVal == null && moreVal != null) {
                inputField.val(moreVal);
                inputKeywordsField.val(moreVal);
            }
            jQuery("form i.qucikad-ajaxsearch-close").css("display", "block");
            myDropDown.css('display', 'none');
        });

        jQuery('form i.qucikad-ajaxsearch-close').on('click', function () {
            jQuery("form i.qucikad-ajaxsearch-close").css("display", "none");
            jQuery('form .qucikad-ajaxsearch-input').val('');
            jQuery("img.loadinerSearch").css("display", "block");
            var qString = '';

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: ajaxurl,
                data: {
                    'action': 'quickad_ajax_home_search',
                    'tagID': qString
                },
                success: function (data) {
                    if (data) {
                        jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
                        var resArray = [];
                        if (data.suggestions.cats) {
                            jQuery.each(data.suggestions.cats, function (i, v) {
                                resArray.push(v);
                            });

                        }
                        jQuery('img.loadinerSearch').css('display', 'none');
                        jQuery("#qucikad-ajaxsearch-dropdown ul").append(resArray);
                        myDropDown.css('display', 'block');
                    }
                }
            });
            jQuery('img.loadinerSearch').css('display', 'none');
        });

        html.on('click', function (event) {
            //event.preventDefault();
            myDropDown.attr('size', 0);
            myDropDown.css('display', 'none');
            //$("#searchDisplay").attr('size', 0);
            jQuery("#searchDisplay").css('display', 'none');
        });

        select.on('click', function (event) {
            event.stopPropagation();
        });

        var resArray = [];
        var newResArray = [];
        var bufferedResArray = [];
        var prevQString = '?';

        function trimAttributes(node) {
            jQuery.each(node.attributes, function () {
                var attrName = this.name;
                var attrValue = this.value;
                // remove attribute name start with "on", possible unsafe,
                // for example: onload, onerror...
                //
                // remvoe attribute value start with "javascript:" pseudo protocol, possible unsafe,
                // for example href="javascript:alert(1)"
                if (attrName.indexOf('on') == 0 || attrValue.indexOf('javascript:') == 0) {
                    jQuery(node).removeAttr(attrName);
                }
            });
        }

        function sanitize(html) {
            var output = jQuery($.parseHTML('<div>' + html + '</div>', null, false));
            output.find('*').each(function () {
                trimAttributes(this);
            });
            return output.html();
        }

        inputField.on('input', function () {
            var $this = jQuery(this);
            var qString = sanitize(this.value);
            lpsearchmode = jQuery('body').data('lpsearchmode');
            lpsearchmode = "titlematch";
            noresultMSG = jQuery(this).data('noresult');
            jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
            jQuery("#qucikad-ajaxsearch-dropdown ul li").remove();
            prevQuery = $this.data('prev-value');
            $this.data("prev-value", qString.length);
            inputKeywordsField.val(qString);

            if (qString.length == 0) {

                defCats = jQuery('#def-cats').html();
                myDropDown.css('display', 'none');
                jQuery("#qucikad-ajaxsearch-dropdown ul").empty();

                jQuery("#qucikad-ajaxsearch-dropdown ul").append(defCats);
                myDropDown.css('display', 'block');
                $this.data("prev-value", qString.length);
                inputKeywordsField.val("");

            }
            else if ((qString.length == 1 && prevQString != qString) || (qString.length == 1 && prevQuery < qString.length)) {

                myDropDown.css('display', 'none');
                jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
                resArray = [];
                //jQuery('#selector').val().length
                jQuery("form i.qucikad-ajaxsearch-close").css("display", "none");
                jQuery("img.loadinerSearch").css("display", "block");
                //jQuery(this).addClass('loaderimg');
                jQuery.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: ajaxurl,
                    data: {
                        'action': 'quickad_ajax_home_search',
                        'tagID': qString
                    },
                    success: function (data) {
                        if (data) {

                            if (data.suggestions.tag || data.suggestions.tagsncats || data.suggestions.cats || data.suggestions.titles) {

                                if (data.suggestions.tag) {
                                    jQuery.each(data.suggestions.tag, function (i, v) {
                                        resArray.push(v);
                                    });
                                }

                                if (data.suggestions.tagsncats) {
                                    jQuery.each(data.suggestions.tagsncats, function (i, v) {
                                        resArray.push(v);
                                    });

                                }


                                if (data.suggestions.cats) {
                                    jQuery.each(data.suggestions.cats, function (i, v) {

                                        resArray.push(v);

                                    });

                                    if (data.suggestions.tag == null && data.suggestions.tagsncats == null && data.suggestions.titles == null) {
                                        resArray = resArray;
                                    }
                                    else {
                                    }
                                }

                                if (data.suggestions.titles) {
                                    jQuery.each(data.suggestions.titles, function (i, v) {

                                        resArray.push(v);

                                    });

                                }

                            }
                            else {
                                if (data.suggestions.more) {
                                    jQuery.each(data.suggestions.more, function (i, v) {
                                        resArray.push(v);
                                    });

                                }
                            }

                            prevQString = data.tagID;

                            jQuery('img.loadinerSearch').css('display', 'none');
                            if (jQuery('form #select').val() == '') {
                                jQuery("form i.qucikad-ajaxsearch-close").css("display", "none");
                            }
                            else {
                                jQuery("form i.qucikad-ajaxsearch-close").css("display", "block");
                            }

                            bufferedResArray = resArray;
                            filteredRes = [];
                            qStringNow = jQuery('.qucikad-ajaxsearch-input').val();
                            jQuery.each(resArray, function (key, value) {

                                if (jQuery(value).find('a').length == "1") {
                                    rText = jQuery(value).find('a').text();
                                }
                                else {
                                    rText = jQuery(value).text();
                                }

                                if (lpsearchmode == "keyword") {

                                    qStringNow = qStringNow.toUpperCase();
                                    rText = rText.toUpperCase();
                                    var regxString = new RegExp(qStringNow, 'g');
                                    var lpregxRest = rText.match(regxString);
                                    if (lpregxRest) {
                                        filteredRes.push(value);
                                    }

                                } else {
                                    if (rText.substr(0, qStringNow.length).toUpperCase() == qStringNow.toUpperCase()) {
                                        filteredRes.push(value);
                                    }
                                }
                            });

                            if (filteredRes.length > 0) {
                                myDropDown.css('display', 'none');
                                jQuery("#qucikad-ajaxsearch-dropdown ul").empty();

                                jQuery("#qucikad-ajaxsearch-dropdown ul").append(filteredRes);
                                myDropDown.css('display', 'block');
                                $this.data("prev-value", qString.length);

                            }

                            else if (filteredRes.length < 1 && qStringNow.length < 2) {
                                myDropDown.css('display', 'none');
                                jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
                                jQuery('#qucikad-ajaxsearch-dropdown ul li').remove();
                                $mResults = '<strong>' + noresultMSG + ' </strong>';
                                $mResults = $mResults + qString;
                                var defRes = '<li class="qucikad-ajaxsearch-li-more-results" data-moreval="' + qString + '">' + $mResults + '</li>';
                                newResArray.push(defRes);
                                jQuery("#qucikad-ajaxsearch-dropdown ul").append(newResArray);
                                myDropDown.css('display', 'block');
                                $this.data("prev-value", qString.length);
                            }
                        }
                    }

                });
            }
            /* get results from buffered data */
            else {
                newResArray = [];
                myDropDown.css('display', 'none');
                jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
                jQuery.each(bufferedResArray, function (key, value) {
                    var stringToCheck = jQuery(value).find('span').first().text();

                    if (lpsearchmode == "keyword") {

                        qString = qString.toUpperCase();
                        stringToCheck = stringToCheck.toUpperCase();

                        var regxString = new RegExp(qString, 'g');
                        var lpregxRest = stringToCheck.match(regxString);
                        if (lpregxRest) {
                            newResArray.push(value);
                        }

                    } else {

                        if (stringToCheck.substr(0, qString.length).toUpperCase() == qString.toUpperCase()) {
                            newResArray.push(value);
                        }
                    }
                });
                if (newResArray.length == 0) {
                    jQuery("#qucikad-ajaxsearch-dropdown ul").empty();
                    jQuery('#qucikad-ajaxsearch-dropdown ul li').remove();
                    $mResults = '<strong>' + noresultMSG + ' </strong>';
                    $mResults = $mResults + qString;
                    var defRes = '<li class="qucikad-ajaxsearch-li-more-results" data-moreval="' + qString + '">' + $mResults + '</li>';
                    newResArray.push(defRes);
                }

                jQuery("#qucikad-ajaxsearch-dropdown ul").append(newResArray);
                myDropDown.css('display', 'block');
            }
        });


        jQuery('.qucikad-ajaxsearch-input').on('click', function (event) {

            jQuery("#qucikad-ajaxsearch-dropdown").niceScroll({
                cursorcolor: "#c9c9c9",
                cursoropacitymax: 1,
                boxzoom: false,
                cursorwidth: "8px",
                cursorborderradius: "0",
                cursorborder: "0",
                touchbehavior: true,
                preventmultitouchscrolling: false,
                cursordragontouch: true,
                background: "#fff",
                horizrailenabled: false,
                autohidemode: false,
                zindex: "999999"
            });

        });

    });

    $('#js-table-list').on('click', '.item-js-delete', function (e) {
        // Keep ads item click from being executed.
        e.stopPropagation();
        // Prevent navigating to '#'.
        e.preventDefault();
        // Ask user if he is sure.
        var action = $(this).data('ajax-action');
        var $item = $(this).closest('.ajax-item-listing');
        var data = {action: action, id: $item.data('item-id')};
        if (confirm(LANG_ARE_YOU_SURE)) {
            $.post(ajaxurl + '?action=' + action, data, function (response) {
                if (response != 0) {
                    $item.remove();
                    Snackbar.show({text: LANG_JOB_DELETED});
                } else {
                    Snackbar.show({text: LANG_ERROR_TRY_AGAIN});
                }
            });
        }
    });

    $('#js-table-list').on('click', '.item-js-hide', function (e) {
        e.stopPropagation();
        e.preventDefault();
        var action = $(this).data('ajax-action');
        var $item = $(this).closest('.ajax-item-listing');
        var data = {action: action, id: $item.data('item-id')};

        $.post(ajaxurl + '?action=' + action, data, function (response) {
            if (response == 1) {
                $item.addClass('opapcityLight');
                $item.find('.label-hidden').html(LANG_HIDDEN)
                $item.find('.item-js-hide').attr('title', LANG_SHOW);
                $item.find('.item-js-hide').html('<i class="icon-feather-eye"></i>');
            }
            else if (response == 2) {
                $item.removeClass('opapcityLight');
                $item.find('.label-hidden').html(LANG_SHOW)
                $item.find('.item-js-hide').attr('title', LANG_HIDE);
                $item.find('.item-js-hide').html('<i class="icon-feather-eye-off"></i>');
            }
            else {
                Snackbar.show({text: LANG_ERROR_TRY_AGAIN});
            }
        });
    });

    $('.ajax-delete-resume').on('click', function (e) {
        // Keep ads item click from being executed.
        e.stopPropagation();
        // Prevent navigating to '#'.
        e.preventDefault();
        // Ask user if he is sure.
        var action = 'deleteResume';
        var $item = $(this).closest('.resume-row');
        var data = {action: action, id: $item.data('item-id')};
        if (confirm(LANG_ARE_YOU_SURE)) {
            $.post(ajaxurl + '?action=' + action, data, function (response) {
                if (response != 0) {
                    $item.remove();
                    Snackbar.show({text: LANG_RESUME_DELETED});
                } else {
                    Snackbar.show({text: LANG_ERROR_TRY_AGAIN});
                }
            });
        }
    });

    $('.ajax-delete-company').on('click', function (e) {
        // Keep ads item click from being executed.
        e.stopPropagation();
        // Prevent navigating to '#'.
        e.preventDefault();
        // Ask user if he is sure.
        var action = 'deleteCompany';
        var $item = $(this).closest('.company-row');
        var data = {action: action, id: $item.data('item-id')};
        if (confirm(LANG_ARE_YOU_SURE)) {
            $.post(ajaxurl + '?action=' + action, data, function (response) {
                if (response != 0) {
                    $item.remove();
                    Snackbar.show({text: LANG_COMPANY_DELETED});
                } else {
                    Snackbar.show({text: LANG_ERROR_TRY_AGAIN});
                }
            });
        }
    });

    $('body').magnificPopup({
        type: 'image',
        delegate: 'a.mfp-gallery',
        fixedContentPos: true,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: false,
        preloader: true,
        removalDelay: 0,
        mainClass: 'mfp-fade',
        gallery: {
            enabled: true
        }
    });
    function inlineCSS(){
        $(".fullwidth-property-slider .item").each(function(){
            console.log("hi");
            var attrImageBG=$(this).attr('data-background-image');
            if(attrImageBG!==undefined){
                $(this).css('background-image','url('+attrImageBG+')');
            }
        });
    }
    inlineCSS();

    if($('.fullwidth-property-slider').length > 0) {
        $('.fullwidth-property-slider').slick({
            centerMode: true,
            centerPadding: '20%',
            slidesToShow: 1,
            responsive: [{
                breakpoint: 1367,
                settings: {
                    centerPadding: '15%'
                }
            }, {
                breakpoint: 993,
                settings: {
                    centerPadding: '0'
                }
            }]
        });
    }

    $("#email_contact_seller").on('submit', function() {
        $('#email_submit_button').addClass('button-progress').prop('disabled', true);
        var action = $("#email_contact_seller").attr('action');
        var form_data = $(this).serialize();

        $.ajax({
            type: "POST",
            url: ajaxurl+'?action='+action,
            data: form_data,
            success: function (response) {
                if (response == "success") {
                    $('#email_success').show();
                }
                else {
                    $('#email_error').show();
                }
                $('#email_submit_button').removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    $('.show-more-button').on('click', function(e) {
        e.preventDefault();
        $('.show-more').toggleClass('visible');
    });

    /*--------------------------------------
			SHOW NUMBER
	--------------------------------------*/
    var _clickelement = $('.tg-btnphone');
    _clickelement.on('click', 'span', function() {
        $(this).find('em').text($(this).data('last') );
    });
    /*--------------------------------------
               STYLE SWITCHER
       --------------------------------------*/
    $('#styleswitch').styleSwitcher();
    $("#styleswitch h3").click(function () {
        if ($(this).parent().css("left") == "-200px") {
            $(this).parent().animate({left: '0px'}, {queue: false, duration: 500});
        } else {
            $(this).parent().animate({left: '-200px'}, {queue: false, duration: 500});
        }
    });
    $('.styleswitch .toggler').on('click', function (event) {
        event.preventDefault();
        $(this).closest('.styleswitch').toggleClass('opened');
    });
})(this.jQuery);

var w = 600;
var h = 580;
var left = (screen.width / 2) - (w / 2);
var top = (screen.height / 2) - (h / 2);
function fblogin() {
    var newWin = window.open(siteurl + "includes/social_login/facebook/index.php", "fblogin", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no,display=popup, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}

function gmlogin() {
    var newWin = window.open(siteurl + "includes/social_login/google/index.php", "gmlogin", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}
