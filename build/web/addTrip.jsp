

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <script type="text/javascript">
            function checkForm(form)
            {
            <%--  Train Number --%>
                if (form.trainNum.value === "") {
                    alert("Error: Please Enter the trainNumber  !");
                    form.trainNum.focus();
                    return false;
                }

            <%--  source--%>
                if (form.source.value === "") {
                    alert("Error: Please Enter the source  !");
                    form.source.focus();
                    return false;
                }
            <%--   destination --%>
                if (form.destination.value === "") {
                    alert("Error: Please Enter the  destination  !");
                    form.destination.focus();
                    return false;
                }
            <%--   departureTime --%>
                if (form.departureTime.value === "") {
                    alert("Error: Please Enter the  departureTime  !");
                    form.departureTime.focus();
                    return false;
                }
            <%--    arrivalTime --%>
                if (form.arrivalTime.value === "") {
                    alert("Error: Please Enter the   arrivalTime  !");
                    form.arrivalTime.focus();
                    return false;
                }
            <%--   date --%>
                if (form.date.value === "") {
                    alert("Error: Please Enter the  date  !");
                    form.date.focus();
                    return false;
                }
            <%--    price --%>
                if (form.price.value === "") {
                    alert("Error: Please Enter the  date  !");
                    form.price.focus();
                    return false;
                }
                var z = document.forms["add_trip_form"]["price"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for price ! (Allowed input:0-9)");
                    form.price.focus();
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
                        <li> <a href="addTrain.jsp">Add Train</a></li>
                        <li> <a href="trainsInfo.jsp">Trains</a></li>
                        <li class="active"><a href="#">Add Trip</a></li>
                        <li><a href="tripsInfo.jsp">Trips</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container">
            <form name="add_trip_form" onsubmit="return checkForm(this);" method="post" action="addTrip" >
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Trip number </span>
                    <input class="form-control" placeholder="Enter trip number" type="text" name="tripNum" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Train number </span>
                    <input class="form-control" placeholder="Enter Train Number" type="text" name="trainNum" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Source </span>
                    <input class="form-control" placeholder="Source" type="text" name="source" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Destination </span>
                    <input class="form-control" placeholder="Destination" type="text" name="destination" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Departure Time </span>
                    <input class="form-control" placeholder="Departure Time" type="time" name="departureTime" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Arrival Time </span>
                    <input class="form-control" placeholder="Arrival Time" type="time" name="arrivalTime" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Date </span>
                    <input class="form-control" placeholder="Date" type="date" name="date" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span style="size: " class="input-group-addon form-inline" id="basic-addon1"> Reserved Seats </span>
                    <input class="form-control" placeholder="Seats" type="text" name="seats" value="" required/> <br>
                </div> <br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Price </span>
                    <input class="form-control" placeholder="Price" type="text" name="price" value="" required/> <br>
                </div><br>

                <input type="submit" class="btn btn-success" value="Add Trip" />
            </form>
        </div>
    </body>
</html>
