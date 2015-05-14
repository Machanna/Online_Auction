<!--@shravya-->
<!--selects the Product Details-->
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
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
                <li><a href="#">My Products</a>
                     <ul>
                     <li><a href="viewproduct.jsp" class="selected">Edit Product</a></li>
                     <li><a href="addproduct.html">Add Product</a></li>
                     <li><a href="delete.jsp">Delete Product</a></li>
                     </ul>
                    <li><a href="Bidwon.jsp" >Winners List</a>
                </li>
  
                <li><a href="log.html" target="_top">Logout</a></li>
            </ul>
                    <br style="clear: left" />

                </div> <!-- end of ddsmoothmenu -->

            </div> <!-- END of templatemo_menu -->

                <!--selects the product details with the given  product Id in the web page -->
                <%
                    String id = "";
                    String pname = "";
                    String price = "";
                    String incr_amt = "";
                    String lastdate = "";
                    //String id = request.getParameter("id");
                    String user=(String)session.getAttribute("userId");
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/shravya", "root", "shravya");
                        String selectStoredProc = "SELECT * FROM product WHERE userId = '" + user + "'";

                        PreparedStatement ps = con.prepareStatement(selectStoredProc);
                        ResultSet rs = ps.executeQuery();
                      

                %>
                <!--creates product Id text box and as product Id  -->
                 <body background="resource/backd.jpg" height="1000" width="1000">  
            <div style="position: absolute; width: 50px; height: 28px; z-index: 3; left: 1000px; top: 350px" id="layer5">
                <font face="Arial Narrow" size="2">
                    <b><font color="#00AE2C"><a href="javascript:history.back()">
                    <font color="#000000"></font></a></font></b>
                </font>
            </div>
            <div style="position: top; width: 311px; height: 55px; z-index: 4; left: 600px; top: 350px" id="layer4">
                <font color="white"> <u><b><font face="white"
	size="5">My Products</font></b></u> </font>
            </div>
          
            <div style="position: top; width: 700px; height: 54px; z-index: 1; left: 300px; top: 400px" id="layer1">
            <table width="800" border="1" bordercolor="black">
                <tr>
                    <td width="180" align="center">
                                        <b><font face="Verdana" size="2">ProductId</font></b></td>
                    <td align="center">
                                        <b><font face="Verdana" size="2">ProductName</font></b></td>
					<td  width="50" align="center">
					<b><font face="Verdana" size="2">Price</font></b></td>
					<td width="50" align="center">
					
					<b>
					<font width="150" face="Verdana" size="2">LastDate to Bid</font></b></td>
                    
                                            <b>
                                                
                                            </b></td>
                                               </tr>
                                            <%
                                              while (rs.next()) {
                            id = rs.getString(1);//stores the selected attribues in to respective parameters
                            pname = rs.getString(2);
                            price = rs.getString(3);
                            //incr_amt = rs.getString(4);
                            lastdate = rs.getString(5);
                            
                      %>
                                        
             
          
            <tr>
                            <form name="f1" class="prod" method="post" action="changeproduct.jsp">  
                 <td width="150" align="left">
                     <font color="white" face="Verdana" size="2"><%=id%><input type="hidden" name="id" value="<%=id%>"/></font></td>
                <td width="150" align="center">
                    <font color="white" face="Verdana" size="2"><input value="<%=pname%>" name="pname"/></font></td>
				<td  align="center">
				<font color="white" face="Verdana" size="2"><input value="<%=price%>" name="price"/></font></td>
                <td  width="150" align="center">
				
				<font color="white" face="Verdana" size="2"><%=lastdate%><input type="hidden" value="<%=lastdate%>" name ="lastdate"/></font></td> 
				 
                                 <div class="buttons">
                                <td  align="center">
                                   
                                   <button type="submit" class="primaryAction">Update</button>
                                </td>
                                 </div>
                            </form>
                </tr>
                                
                         <%

                                }
                        rs.close();
                        rs = null;
                    } catch (Exception e) {
                        System.out.println(e.getLocalizedMessage());
                    } finally {
                    }
          %>
            </table>
        	           

&nbsp;</div>
       
    
    </body>
    
</html>

                                