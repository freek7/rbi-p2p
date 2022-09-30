<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>3DSecure 2.0 Result</title>
    </head>
    <body>
        <form>
            <input type="hidden" id="callbackName" name="callbackName" value="${callbackName}"/>
            <input type="hidden" id="callbackUrl" name="callbackUrl" value="${callbackUrl}"/>
        </form>
        <script nonce="${nonce}">
            const callbackNameValue = document.getElementById("callbackName").value;
            const callbackUrl = document.getElementById("callbackName").value;

            var callbackFn = parent[callbackNameValue];
            if (typeof callbackFn === 'function') {
                setTimeout(callbackFn(callbackUrl), ${callbackWait});
            }
        </script>
    </body>
</html>