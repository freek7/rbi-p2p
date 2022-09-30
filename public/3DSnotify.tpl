<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Expiration" content="0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>3DS notify</title>
  <style type="text/css" nonce="${nonce}">
    .challengeContainer {
      overflow: hidden;
      height: 680px;
      text-align: center;
    }

    .threeds-container {
      border: 0;
      visibility: hidden;
    }

    .h-100 {
      height: 100% !important;
    }

    .w-100 {
      width: 100% !important;
    }

    .border-0 {
      border: 0 !important;
    }
  </style>
  <script nonce="${nonce}">
    function createElementFromHTML(htmlString) {
      const div = document.createElement('div');
      div.innerHTML = htmlString.trim();
      return div.firstChild;
    }


    function removeElement(node) {
      if (node.parentNode) {
        node.parentNode.removeChild(node);
      }
    }


    function authResultReady(url) {
      const spinnerEl = document.querySelector(".spinner");
      const form = document.getElementById("threeDS");

      try {
        removeElement(spinnerEl);
        form.setAttribute("action", url);
        form.submit();
      } catch (e) {
        console.error(e);
        alert(e.message);
      }
    }

    function startChallenge(url) {
      const spinnerEl = document.querySelector(".spinner");
      const challengeContainer = document.querySelector(".challengeContainer");

      removeElement(spinnerEl);

      const iframe = document.createElement("iframe");
      iframe.setAttribute("class", "h-100 w-100 border-0");
      iframe.setAttribute("id", "challengeWindow");
      iframe.setAttribute("name", "challengeWindow");
      iframe.setAttribute("src", url);

      challengeContainer.appendChild(iframe);
    }

    function sessionExpired(param) {
      try {
        const spinnerEl = document.querySelector(".spinner");
        const form = document.getElementById("threeDS");
        const targetPath = '${contextPath}/p2p/${templateNameUrl}/' + '?' + param;

        removeElement(spinnerEl);
        form.setAttribute("action", targetPath);
        form.submit();
      } catch (e) {
        console.error(e);
      }
    }


    window.addEventListener("message", function (event) {
      try {
        console.log(event);
        const jData = JSON.parse(event.data);
        if (jData.type === "submit") {
          const form = createElementFromHTML(jData.form);
          document.body.appendChild(form);
          form.submit();
        }
      } catch (e) {
        console.error(e);
      }
    });
  </script>
</head>

<body>
  <form id="threeDS" method="post" />
  <div class="challengeContainer">
    <div class="spinner">
      <div class="center">
        <br /><b>Waiting</b> ... The page is redirecting to banking server<br />
        <br />Do not make any interaction with browser because it can result in the transaction failing.
      </div>
      <div><img src="${contextPath}/img/${payment.templateName}/loading.gif" border="0" /></div>
      <iframe class="threeds-container" src="${callbackUrl}"></iframe>
      <iframe class="threeds-container" src="${monitoringUrl}"></iframe>
    </div>
  </div>
</body>

</html>