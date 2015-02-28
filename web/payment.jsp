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
                <li><a href="admin.jsp" >Delete Product</a></li>
                <li><a href="productdetails.jsp" target="_top">Update Product</a></li>
                <li><a href="Bidlist.jsp"  >Bidder List</a></li>
                <li><a href="payment.jsp" class="selected">Payment Details</a></li>
                <li><a href="lastprice.jsp" >Maximum_BidPrice</a></li>
                <li><a href="log.html" target="_top">LogOut</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->

<%
Class.forName("com.mysql.jdbc.Driver");//connects to the database
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya",
            "root", "shravya");
    
    Statement st = con.createStatement();
    ResultSet rs;
    
%>


            
            	<%
	String query3="select Totalpurchaseprice,paymentId,username,User.userId from Bidder_Won_item,Payment,User where Bidder_Won_item.BidderWonId=Payment.BidderWonId and Payment.userId=User.userId";
	rs=st.executeQuery(query3);  %>
	<font color="white">
	<table border="1" align="center" width="90%" cellspacing="0">
	<tr bgcolor="gray">
	<td>user Id</td>
	<td>username</td>
	<td>payment Id</td>
	<td>Purchase price</td>
	
	</tr>
	<% while(rs.next())
	{%>
	<tr>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(1) %></td>
	
	</tr>
			<%} %>	
	
	</table>
        </font>  
                  	
        
       </div>
    <div class="cleaner"></div>
    
    </br></br></div>
</body>
</html>