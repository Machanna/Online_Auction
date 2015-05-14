package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.sql.*;

public final class Bidwon_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            java.sql.Connection con;
            
            PreparedStatement pst;
            ResultSet rs;
                        
            
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<title>NetBidz</title>\n");
      out.write("<link href=\"css/templatemo_style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/ddsmoothmenu.css\" />\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/ddsmoothmenu.js\">\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("ddsmoothmenu.init({\n");
      out.write("\tmainmenuid: \"top_nav\", //menu DIV id\n");
      out.write("\torientation: 'h', //Horizontal or vertical menu: Set to \"h\" or \"v\"\n");
      out.write("\tclassname: 'ddsmoothmenu', //class added to menu's outer DIV\n");
      out.write("\t//customtheme: [\"#1c5a80\", \"#18374a\"],\n");
      out.write("\tcontentsource: \"markup\" //\"markup\" or [\"container_id\", \"path_to_menu_file\"]\n");
      out.write("})\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"css/jquery.dualSlider.0.2.css\" />\n");
      out.write("<script src=\"js/jquery-1.3.2.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"js/jquery.easing.1.3.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"js/jquery.timers-1.2.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"js/jquery.dualSlider.0.3.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    \n");
      out.write("    $(document).ready(function() {\n");
      out.write("        \n");
      out.write("        $(\".carousel\").dualSlider({\n");
      out.write("            auto:true,\n");
      out.write("            autoDelay: 6000,\n");
      out.write("            easingCarousel: \"swing\",\n");
      out.write("            easingDetails: \"easeOutBack\",\n");
      out.write("            durationCarousel: 1000,\n");
      out.write("            durationDetails: 600\n");
      out.write("        });\n");
      out.write("        \n");
      out.write("    });\n");
      out.write(" </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div id=\"templatemo_wrapper\">\n");
      out.write("\t<div id=\"templatemo_header\">\n");
      out.write("       \t<div id=\"site_title\">\n");
      out.write("        \t<h1><a href=\"#\">Netbidz</a></h1>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("        <div class=\"cleaner\"></div>\n");
      out.write("    </div> <!-- END of templatemo_header -->\n");
      out.write("    \n");
      out.write("    <div id=\"templatemo_menu\">\n");
      out.write("    \t<div id=\"top_nav\" class=\"ddsmoothmenu\">\n");
      out.write("              <ul>\n");
      out.write("                <li><a href=\"mainpage.jsp\" class=\"selected\">Home</a></li>\n");
      out.write("                <li><a href=\"#\">My Products</a>\n");
      out.write("                     <ul>\n");
      out.write("                     <li><a href=\"viewproduct.jsp\">Edit Product</a></li>\n");
      out.write("                     <li><a href=\"addproduct.html\">Add Product</a></li>\n");
      out.write("                     <li><a href=\"delete.jsp\">DeleteProduct</a></li>\n");
      out.write("                     </ul>\n");
      out.write("                    <li><a href=\"Bidwon.jsp\" class=\"selected\">Winners List</a>\n");
      out.write("                </li>\n");
      out.write("  \n");
      out.write("                <li><a href=\"log.html\" target=\"_top\">Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("           \n");
      out.write("            <br style=\"clear: left\" />\n");
      out.write("\t\t\t\n");
      out.write("        </div> <!-- end of ddsmoothmenu -->\n");
      out.write("       \n");
      out.write("    </div> <!-- END of templatemo_menu -->\n");
      out.write("\n");
      out.write("     ");
      out.write("\n");
      out.write("            ");
  
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
        
            
            
      out.write("\n");
      out.write("            \n");
      out.write("            ");

             ResultSet rs1;
	String query3="select username,Bid_Details.bidderId,User.userId,bidderWonId,productId from Bidder_Won_item,Bid_Details,User where Bidder_Won_item.BidderId=Bid_Details.BidderId and Bid_Details.userId=User.userId";
	rs1=st.executeQuery(query3); 
            
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <font color=\"white\">\n");
      out.write("\t<table border=\"1\" align=\"center\" width=\"90%\" cellspacing=\"0\">\n");
      out.write("\t<tr bgcolor=\"gray\">\n");
      out.write("            <td>ProductId</td>\n");
      out.write("\t<td>Bidder_Won_Id</td>\n");
      out.write("\t<td>userId</td>\n");
      out.write("\t<td>BidderId</td>\n");
      out.write("\t<td>Username</td>\n");
      out.write("\t\n");
      out.write("\t</tr>\n");
      out.write("\t");
 while(rs1.next())
	{
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("            <td>");
      out.print(rs1.getString(5) );
      out.write("</td>\n");
      out.write("\t<td>");
      out.print(rs1.getString(4) );
      out.write("</td>\n");
      out.write("\t<td>");
      out.print(rs1.getString(3) );
      out.write("</td>\n");
      out.write("\t<td>");
      out.print(rs1.getString(2) );
      out.write("</td>\n");
      out.write("\t<td>");
      out.print(rs1.getString(1) );
      out.write("</td>\n");
      out.write("\t\n");
      out.write("\t</tr>\n");
      out.write("\t\t\t");
} 
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t</table>\n");
      out.write("        </font>  \n");
      out.write("                  \t\n");
      out.write("        \n");
      out.write("       </div>\n");
      out.write("    <div class=\"cleaner\"></div>\n");
      out.write("    \n");
      out.write("    </br></br></div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("         \n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
