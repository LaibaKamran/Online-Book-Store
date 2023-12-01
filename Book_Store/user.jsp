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
        out.println("<h1>Welcome "+email+"</h1>");
    } 
    if(type!=2)
    {
       response.sendRedirect("login.jsp");
    }
			
}

%>

<html>
<head>
<title>BookStore</title>
</head>
<body>

   
	<h1>What do you want to do?</h1>
    <a href="viewbooks.jsp">See all books</a> <br>
    <a href="search.jsp">Search for a book</a><br>
    <a href="buybook.jsp">Buy book</a><br>
    <a href="viewcart.jsp">View Cart</a><br>
    <a href="logout.jsp">Logout</a>

    

	

</body>
</html>