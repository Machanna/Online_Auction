<%-- 
    Document   : bid
    Created on : Apr 27, 2014, 12:34:46 AM
    Author     : shravya
    Description: This page is used to select the Car
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBidz</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">
</script>
</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<link rel="stylesheet" type="text/css" media="all" href="css/jquery.dualSlider.0.2.css" />
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.timers-1.2.js" type="text/javascript"></script>
<script src="js/jquery.dualSlider.0.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    
    $(document).ready(function() {
        
        $(".carousel").dualSlider({
            auto:true,
            autoDelay: 6000,
            easingCarousel: "swing",
            easingDetails: "easeOutBack",
            durationCarousel: 1000,
            durationDetails: 600
        });
        
    });
 </script>
</head>
<body>

<div id="templatemo_wrapper">
	<div id="templatemo_header">
       	<div id="site_title">
        	<h1><a href="#">Netbidz</a></h1>
        </div>
            
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_header -->
    
    <div id="templatemo_menu">
    	<div id="top_nav" class="ddsmoothmenu">
            <ul>
                <li><a href="mainpage.jsp" class="selected">Home</a></li>
                <li><a href="bid.jsp" target="_top" class="selected">Bid</a></li>
                <li><a href="log.html" target="_top">LogOut</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
        function validateForm()
        {
        if(document.frm.userid.value==="")
        {
           alert("User Name should be left blank");
           document.frm.userid.focus();
           return false;
        }
        else if(document.frm.pwd.value==="")
        {
           alert("Password should be left blank");
           document.frm.pwd.focus();
           return false;
         }
        }
        </script>
    </head>
    <body>
        <%
            //connecting to the database
           Class.forName("com.mysql.jdbc.Driver");
               java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root", "shravya");
               Statement st= con.createStatement();
               ResultSet rs;
               rs =st.executeQuery("select * from Product;") ;
         %>

<center>
    <h1><font color="white">Select Product</font></h1>
    <form name=myname method=post action="insertBid.jsp" onsubmit="return validateForm()" >
        <%--for security reasons re entering the username and password--%>
        <font color="white">
        <p>Re Enter Userid</p> 
        <input type="text" name="userid" />
        <p>Re Enter Password</p>
        <input type="text" name="password" />
        <%--displaying the drop down list of all the vehicleID'S available to buy--%>
        <p>ProductID</p></font>
        <select name="productid">
        <%  while(rs.next()){ %>
            <option><%= rs.getInt(1)%></option>
        <% } %>
               </select>

        <font color="white">
            
        <input type="text" name="price" />
        <p>Bid Price</p></font>
        <input type="submit" value="Bid">
        
    </form>
</center>
    </body>
</html>