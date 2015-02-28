<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%
//following request.getParameter takes values which are entered using registration page and they are stored in respective parameters given(eg pwd)
String pwd=request.getParameter("password1");
String uT=request.getParameter("userType"); 
String ph=request.getParameter("phoneNo");
String add=request.getParameter("Address"); 
String user=request.getParameter("username"); 
//password and name is saved in the session
session.setAttribute("password",pwd);
session.setAttribute("Name",user);

//connecting to the database using jdbc
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shravya","root","shravya"); 
Statement st= con.createStatement(); 
//executed query is saved in result set
ResultSet rs; 
//values are inserted into the user table using below command
        String query = "insert into user(password,userType,phoneNo,Address,username) values ('"+pwd+"','"+uT+"','"+ph+"','"+add+"','"+user+"')";
        System.out.println("Q:"+query);
	int i=st.executeUpdate(query); 
	if(i==0)
	{
%>
<jsp:forward page="error.html" />	
		
<%
	}

       else {
            //if all values are inserted successfully welcome page is opened
%>
<jsp:forward page="welcome.jsp" />
<% 
}
%>