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
    if(type!=1)
    {
       response.sendRedirect("login.jsp");
    }
			
}

%>


<html>
<head>
<title>Update-book</title></head>

<body>

<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String author = request.getParameter("author");
String oldissn = request.getParameter("oldissn");
String newissn = request.getParameter("newissn");
String price = request.getParameter("price");



try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection connection=DriverManager.getConnection(url, "root", "root");

   String query = "UPDATE book_info SET bookid = '"+id+"', booktitle='"+title+"', author='"+author+"', issn='"+newissn+"', price="+price+" where issn='"+oldissn+"' ";  

    Statement st = connection.createStatement();

    // statement.setString(1, id);
    // statement.setString(2, title);
    // statement.setString(3, author);
    // statement.setString(4, newissn);
    // statement.setInt(5, Integer.parseInt(price));

   
    int rowsUpdated = st.executeUpdate(query);

    if (rowsUpdated > 0) {
        out.println("The book was successfully updated.");
    } else {
        out.println("The book was not found.");
    }

    st.close();
    connection.close();

    }
     catch (Exception ex)
    {
        System.out.println(ex.getMessage());
    } 
    
    %>

    <br><br>

<a href="admin.jsp">Home</a> <br>

</body>
</html>
 
