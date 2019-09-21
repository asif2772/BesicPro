
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main"/>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Profile</a></li>
            <li><a href="${createLink(controller: 'registerUser', action: 'changePasswordForm')}">Change password</a></li>
            <li><a href="${createLink(controller: 'logout')}">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="signup-form">
    <div class="signup-form">
        <h2>Profile Info</h2>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6">
                    <label><span>First name</span></label>
                    <input type="text" class="form-control" value="${userInfo? userInfo.firstName : ''}" readonly>
                </div>
                <div class="col-xs-6">
                    <label><span>Last name</span></label>
                    <input type="text" class="form-control" value="${userInfo? userInfo.lastName : ''}" readonly>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label><span>Address</span></label>
            <input type="text" class="form-control" value="${userInfo? userInfo.address : ''}" readonly>
        </div>
        <div class="form-group">
            <label><span>Phone no</span></label>
            <input type="text" class="form-control" value="${userInfo? userInfo.phoneNo : ''}" readonly>
        </div>
        <div class="form-group">
            <label><span>E-mail</span></label>
            <input type="text" class="form-control" value="${userInfo? userInfo.username : '' }" readonly>
        </div>
        <div class="form-group">
            <label><span>Date of birth</span></label>
            <input type="text" class="form-control" value="${userInfo? userInfo.dateOfBirth : '' }" readonly>
        </div>
    </div>
</div>
</body>
</html>


