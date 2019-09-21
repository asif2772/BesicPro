
<!DOCTYPE html>
<html lang="en">
<% def contextPath = request.getServletContext().getContextPath() %>
<head>
    <meta name="layout" content="main"/>
</head>

<script type="text/javascript">


function test() {
          alert('ssdf')
}



    $(document).ready(function() {

        $('#saf').hide()


        alert('ssdf')
        $('#userTable').dataTable( {

            "ajax":"${contextPath}/registerUser/userGrid",
            "bProcessing": true,
            "bAutoWidth":false,

            "columns": [
                { "data": "vendorCode" },
                { "data": "vendorName" },
                { "data": "email" },
                { "data": "creditLimit" },
                { "data": "action" }
            ]

        } );

    } );
</script>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li onclick="test()" class="active"><a href="#">Profile</a></li>
            <li id="saf"><a href="#">Change password</a></li>
            <li><a href="${createLink(controller: 'logout')}">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="signup-form">
    <table id="userTable" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Start date</th>
            <th>Salary</th>
        </tr>
        </thead>
    </table>
</div>
</body>
</html>


