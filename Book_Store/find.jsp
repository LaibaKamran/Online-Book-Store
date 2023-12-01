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
<title>Information</title></head>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>



<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String issn = request.getParameter("issn");

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("Select * from book_info where issn='"+issn+"' ");

if(rs.next())
{
  String id = rs.getString("bookid");
  String title = rs.getString("booktitle");
  String author = rs.getString("author");
  String price = rs.getString("price");


out.println("BookId: "+id+"<br>");
out.println("BookTitle: "+title+"<br>");
out.println("Author: "+author+"<br>");
out.println("ISSN: "+issn+"<br>");
out.println("Price: "+price+"<br>");
}
else
{out.println("No result found.");}


%>

<%
stmt.close();
con.close();
%>

<%
}
catch(Exception e){System.out.println("Exception");} %>

<br><br>
<a href="user.jsp">Home</a> <br>

</body>
</html>