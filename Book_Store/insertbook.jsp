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



<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String id = request.getParameter("id");
String title = request.getParameter("title");
String author= request.getParameter("author");
String issn = request.getParameter("issn");
String price = request.getParameter("price");

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("Select * from book_info where issn='"+issn+"' ");

if(rs.next())
{
    out.println("ISSN of book must be unique. This ISSN is already available!");
}

else{
int result = stmt.executeUpdate("INSERT INTO book_info(bookid,booktitle,author,issn,price)VALUES('"+ id + "','" + title+ "','" + author + "','" + issn + "','"+price+"' ) " );

if(result==1)
{out.println("Book added Successfully");}
else
{out.println("Book was not added.");}
}

%>

<%
stmt.close();
con.close();
%>

<%
}
catch(Exception e){System.out.println("Exception");} %>

<br><br>

<a href="admin.jsp">Home</a> <br>

</body>
</html>