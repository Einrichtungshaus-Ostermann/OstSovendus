
{* file to extend *}
{extends file="parent:frontend/checkout/finish.tpl"}

{* set namespace *}
{namespace name="frontend/ost-sovendus/checkout/finish"}



{* add the sovendus container *}
{block name="frontend_checkout_finish_teaser"}

    {* prepend parent *}
    {$smarty.block.parent}

    {* sovendus container *}
    <div id="customCheckoutDiv"></div>

{/block}



{* add the sovendus js *}
{block name='frontend_checkout_finish_items'}

    <!--sovendus code begin -->
    <div id="sovendus-container-1"></div>
    <script type="text/javascript">
        window.sovIframes = window.sovIframes || [];
        window.sovIframes.push({
            trafficSourceNumber : '{$ostSovendusConfiguration.trafficSourceNumber}',
            trafficMediumNumber : '{$ostSovendusConfiguration.trafficMediumNumber}',
            sessionId : '{$smarty.session.Shopware.sessionId}',
            timestamp : Date.now(),
            orderId : '{$sOrderNumber}',
            orderValue : '{$sAmount}',
            orderCurrency : '{$sCurrency}',
            usedCouponCode : '',
            iframeContainerId : 'sovendus-container-1'
        });
        window.sovConsumer = window.sovConsumer || {};
        window.sovConsumer = {
            consumerSalutation : '{$sUserData.billingaddress.salutation}',
            consumerFirstName : '{$sUserData.billingaddress.firstname}',
            consumerLastName : '{$sUserData.billingaddress.lastname}',
            consumerEmail : '{$sUserData.additional.user.email}',
            consumerStreet : '{$sUserData.billingaddress.street}',
            consumerStreetNumber : '{$sUserData.billingaddress.streetnumber}',
            consumerCountry : '{$sUserData.additional.country.countryname}',
            consumerZipcode : '{$sUserData.billingaddress.zipcode}',
            consumerCity : '{$sUserData.billingaddress.city}',
            consumerPhone : '{$sUserData.billingaddress.phone}',
            consumerMobile : '',
            consumerDateOfBirth : '',
            consumerYearOfBirth : ''
        };
        var sovDomain = window.location.protocol + '\x2F\x2F' + 'api.sovendus.com';
        var sovJsFile = sovDomain + '\x2Fsovabo\x2Fcommon\x2Fjs\x2FflexibleIframe.js';
        document.write('<sc' + 'ript async="true" src="' + sovJsFile + '" type="text/javascript"></sc' + 'ript>');
    </script>
    <!--sovendus code end -->

    {* append parent *}
    {$smarty.block.parent}

{/block}
