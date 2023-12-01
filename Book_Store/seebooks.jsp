<%@page import="java.util.*" session="false" %>
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
    if(type!=1)
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
<h1>Information</h1>

<table border = "1" width = "400">
<tr>
<td><b>BookId</b></td>
<td><b>BookName</b></td>
<td><b>Author</b></td>
<td><b>ISSN</b></td>
</tr>
<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String title = "";
String id = "";
String author = "";
String issn = "";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from book_info");

while(rs.next()) {
 title = rs.getString("booktitle");
 id = rs.getString("bookid");
 author = rs.getString("author");
 issn = rs.getString("issn");
%>

<tr>
<td><% out.println(id); %></td>
<td><%= title %></td>
<td><%= author %></td>
<td><%= issn %></td>
</tr>
<%
}
%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

</table>
<br><br>
<a href="admin.jsp">Home</a> <br>
</body>
</html>