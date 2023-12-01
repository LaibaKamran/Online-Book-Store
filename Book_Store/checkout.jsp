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
    if(type!=2)
    {
       response.sendRedirect("login.jsp");
    }
			
}

%>
<html>
<head>
<title>Empty Cart</title></head>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>



<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

String issn = request.getParameter("issn");
int total=0;

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from my_cart  where username='"+email+"' ");

while(rs.next()){

    int price=rs.getInt("price");
    int quantity=rs.getInt("quantity");

    total=total+(price*quantity);

}
if(total>0)
{
    int res = stmt.executeUpdate("DELETE FROM my_cart where username='"+email+"' ");
    out.println("Your order has been replaced!<br>");
    out.println("Your payment method is cash on delivery.<br>");
    out.println("Total amount to be paid is "+total);
}

else
{
    out.println("Cart is empty!");
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

<a href="user.jsp">Home</a> <br>

</body>
</html>