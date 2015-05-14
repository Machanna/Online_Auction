<%@page import="java.sql.Date"%>
<!--@shravya-->
<!--Updates the product table with the values entered in the web page -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
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
                <li>  <a href="#">My Products</a>
                     <ul>
                     <li><a href="viewproduct.jsp">Edit Product</a></li>
                     <li><a href="addproduct.html">Add Product</a></li>
                     <li><a href="delete.jsp">Delete Product</a></li>
                     </ul></li>
                    <li><a href="Bidwon.jsp">Winners List</a>
                </li>
  
                <li><a href="log.html" target="_top">Logout</a></li>
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->
    </html>
<%
        String id1=request.getParameter("id");//retreives the id given in the webpage and stores it in id1 attribute.
        int id=Integer.parseInt(id1);//string parameter is converted to int using parseInt function
        String pname=request.getParameter("pname");
        String price1=request.getParameter("price");
        float price=Float.parseFloat(price1);
        String incr_amt="1";
        String lastdate1=request.getParameter("lastdate");
        java.util.Date lastdate2 = new SimpleDateFormat("yyyy-mm-dd").parse(lastdate1);
        Date lastdate = new Date(lastdate2.getTime());
        //String user=(String)session.getAttribute("userId");
      Connection con=null;

 try {
                Class.forName("com.mysql.jdbc.Driver");//connects to the database

                con= DriverManager.getConnection("jdbc:mysql://localhost/shravya","root","shravya");
     //updates the product details with details entered in the web page
    PreparedStatement cstmt= con.prepareStatement("update Product set pname=? , price=? , incr_amt=?  where productId='"+id+"'");
             
 cstmt.setString(1,pname);
 cstmt.setFloat(2,price);
 cstmt.setString(3,incr_amt);
 //cstmt.setDate(4,lastdate);
 //cstmt.setInt(5,id);
       
                cstmt.executeUpdate(); //if the update is successfull below message is displayed

               out.println("Product updated successfully");
       }
       catch(Exception e){
        out.print("try not allowed"+e);
                }


%>
