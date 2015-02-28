<!--@shravya-->

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
String name=request.getParameter("name").toString();
System.out.println(name);
int x=name.length();
String data ="";
//during registration if usename is less than 6 characters error message will be displayed 
try
{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya", "root", "shravya");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from User where username='"+name+"'");
           int count=0;
           while(rs.next())
           {
             count++;
           }
          if(x>4)
          {   
             if(count>0)
             data="Not Available";
          
             else
             data="Available";
          }
          else
          {
        	  data="Username too Short";
          }
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>
