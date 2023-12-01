<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style media="screen">
    body {
      background-image: url('https://wallpaperaccess.com/full/922671.jpg');
      background-size: cover;
      background-repeat: no-repeat;
    }

    .page-title {
      font-size: 36px;
      font-weight: bold;
      color: #ECA869;
      text-align: center;
    }

    form {
      width: 300px;
      margin: 0 auto;
      padding: 30px;
      background-color: #F2DEBA;
      border: 1px solid #e3e3e3;
      border-radius: 5px;
    }

    label {
      font-weight: bold;
      margin-bottom: 10px;
      display: block;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="submit"] {
      width: 100%;
      background-color: #ECA869;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #FAAB78;
    }
  </style>
  <script type="text/javascript">
    function validate() {
      if (document.SU.pwd.value == "") {
        alert("password is empty!!");
        document.SU.pwd.focus();
        return false;
      }

      if (document.SU.user.value == "") {
        alert("Login as field is empty!!");
        document.SU.user.focus();
        return false;
      }

      function validateEmail() {
        let email = document.getElementById("email").value;
        let emailError = document.getElementById("emailError");

        let emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!emailRegex.test(email)) {
          emailError.innerHTML = "Invalid email format";
        } else {
          emailError.innerHTML = "";
        }
      }
    }
  </script>
</head>

<body>

<%
int type = 0;

if(session!=null && session.getAttribute("type") != null)
{
  type = (int) session.getAttribute("type");
	if(type==1)
    {
       response.sendRedirect("admin.jsp");
    }

    else if(type==2)
    {
       response.sendRedirect("user.jsp");
    }
}
else 
{
  %>  

  <form action="check.jsp" name="SU" method="post" onsubmit="return validate()">
    <h1 class="page-title">BOOK_STORE</h1>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" oninput="validateEmail()" required><br>
    <label for="pwd">Password:</label>
    <input type="password" name="pwd" required><br>
    <input type="hidden" name="action" value="signin">
    <input type="submit" value="login">
    <p>Don't have an account? <a href="signup.html">Sign Up</a></p>

    <% } %>
</body>

</html>
