
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
<%
  int r=0;
if(!(null==session.getAttribute("userId")))
{
//String prodId=request.getParameter("productId"); 
String pname=request.getParameter("pname");
String price=request.getParameter("price");
String inc="1";
String od;
String day=request.getParameter("day"); 
String month=request.getParameter("month");
String year=request.getParameter("year");
od=year+month+day;
Calendar currentDate = Calendar.getInstance();
SimpleDateFormat formatter= 
new SimpleDateFormat("yyyy-MM-dd");
String datenow = formatter.format(currentDate.getTime());
String user=(String)session.getAttribute("userId");
int i=1;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya"); 
Statement st= con.createStatement(); 
ResultSet rs; 
String od1=year+"-"+month+"-"+day;
java.util.Date datenow1 = new SimpleDateFormat("yyyy-mm-dd").parse(datenow);
        Date datenow2 = new Date(datenow1.getTime());
        java.util.Date od2 = new SimpleDateFormat("yyyy-mm-dd").parse(od1);
        Date od3 = new Date(od2.getTime());
      
        
 if(!(od3.before(datenow2))) 
 {          
    
     int k=st.executeUpdate("insert into product (pname,price,incr_amt,lastdate,userId) values ('"+pname+"','"+price+"','"+inc+"','"+od1+"','"+user+"')");
     r=1;     
 }
                        
%>



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
            <ul>
                <li><a href="mainpage.jsp" class="selected">Home</a></li>
                <li><a href="#">My Products</a>
                     <ul>
                     <li><a href="viewproduct.jsp">Edit Product Details</a></li>
                     <li><a href="addproduct.html">Add Products</a></li>
                     <li><a href="delete.jsp" >Delete Product</a></li>
                     </ul>
                    <li><a href="Bidwon.jsp" >Winners List</a>
                </li>
  
                <li><a href="log.html" target="_top">Logout</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
   <!-- </div>  END of templatemo_menu -->
       
	<!-- END of templatemo_middle 
	    
             -->
</font></h3>
<br><font color="cyan"><br/><br/>
        <%
        if(r==1)
           {
          %>  
Product Added Successfully
<%
        }
               else{
            
        %>
        please enter valid date
        <%
               }
        %>
</font><br/><br/><br/><br/><br/><br/>

<div id="templatemo_footer">
    	<p>
			<<a href="mainpage.jsp">Home</a> | <a href="log.html">Logout</a> 
		</p>

    	Copyright © 2012 <a href="#">Netbidz</a> 
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