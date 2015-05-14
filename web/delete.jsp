<!--@shravya-->
<!--Selects the Products which are to be deleted by using checkboxes -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,javax.sql.*"%>
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
                <li><a href="#">My Products</a>
                     <ul>
                     <li><a href="viewproduct.jsp">Edit Product</a></li>
                     <li><a href="addproduct.html">Add Product</a></li>
                     <li><a href="delete.jsp" class="selected">DeleteProducts</a></li>
                     </ul></li>
                    <li><a href="Bidwon.jsp" >Winners List</a>
                </li>
  
                <li><a href="log.html" target="_top">Logout</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->

<%
 String user=(String)session.getAttribute("userId");
Class.forName("com.mysql.jdbc.Driver");//connects to the database
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya",
            "root", "shravya");
    
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("Select * from Product where userId = '" + user + "'");//selects the Product Details 
int i=0;
%>



    <font color="white" size="5">
    <label>Deletes selected Product</label></font>

<form name=myname method=post
action="deleteproduct.jsp">
    <center><table border="1">
<tr><td>Select</td>
<td>ProductId</td><td>pname</td><td>price</td><td>lastdate</td><td>userId</td>
</tr>
<%
while(rs.next()){ %>
<tr>
<td><input type="checkbox" name="check<%=i%>"
value=<%=rs.getString(1)%>/></td>
<%
i++;
%>
<td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td>
</tr>
<%}%>
</table>

<input type="submit" value="Delete"></form> <!-- On clicking delete all the selected Product details will be deleted -->
</center>
  
       </div>
    
    </br></br></div>
</body>
</html>