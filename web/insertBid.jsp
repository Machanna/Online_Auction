
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
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


   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <STYLE type="text/css">
        H1 {
	   text-align: center
         }
        </STYLE>
        <STYLE type="text/css">
        H3 {
	  text-align: center
         }
         </Style>
    </head>
    <body>
      
        <h1><font color="#CD7F32">Your bid is success</font></h1>
	<br>
	<br>
	<br>
        <br>
	<br>
	<br>
	<br>
        <br>
	<br>
	<br>
	<br>
       
       
        <%
               
               
               boolean retval=false;
               
               String id=request.getParameter("id");//retreives the id given in the webpage and stores it in id1 attribute.
               //int id=Integer.parseInt(id1);//string parameter is converted to int using parseInt function
               String price1=request.getParameter("price");
               System.out.println("price " + price1);
               double price=Double.parseDouble(price1);
               Class.forName("com.mysql.jdbc.Driver");
               java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root", "shravya");
               Statement st= con.createStatement();
               Calendar currentDate = Calendar.getInstance();
SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
String datenow = formatter.format(currentDate.getTime());
                    
			String user=(String)session.getAttribute("userId");
                        
                        String query = "insert into Bid_Details(Currentprice,Biddate,productId,userId) values ('"+price+"','"+datenow+"','"+id+"','"+user+"')"; 
                         System.out.println("Q:"+query);
                        int i=st.executeUpdate(query); 
	if(i==0)
	{
%>
<jsp:forward page="error1.html" />	
                        
		<%
	}

       else {
            //if all values are inserted successfully welcome page is opened
%>

              
               <% 
}
%>
        
        

    </body>
</html>