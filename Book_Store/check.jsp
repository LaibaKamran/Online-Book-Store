<html>
<head>
<title>BookStore</title></head>
<%@ page language = "java" import = "java.sql.*" session = "false" %>
<body>

<%

try
{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

    String mail=request.getParameter("email");
    String password=request.getParameter("pwd");
    String user=request.getParameter("user");

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("Select * from login_info where email='"+mail+"' AND password ='"+password+"' ");
    //HttpSession session1;
    //int type;
    //String name;

    if(rs.next())
    {
        HttpSession session1 = request.getSession();
        int type = rs.getInt("type");
        String email = rs.getString("email");
        session1.setAttribute("email", email);
        session1.setAttribute("type", type); 

        if(type==1)
        {
           
            %>
            <jsp:include page="admin.jsp" />
       <% 

        }
        else if(type==2)
        { 
            %>
            <jsp:include page="user.jsp" />
       <%
         }
    }
    
    else
    {
        out.println("<h1>Email or Password maybe incorrect</h1>");
    }
    stmt.close();
    con.close();

}
    
catch(Exception e)
{
    System.out.println("Exception");
}

%>

</table>
</body>
</html>