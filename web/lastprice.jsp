
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
          
                
                <li><a href="Bidlist.jsp"  >Bidder List</a></li>
                <li><a href="lastprice.jsp" class="selected">Maximum_BidPrice</a></li>
                <li><a href="log.html" target="_top">LogOut</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->

 <h1 colspan="2"><div  align="center"> </div> </td>
                    </h1>
     <%!
            Connection con;
            
            PreparedStatement pst;
            ResultSet rs;
                        
            %>
            <%  
    //String id = request.getParameter("id");
    String BidderId = "";
    String price = "";
    String pid="";
    String pname="";
    String userId ="";
   // session.setAttribute("id",id);
    
            						//parses the string value AdminID to integer AId
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya?user=root&password=shravya");
        Statement st = con.createStatement();
            rs = st.executeQuery("select max(Currentprice),Product.ProductId,BidderId,pname from Product,Bid_Details where Bid_Details.ProductId=Product.ProductId group by pname;");	
         //executes the query and stores the result in resultset 'rs'
            
            %>
            
            
            <body background="resource/backd.jpg" height="1000" width="1000">  
            <div style="position: absolute; width: 50px; height: 28px; z-index: 3; left: 1000px; top: 350px" id="layer5">
                <font face="Arial Narrow" size="2">
                    <b><font color="#00AE2C"><a href="javascript:history.back()">
                    <font color="#000000"></font></a></font></b>
                </font>
            </div>
            <div style="position: top; width: 450px; height: 55px; z-index: 4; left: 600px; top: 350px" id="layer4">
                <font color="white"> <u><b><font face="white"
	size="5">Maximum Bidprice of each Product</font></b></u> </font>
            </div>
          
            <div style="position: top; width: 700px; height: 54px; z-index: 1; left: 300px; top: 400px" id="layer1">
            <table width="650" border="1" bordercolor="black">
                <tr>

                    <td width="180" align="center">
                                        <b><font face="Verdana" size="2">ProductName</font></b></td>
					<td align="center">
					<b><font face="Verdana" size="2">ProductId</font></b></td>
					<td align="center">
					
					<b>
					<font face="Verdana" size="2">Maximum_Bidprice</font></b></td>
                    
                                        
                </tr>
            <%
            while(rs.next())
            {
            	pid = rs.getString(2); //gets the output values from the executed query
            	//BidderId = rs.getString(3);
                price=rs.getString(1);
              	pname=rs.getString(4);
               
            
            
   
            %>
            <tr>
                <td width="150" align="left">
				<font color="white" face="Verdana" size="2"><%=pname%></font></td>
				<td  align="center">
				<font color="white" face="Verdana" size="2"><%=pid%></font></td>
               
                <td  align="center">
				<font color="white" face="Verdana" size="2"><%=price%></font></td> 
			
                       
                    </td>
                </tr>
            <%
            }
            %>
            </table>
        	
&nbsp;</div>
       
    
    </body>
    
</html>