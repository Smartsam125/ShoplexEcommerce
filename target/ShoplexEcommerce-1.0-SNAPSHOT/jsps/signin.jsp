<%@page import="com.connection.Conn"%>
<%@page import="com.connection.LogInDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%! 
    Connection conn = null;
    String email=null;
    String password;
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Shoplex</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Toastify CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style>
    body {
        background-color: #f5f5f5;
    }
    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        background-color: #fff; /* Card background color */
    }
    .card-header {
        background-color: #ff5722; /* Supermarket-style header color */
        color: #fff; /* Text color for the header */
        border-radius: 10px 10px 0 0; /* Rounded top corners */
    }
    .btn-primary {
        background-color: #ff5722; /* Supermarket-style button color */
        border-color: #ff5722;
    }
    .btn-primary:hover {
        background-color: #ff8a65; /* Lighter color on hover */
    }
    .btn-link {
        color: #ff5722; /* Supermarket-style link color */
    }
</style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                
                <div class="card-body p-4">
                    <div class="card-header text-center">
                   <h4 class="mt-1">Welcome To Shoplex</h4>
                      </div>
                    <form action="/ShoplexEcommerce/jsps/signin.jsp" method="POST">
                        <h2 class="text-center mb-4">Log In</h2>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" id="password" class="form-control" name="password" required>
                                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                    <i class="bi bi-eye-slash"></i>
                                </button>
                            </div>
                        </div>
                      <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg">Log In</button>
                     <p class="mt-3">
               Don't have an account? <a href="/ShoplexEcommerce/jsps/signup.jsp" class="btn-link">Sign Up</a>
                   </p>
</div>
                    </form>
                   
                    <!-- Add error message display here if needed -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script>
    var togglePassword = document.getElementById("togglePassword");
    var password = document.getElementById("password");
    togglePassword.addEventListener("click", function () {
        var type = password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);
        togglePassword.classList.toggle("bi-eye");
    });
</script>
<%
    email = request.getParameter("email");
    password = request.getParameter("password");
    if(LogInDao.validate(email,password)){
    response.sendRedirect("/ShoplexEcommerce/index.jsp");
    session.setAttribute("username",email);
   
    }
    else{%>
   <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script>
    Toastify({
        text: "Invalid Log In",
        duration: 5000, // Duration in milliseconds
        gravity: "top", // Display the toast notification at the top
        position: "center",
        backgroundColor: "#ff5722", // Background color of the toast
        close: true // Show a close button
    }).showToast();
</script>
  
   <% }
   
       
   
%>
<!-- Toastify JS -->

</body>
</html>
