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
<script type="text/javascript">
    function Validate() {
      if (document.SU.id.value == "") {
        alert("Id is empty!!");
        return false;
      }

      if (document.SU.title.value == "") {
        alert("Title is empty!!");
        return false;
      }

      if (document.SU.author.value == "") {
        alert("Author is empty!!");
        return false;
      }

      if (document.SU.issn.value == "") {
        alert("ISSN is empty!!");
        return false;
      }

      if (document.SU.price.value == "") {
        alert("Price is empty!!");
        return false;
      }


      return true;
    }

</script>
</head>
<body>
	<form action="insertbook.jsp" name="SU" onsubmit="return Validate()">
        ID: <input type="text" name="id" ><br><br>

        Title: <input type="text" name="title" ><br><br>

        Author: <input type="text" name="author"><br><br>
	
	      ISSN: <input type="text" name="issn"><br><br>

        Price: <input type="text" name="price"><br><br>

        <input type="submit" value="Submit">

    </form> 

	

</body>
</html>