<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@page import="java.sql.*"%>

<%@include file="../connection.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Shoplex</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!-- Toastr CSS -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<!-- jQuery (required for Toastr) -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Toastr JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

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
        .form-control {
            border-color: #ff5722; /* Input field border color */
        }
        .form-control:focus {
            border-color: #ff5722; /* Input field border color on focus */
        }
    </style>
    <script>
    function validateForm() {
        var fullName = document.getElementById("fullName").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var repeatPassword = document.getElementById("repeatPassword").value;
        var gender = document.getElementById("gender").value;
        var location = document.getElementById("location").value;
        var dateOfBirth = document.getElementById("dateOfBirth").value;

        // Password validation: Check if passwords match
        if (password !== repeatPassword) {
            toastr.error("Passwords do not match.");
            return false;
        }

        // Password complexity validation
        var passwordPattern = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+])[A-Za-z0-9!@#$%^&*()_+]+$/;
        if (!passwordPattern.test(password)) {
            toastr.error("Password must have at least 1 uppercase letter, 1 special character, and 1 digit.");
            return false;
        }

        // Other validations can be added as needed

        return true; // Form is valid and can be submitted
    }
</script>

    
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h4 class="mt-1">Sign Up for Shoplex</h4>
                </div>
                <div class="card-body p-4">
                    <form action="/ShoplexEcommerce/jsps/signup.jsp" method="POST" onSubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="fullName" class="form-label" >Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="repeatPassword" class="form-label">Repeat Password</label>
                            <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="location" class="form-label">Location</label>
                            <input type="text" class="form-control" id="location" name="location" required>
                        </div>
                        <div class="mb-3">
                            <label for="dateOfBirth" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                        </div>
                    </form>
                    <p class="mt-3 text-center">
                        Already have an account? <a href="/ShoplexEcommerce/jsps/signin.jsp" class="btn-link">Log In</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous">
    
</script>
<script>
    // Initialize Toastr
    toastr.options = {
        closeButton: true,
        progressBar: true,
        positionClass: 'toast-top-center'
        
    };
       var successParam = '<%= request.getParameter("success") %>';
    if (successParam === 'true') {
        toastr.success('success LogIn!');
        
    }
</script>
</body>
</html>
<%
    String fullName=request.getParameter("fullName");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String location=request.getParameter("location");
     SimpleDateFormat dateFormat = new SimpleDateFormat("MM-yy--dd");
            String currentDate = dateFormat.format(new Date());

            // SQL query with placeholders for the prepared statement
            String insertQuery = "INSERT INTO customer (customerName, Gender, Location, email, Password, Date_of_Birth, creationDate) " +
                  
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
            try{

           // connection = getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(insertQuery);

            
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, gender);
            preparedStatement.setString(3, location);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, password);
            preparedStatement.setString(6, dateOfBirth);
            preparedStatement.setString(7, currentDate); // Insert the current date          
            //preparedStatement.executeUpdate();
              int rowsAffected = preparedStatement.executeUpdate();
            
            // Check if the insertion was successful
            if (rowsAffected > 0) {
                response.sendRedirect("/ShoplexEcommerce/jsps/signup.jsp?success=true");
            }
    }catch(Exception e){
    out.println(e.getMessage());
    }
    
    
    
%>


