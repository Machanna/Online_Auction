<!--This the main page which buyer is navigated to where he can view the list of products -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!Connecting to the database>
<% 
if(!(null==session.getAttribute("userId")))
{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya"); 
java.sql.Statement st= con.createStatement(); 
//saving the executed query in the resultset
ResultSet rs; 
//storing name in the session variable
String Name=(String)session.getAttribute("Name");
String user=(String)session.getAttribute("userId");
%>
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
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
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
            
                <a href="mainpage.jsp" class="selected">Home</a> | <a href="addproduct.html" target="_top">Add Product</a> |  <a href="viewproduct.jsp" target="_top">Edit Product Details</a> |  <a href="delete.jsp" target="_top">Delete Products</a> |  <a href="Bidwon.jsp" class="selected">Won</a> |  <a href="log.html" target="_top">Logout</a> 
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->
       
	<!-- END of templatemo_middle -->
        <div id="menu_second_bar" style="position:relative;top:-10px">
        	<div id="top_shopping_cart">
            	<font color="white" size="4pt">Hi, <strong><%=session.getAttribute("Name") %></strong></font>
                
	     
	<!displays the list of products (under added today tab) which are added on the day user visits the website. eg:suppose a product is added on april 29th and user visits the site on the same day ,then he can view that product under added today tab>  	
    <div id="templatemo_main">
                     
                 <div id="content" class="float_r">
		    	<iframe src="auctionlist.jsp" name="list" width="100%" height="600px" frameborder="0" marginwidth="0px" marginheight="0px"></iframe>
                 </div>
	
                    </div></div>
                  
                	
                    
                  
                     
                </div>
            </div>
                  </div>
       
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_main -->
    
    <div id="templatemo_footer">
    	<p>
			<a href="mainpage.jsp">Home</a>| <a href="log.html">Logout</a> 
		</p>

    	Copyright © 2014 <a href="#">Netbidz</a> 
    </div> <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->

</body>
</html>
 
<%

}
else
{
	response.sendRedirect("login.html");
}
%>


