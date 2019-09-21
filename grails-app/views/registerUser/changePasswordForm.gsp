<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="signup-form">
    <form action="changePassword" method="post">
        <g:if test="${flash.message}">
            <div class="alert alert-success">
               ${flash.message}
            </div>
        </g:if>
        <h2>Change password</h2>
        <div class="form-group">
            <input type="password" class="form-control" name="oldPassword" placeholder="Old Password" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="newPassword" placeholder="New Password" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required="required">
        </div>
        <div class="form-group" style="text-align: center">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a type="text" style="text-decoration: none;"
               href="${createLink(controller: 'registerUser', action: 'index')}" class="btn btn-worning">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
t>