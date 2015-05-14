<!--@shravya-->
<!--Displays the product list when buyer logs in to the web page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
Class.forName("com.mysql.jdbc.Driver"); //database connection establishment 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya"); 
java.sql.Statement st= con.createStatement(); 
ResultSet rs;
Calendar currentDate = Calendar.getInstance();
SimpleDateFormat formatter= 
new SimpleDateFormat("yyyy-MM-dd");
String datenow = formatter.format(currentDate.getTime());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBidz</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/jquery.dualSlider.0.2.css" />
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
    <center>
    <div>
    
	<div id="content" class="float_l">
	<h1>New Products</h1><!--selects the product details -->
        <h3>Please bid on the products starting with product's price </h3>
			<%
                        String id = "";
                    String pname = "";
                    String price1 = "";
                    String incr_amt = "";
                    String lastdate = "";
			 int i=0;
                         String user=(String)session.getAttribute("userId");
			String query1="select productId,pn  ame,price,incr_amt,lastdate,userId from product where lastdate >= '"+datenow+"' and userId != '" + user + "' and productId NOT IN (select productId from Bid_Details where userId = '"+user+"')";
			rs=st.executeQuery(query1); 
			%>
<%
 while (rs.next())//displays the product details   
          {
	      i++;   
	       if(i<=2)
	       {
                 id = rs.getString(1);//stores the selected attribues in to respective parameters
                            pname = rs.getString(2);
                            price1 = rs.getString(3);
                            incr_amt = rs.getString(4);
                            lastdate = rs.getString(5);
	    %>
	    <div class="product_box">
                <form name="auction" method="post" action="insertBid.jsp" id="auction">
               <font color="black" size="2pt"><b><%=id%><input type="hidden" name="id" value="<%=id%>" /></b></font>
               <br/><p class="product_price"><br/>$<%=price1%></p>
               Last Date: <b><%=lastdate%></b><br/><br/>
               Product Name   :  <b><%=pname%></b><br/><br/>
               <font color="Black" size="2pt"> <input type="text" name="price" id="acprice"/> 
                   <p>Bid Price</p></font>
                <center>
                <input type="submit" value="Bid" /></center>
                </form>
        </div> 
	 
	 
	 	<% }
	       else
	       {
	    	   i=0;
                   id = rs.getString(1);//stores the selected attribues in to respective parameters
                            pname = rs.getString(2);
                            price1 = rs.getString(3);
                            incr_amt = rs.getString(4);
                            lastdate = rs.getString(5);
	    	   %><div class="product_box no_margin_right">
                <form name="auction1" method="post" action="insertBid.jsp"  id="auction1">           	   
               <font color="black" size="2pt"><b><%=id%></b><input type="hidden" name="id" value="<%=id%>" /></b></font>
               <br/><p class="product_price"><br>$<%=price1%></p>
                Last Date: <b><%=lastdate%></b><br/><br/>
                Product Name   :  <b><%=pname%></b><br/><br/>
                <font color="Black" size="2pt"> <input type="text" name="price" id="ac1price"/><p>Bid Price</p></font>
                <center>
                        <input type="submit" value="Bid"/></center>
                </form>
       </div> 
	      <%
	      }
       
                       
                                               }
                           rs.close();
	       
	       %>
		 
		 
		 <br/>
</div></div>
                                    </center>

</body>
</html>
