<%@page import="java.util.*" import="java.sql.*" session="false" %>
<%
String email = "";
int type=0;
HttpSession session = request.getSession(false);
if(session==null)
{
	response.sendRedirect("login.jsp");
}
else 
{
    if (session.getAttribute("email") != null && session.getAttribute("type") != null)
    {
        email = (String) session.getAttribute("email");
        type = (int) session.getAttribute("type");
    } 
    if(type!=2)
    {
       response.sendRedirect("login.jsp");
    }
			
}

%>

<html>
<head>
<title>Delete-Book</title></head>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>



<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String title = request.getParameter("title");

Statement stmt = con.createStatement();
int rs = stmt.executeUpdate("DELETE FROM my_cart where bookname='"+title+"' AND username ='"+email+"' ");

if(rs==1){
  out.println("Record deleted from cart!");		
}
else
{out.println("Record not found");}


%>

<%
stmt.close();
con.close();
%>

<%
}
catch(Exception e){System.out.println("Exception");} %>

<br><br>

<a href="viewcart.jsp">View Cart</a><br><br>

<a href="user.jsp">Home</a> <br>

</body>
</html>