<html>
<head>
<title>Save-signin-data</title></head>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>



<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

    String Fname=request.getParameter("FirstName");
    String Lname=request.getParameter("LastName"); 
    String email=request.getParameter("email"); 
    String pwd=request.getParameter("pwd");
    String phone=request.getParameter("phone");
    String city=request.getParameter("city");
    String address=request.getParameter("add");
    int type = 2;

Statement stmt = con.createStatement();
int result = stmt.executeUpdate("INSERT INTO login_info(firstname,lastname,type,email,password,phone,address,city)VALUES('"+ Fname + "','"+ Lname + "','"+ type + "','"+ email + "','"+ pwd + "','"+ phone + "','"+ address + "','" + city + "') " );

if(result==1)
{
    out.println("Signed in Successfully");
    out.println("Login using your credentials!");
}
else
{out.println("Sign in not possible");}
%>
<html><head><title>BookStore</title></head><body><a href="login.jsp">login</a></body></html>
<%
stmt.close();
con.close();
%>

<%
}
catch(Exception e){System.out.println("Exception");} %>

</body>
</html>