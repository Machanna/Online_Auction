<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%
//Admin can add,delete or update the product list ,admin is the seller
//--following request.getParameter takes values which are entered during login  and they are stored in respective parameters given(eg pwd)
String user=request.getParameter("username"); 
String ad="administrator";//default username for admin
String adpwd="admin";//default password for admin
session.setAttribute("Name",user);//user is stored in the session attribute
String pwd=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); //connects to the database
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya"); 
java.sql.Statement st= con.createStatement(); 
ResultSet rs; //stores the executed query in the resultset
//selects the user details with the username and password which are given in the login page
String query="select * from user where username=\""+user+"\" and password= \""+pwd+"\"";
rs=st.executeQuery(query); 
if(rs.next())//executes the query and checks whether the given username and password matches  username and 
             //password in user table,If match is present allows user to login in to the site else login error
             //  page displays    
         {
       String username=rs.getString("username");
       String password=rs.getString("password");
        if(user.equals(username) && pwd.equals(password))
             {
        	   
        		response.sendRedirect("mainpage.jsp");//on success user directs into main page
%>
                 
<%
      	 }
          
        
        else    response.sendRedirect("loginerror.html");    %>
        	 
                     <%
     }
else if(user.equals(ad) && pwd.equals(adpwd))//If admin logins in with his username and password ,he is directed to admin page
{response.sendRedirect("adminmain.html");
	 %>
	 
             <%
}    

else response.sendRedirect("loginerror.html");        %>

        <%
%>
