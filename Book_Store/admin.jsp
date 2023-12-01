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
<title>BookStore</title>
</head>
<body>

    <h1>Welcome to the Admin Panel</h1>
	<h1>What do you want to do?</h1>
    <a href="seebooks.jsp">See all books</a> <br>
    <a href="add.jsp">Add Book</a> <br>
    <a href="del.jsp">Delete Book</a><br>
    <a href="update.jsp">Update Book</a><br>
    <a href="logout.jsp">Logout</a>

    

	

</body>
</html>