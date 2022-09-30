<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>3DS processing</title>
		<style type="text/css" nonce="${nonce}">
			.container {
				overflow: hidden;
				height: 100%;
				width: 100%;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div><img src="${contextPath}/img/${payment.templateName}/loading.gif" border="0"/></div>
			<form id="form" action="${contextPath}/p2p/3ds-notify/${jsessionid}" method="post">
				<input type="hidden" name="callbackUrl" value="${callbackUrl}"/>
				<input type="hidden" name="monitoringUrl" value="${monitoringUrl}"/>
			</form>
			<script nonce="${nonce}">
				document.getElementById("form").submit();
			</script>
		</div>
	</body>
</html>