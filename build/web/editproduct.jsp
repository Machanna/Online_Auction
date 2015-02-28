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
                        <li><a href="adminmain.html" class="selected">Home</a></li>
                        <li><a href="log.html" target="_top">Logout</a></li>
                    </ul>
                    <br style="clear: left" />

                </div> <!-- end of ddsmoothmenu -->

            </div> <!-- END of templatemo_menu -->

            <form name="f1" class="prod" method="post" action="changeproduct.jsp">  
                <!--selects the product details with the given  product Id in the web page -->
                <%
                    String pname = "";
                    String price = "";
                    String id = request.getParameter("id");
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/shravya", "root", "shravya");
                        String selectStoredProc = "SELECT * FROM product WHERE productId = '" + id + "'";

                        PreparedStatement ps = con.prepareStatement(selectStoredProc);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            id = rs.getString(1);//stores the selected attribues in to respective parameters
                            pname = rs.getString(2);
                            price = rs.getString(3);
                        }
                        rs.close();
                        rs = null;
                    } catch (Exception e) {
                        System.out.println(e.getLocalizedMessage());
                    } finally {
                    }

                %>
                <!--creates product Id text box and as product Id  -->
                Product ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text"  name="id" value="<%=id%>"><br>
                        <label>Product Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span><input type="text"  name="pname" value="<%=pname%>"></span></label><br>
                            <label>Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span><input type="text"  name="price" value="<%=price%>"></span></label><br>
                                <div class="buttons">
                                    <button type="submit" class="primaryAction">Edit</button>
                                    <button type="reset" class="primaryAction">Clear</button>
                                </div> 
                                </form>
                                </body>

                                