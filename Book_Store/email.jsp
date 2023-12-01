<%@ page language = "java" import = "java.sql.*" %>

<%

try
{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

    String email=request.getParameter("email");
    String Fname=request.getParameter("FirstName");
    String Lname=request.getParameter("LastName"); 
    String pass=request.getParameter("pwd");
    String cpass=request.getParameter("cpwd");
    String phone=request.getParameter("phone");
    String city=request.getParameter("city");
    String address=request.getParameter("add");
   
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("Select * from login_info where email='"+email+"' ");

    if(!pass.equals(cpass))
    {
        out.println("Password and confirm password doesn't match");
    }

    else if(pass.length() < 8)
    {
        out.println("Password must be 8 characters long!");
    }

    
    else if(pass.length() > 15)
    {
        out.println("Password is too long!");
    }

    else if(Fname==null)
    {
        out.println("FirstName is empty!");
    }

    else if(Lname==null)
    {
        out.println("LastName is empty!");
    }

    else if(pass==null)
    {
        out.println("Password is empty!");
    }

    else if(phone==null)
    {
        out.println("Phone is empty!");
    }

    else if(city==null)
    {
        out.println("City is empty!");
    }

    else if(address==null)
    {
        out.println("Address is empty!");
    }

 else if(rs.next())
{
out.println("You already have an account. Please use another email!");
}

else
{ %>
    <jsp:include page="insert.jsp" />
<% }

 stmt.close();
    con.close();

}

catch(Exception e)
{
    System.out.println("Exception");
}


%>