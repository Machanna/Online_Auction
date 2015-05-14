
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
                     <li><a href="delete.jsp">DeleteProduct</a></li>
                     </ul>
                    <li><a href="Bidwon.jsp" class="selected">Winners List</a>
                </li>
  
                <li><a href="log.html" target="_top">Logout</a></li>
            </ul>
           
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->

     <%!
            java.sql.Connection con;
            
            PreparedStatement pst;
            ResultSet rs;
                        
            %>
            <%  
    //String id = request.getParameter("id");
    String BidderId = "";
    String price = "";
   // session.setAttribute("id",id);
        Calendar currentDate = Calendar.getInstance();
        currentDate.add(Calendar.DATE, 1);
SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
String datenow = formatter.format(currentDate.getTime());            				//parses the string value AdminID to integer AId
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya");
        java.sql.Statement st = con.createStatement();
                String query ="insert into  Bidder_Won_item (Totalpurchaseprice,BidderId) (select price,BidderId from (select CurrentPrice as price,BidderId,productId from Bid_Details where productId in (select productId from Product where lastdate= '"+datenow+"') and BidderId not in (select BidderId from Bidder_Won_Item) and CurrentPrice =(select max(CurrentPrice) from Bid_Details where productId in (select productId from Product where lastdate= '"+datenow+"') and BidderId not in (select BidderId from Bidder_Won_Item)) GROUP BY productId) as n1);";
                st.executeUpdate(query);
         //executes the query and stores the result in resultset 'rs'
        
            
            %>
            
            <%
             ResultSet rs1;
	String query3="select username,Bid_Details.bidderId,User.userId,bidderWonId,productId from Bidder_Won_item,Bid_Details,User where Bidder_Won_item.BidderId=Bid_Details.BidderId and Bid_Details.userId=User.userId";
	rs1=st.executeQuery(query3); 
            %>
        
        
        <font color="white">
	<table border="1" align="center" width="90%" cellspacing="0">
	<tr bgcolor="gray">
            <td>ProductId</td>
	<td>Bidder_Won_Id</td>
	<td>userId</td>
	<td>BidderId</td>
	<td>Username</td>
	
	</tr>
	<% while(rs1.next())
	{%>
	<tr>
            <td><%=rs1.getString(5) %></td>
	<td><%=rs1.getString(4) %></td>
	<td><%=rs1.getString(3) %></td>
	<td><%=rs1.getString(2) %></td>
	<td><%=rs1.getString(1) %></td>
	
	</tr>
			<%} %>	
	
	</table>
        </font>  
                  	
        
       </div>
    <div class="cleaner"></div>
    
    </br></br></div>
</body>
</html>
         
