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

<%

try
{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/web-project";
    Connection con=DriverManager.getConnection(url, "root", "root");

    String title = (String) session.getAttribute("title");
    int price = (int) session.getAttribute("price");

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("Select * from my_cart where bookname='"+title+"' AND username ='"+email+"' ");

    int q=0;
    int quantity=0;
 

if(rs.next())
{
 q = rs.getInt("quantity");
quantity = q+1;


}

else
{
    quantity = 1;
    int result = stmt.executeUpdate("INSERT INTO My_cart(username,bookname,price,quantity)VALUES('"+ email + "','"+ title + "','"+ price + "','"+ quantity + "') " );

if(result==1)
{
    out.println("Added to cart!");
}

else{
    out.println("Cannot Add to cart!");
}
}

if(quantity>1)
{
    int update = stmt.executeUpdate("UPDATE My_cart SET quantity = '"+quantity+"' where bookname='"+title+"' AND username ='"+email+"' ");

    if(update==1)
    {
        out.println("Added to cart!");
    }
    
    else{
        out.println("Cannot Add to cart!");
    }
    
}


 stmt.close();
con.close();



}

catch(Exception e)
{
    System.out.println("Exception");
}

%>
<br><br>

<a href="buybook.jsp">Continue Shopping</a> <br><br>

<a href="user.jsp">Home</a> <br>