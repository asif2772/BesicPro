<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main"/>
</head>
<!------ Include the above in your HEAD tag ---------->
<body>
    <div class="login-form">

        <form action='${postUrl}' method='POST' id='loginForm'>
            <h2>Log in</h2>
            <div class="form-group">
                <input type="text" class="form-control" name='username' id="username" placeholder="Username" required="required">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name='password' id='password' placeholder="Password" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Log in</button>
            </div>
        </form>
        <p class="text-center"><a href="${createLink(controller: 'registerUser', action: 'newRegister')}">Create an Account</a></p>
    </div>
    </body>
</html>
