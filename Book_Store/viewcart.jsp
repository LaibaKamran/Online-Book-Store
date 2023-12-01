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
<h1>Information</h1>

<table border = "1" width = "400">
<tr>
<td><b>User Name</b></td>
<td><b>BookName</b></td>
<td><b>Price</b></td>
<td><b>Quantity</b></td>
</tr>
<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String username = "";
String title = "";
int price = 0;
int quantity = 0;

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("Select * from my_cart where username='"+email+"' ");

while(rs.next()) {
  username = rs.getString("username");
 title = rs.getString("bookname");
 price = rs.getInt("price");
 quantity = rs.getInt("quantity");
%>

<tr>
<td><% out.println(username); %></td>
<td><%= title %></td>
<td><%= price %></td>
<td><%= quantity %></td>
<td><% out.println("<form action=\"remove.jsp\" method=\"get\"> "+"<input type=\"submit\" value  =\"remove\">"+ "<input type=\"hidden\" value  =\""+title+"\" name=\"title\">"+"</form>"); %></td>

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
<br>
<a href="checkout.jsp">Checkout</a>
<br><br>
<a href="emptycart.jsp">Empty Cart</a> <br><br>
<a href="user.jsp">Home</a> <br>
</body>
</html>
