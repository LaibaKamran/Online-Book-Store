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
<title>BookStore</title>
<script type="text/javascript">
    function Validate() {
      if (document.SU.issn.value == "") {
        alert("ISSN is empty!!");
        return false;
      }

      return true;
    }

</script>
</head>
<body>
	<form action="searchbuy.jsp" name="SU" onsubmit="return Validate()" >
        <h1>Search book you want to buy</h1>
	
	    ISSN: <input type="text" name="issn"><br><br>

        <input type="submit" value="Submit">

    </form> 

	

</body>
</html>