<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="signup-form">
    <form action="createUser" method="post">
        <g:if test="${flash.message}">
            <div class="alert alert-success">
               ${flash.message}
            </div>
        </g:if>
        <h2>Register</h2>
        <p class="hint-text">Create your account. It's free and only takes a minute.</p>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6"><input type="text" class="form-control" name="firstName" placeholder="First Name" ></div>
                <div class="col-xs-6"><input type="text" class="form-control" name="lastName" placeholder="Last Name" ></div>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="address" placeholder="Address">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="phoneNo" placeholder="Phone no" >
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="email" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="text" value="${new Date()}" id="dateOfBirth" class="form-control" placeholder="Date of birth" name="dateOfBirth" required="required"/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>

        <div class="form-group" style="text-align: center">
            <button type="submit" class="btn btn-primary">Register</button>
            <a type="text" style="text-decoration: none;"
               href="${createLink(controller: 'login', action: 'auth')}" class="btn btn-worning">Cancel</a>
        </div>
    </form>

    <div class="text-center">Already have an account? <a href="#">Sign in</a></div>

</div>
</body>
</html>

<script type="text/javascript">
    $('#dateOfBirth').datetimepicker({
        format: 'yyyy-mm-dd'
    });
</script>