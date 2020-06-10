<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails Todo Application"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <script type="text/javascript">
        <g:if test="${flash?.message && flash?.message?.info}">
        jQuery(document).ready(function () {
            OCB.messageBox.showMessage(Boolean(${flash.message?.success}), "${flash.message?.info}");
        });
        </g:if>
    </script>
    <g:layoutHead/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">
        <span class="navbar-brand">Grails Todo Application</span>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        %{--Member Action Menu--}%
        <ul class="navbar-nav ml-auto">
            <UIHelper:memberActionMenu/>
        </ul>
    </nav>
</header>
<div class="container-fluid">
    <div class="row bg-dark">
        <nav class="navbar navbar-expand-lg mx-auto navbar-dark">
            <ul class="navbar-nav">
                <UIHelper:menuNavigation/>
            </ul>
        </nav>
    </div>
    <main role="main">
        <g:layoutBody/>
    </main>
</div>
</body>
</html>