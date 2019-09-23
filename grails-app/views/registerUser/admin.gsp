
<!DOCTYPE html>
<html lang="en">
<% def contextPath = request.getServletContext().getContextPath() %>
<head>
    <meta name="layout" content="main"/>
    <g:javascript>
        $(document).ready(function() {
            $('#userTable').dataTable( {
                "ajax":"${contextPath}/registerUser/userGrid",
                "bProcessing": true,
                "bAutoWidth":false,

                "columns": [
                    { "data": "firstName" },
                    { "data": "lastName" },
                    { "data": "userName" },
                    { "data": "phoneNo" },
                    { "data": "address" }
                ]
            } );
        } );

    </g:javascript>
</head>

<body>

<div class="container"  style="text-align: center">
    <h2>User list</h2>
</div>

    <div class="container" style="margin-top: 15px">
        <table id="userTable" name="userTable" class="w3-table" style="">
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


