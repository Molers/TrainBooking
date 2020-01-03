<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <script type="text/javascript">
            function checkForm(form) {

            <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["trainNumber"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the trainNumber ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }
            <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["numOfSeats"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the numOfSeats ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }

            }
        </script>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">TRAINTOPIA</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"> <a href="addTrain.jsp">Add Train</a></li>
                        <li> <a href="trainsInfo.jsp">Trains</a></li>
                        <li ><a href="addTrip.jsp">Add Trip</a></li>
                        <li><a href="tripsInfo.jsp">Trips</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div>
            <h1>
            <%
                if (null != request.getAttribute("errorMessage")) {
                    out.println(request.getAttribute("errorMessage"));
                }
            %>
            </h1>
            <h2>${message}</h2>
            <div class="container">
                <form action ="addTrain" name = "Add_train_form" onsubmit="return checkForm(this);" method="post" >
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> Train number </span>
                        <input class="form-control" name="trainNumber" type="text" > 
                    </div><br>
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> Number of seats </span>
                        <input class="form-control" name="numOfSeats" type="text" > 
                    </div><br>

                    <input type="submit" class="btn btn-success" value="ADD Train"  name = "ADD Train">
                </form>
            </div>
        </div>
    </body>
</html>
