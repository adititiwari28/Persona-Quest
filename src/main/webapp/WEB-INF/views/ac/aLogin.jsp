<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    animation: bgCycle 12s infinite;
    background-size: cover;
    
    height: 100vh;
  }
  .container{
    display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 4vh;
  }
@keyframes bgCycle {
   0%   { background-color: #61a5f7; }   /* soft sky blue */
  33%  { background-color: #ff9b5e; }   /* pale orange (softer than before) */
  66%  { background-color: #c8a2f5; }   /* lilac / pastel purple */
  100% { background-color: #61a5f7; } 
  }

  h1 {
    font-size: 2.5rem;
    font-weight: 600;
    margin-bottom: 0.2rem;
    color: #fff;
    text-shadow: 1px 1px 2px #333;
  }

  h2 {
    font-size: 1.2rem;
    font-weight: 400;
    margin-bottom: 2rem;
    color: #fff;
    text-shadow: 1px 1px 2px #333;
  }
  hr {
    width: 60%;
    border: none;
    height: 3px;
    background-color: #035053;
    color: #fff;
    margin-bottom: 2rem;
    border-radius: 2px;
  }
   
  .login-box {
  margin-top: 2vh;
    background: rgba(255, 255, 255, 0.9);
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    width: 300px;
    text-align: center;
  }
 .login-box input {
    width: 100%;
    padding: 0.6rem;
    margin: 0.5rem 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
  }

  .login-box button {
    background-color: #61a5f7;
    color: white;
    border: none;
    padding: 0.7rem 1.2rem;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .login-box button:hover {
    background-color: #035053;
  }
</style>
</head>
<body>
  <div class="container">
  <h1>Personality Pulse</h1>
  <h2>Control Room: Where the Question's Come to Life</h2>
  <div style="font-size: 2.0rem; color: #fff; margin-bottom: 2rem;">
  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
</div>
  <div class="login-box">
    <form action="adminLogin" method="post">
      <input 
           type="text" 
           name="username"  
           placeholder="Enter Admin Username" 
           required 
           />
      <input  
          type="password" 
          name="password" 
          placeholder="Enter Password" 
          required  
          />
      <button type="submit">Log In</button>
    </form>
  </div>
</div>
</body>
</html>




