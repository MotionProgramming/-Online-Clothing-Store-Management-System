<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(45deg, #a8edea, #fed6e3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
        }
        h1 {
            color: #444;
            margin-bottom: 20px;
        }
        .input-field {
            margin: 15px 0;
        }
        .input-field input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .input-field input:focus {
            border-color: #007bff;
            outline: none;
        }
        .action button {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 12px 15px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .action button:hover {
            background: #0056b3;
        }
        .action-button {
            display: inline-block;
            background: #28a745;
            color: #fff;
            padding: 10px 15px;
            margin-top: 15px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .action-button:hover {
            background: #218838;
        }
        .logout-button {
            background: #dc3545;
            color: #fff;
            padding: 10px 15px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }
        .logout-button:hover {
            background: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enter Your Information</h1>
        <form action="loginCheck.jsp" method="POST">
            <div class="input-field">
                <input type="text" name="number" placeholder="Enter your number" required>
            </div>
            <div class="input-field">
                <input type="email" name="email" placeholder="Email" autocomplete="off" required>
            </div>
            <div class="action">
                <button type="submit">Login</button>
            </div>
            <a href="index.jsp" class="action-button">Back</a>
           <br><br>
            <a href="logout.jsp" class="logout-button">Logout</a>
        </form>
      
        
    </div>
</body>
</html>
