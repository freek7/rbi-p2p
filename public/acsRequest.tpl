<!doctype html>
<html>
<head>
    <title>eCommerce Connect > Redirect to ACS ...</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expiration" content="0">

    <style nonce="${nonce}" id="antiClickjack">body {
        display: none;
    }</style>
    <script nonce="${nonce}">
        if (self === top) {
            var antiClickjack = document.getElementById("antiClickjack");
            antiClickjack.parentNode.removeChild(antiClickjack);
        } else {
            top.location = self.location;
        }
    </script>

</head>
<body>


<center>
    <br>
    <b>Waiting</b> ... The page is redirecting to banking server
    <br><br>
    Do not make any interaction with browser because it can result in the transaction failing.
</center>
<center><img src="${contextPath}/img/${payment.templateName}/loading.gif"/></center>


<form name="mpi" method="post" action="${ACSURL}">

    <input type="hidden" name="PaReq" value="${PaReq}">
    <input type="hidden" name="TermUrl" value="${TermUrl}">
    <input type="hidden" name="MD" value="${MD}">

    <noscript>
        <center>
            <br>Your browser does not support Java script or disabled it. Please press "Submit" to continue.
            <br/>
            <input type="submit" class="submit" value="&gt;&gt; Submit">
        </center>
    </noscript>
</form>
<script nonce="${nonce}">
    <!--
    document.mpi.submit();
    -->
</script>
</body>
</html>
