<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Bitmascot
    </title>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="#">Profile</a></li>
                <li><a href="${createLink(controller: 'registerUser', action: 'changePasswordForm')}">Change password</a></li>
                <li><a href="${createLink(controller: 'logout')}">Logout</a></li>
            </ul>
        </div>
    </nav>

    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="jquery-ui.min.js"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.min.css"/>
    <asset:stylesheet src="datatable.css"/>
    <asset:stylesheet src="datatable.min.css"/>
    <asset:stylesheet src="bootstrap-date-timepicker.min.css"/>
    <asset:stylesheet src="bootstrap-date-timepicker.css"/>
    <asset:javascript src="bootstrap-timepicker.min.js"/>
    <asset:javascript src="bootstrap-timepicker.js"/>
    <asset:javascript src="datatable.js"/>
    <asset:javascript src="dataTables.min.js"/>
    <g:layoutHead/>
</head>
<body>

    <g:layoutBody/>


</body>
</html>
