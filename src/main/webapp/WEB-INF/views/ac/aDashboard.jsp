<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>Admin Dashboard | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #ffe2f1, #61a5f7, #ff7029);
    background-size: cover;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

   h1 {
  font-size: 2.5rem;
  font-weight: 600;
  margin-top: 2rem;
  margin-bottom: 0.5rem;
  color: #035053;
  text-align: center;
}

h1 span.emoji {
  display: inline-block;
  animation: pulseEmoji 1.8s infinite ease-in-out;
}

@keyframes pulseEmoji {
  0%   { transform: scale(1); opacity: 1; }
  50%  { transform: scale(1.2); opacity: 0.7; }
  100% { transform: scale(1); opacity: 1; }
}
 h2 {
  font-family: 'Dancing Script', cursive;
  font-size: 1.8rem;
  font-style: italic;
  font-weight: 800;
  color: #035053;
  text-align: center;
  margin-bottom: 1rem;
}

  .grid-container {
    display: grid;
    grid-template-columns: 150px 150px;
    grid-template-rows: 150px 150px;
    gap: 20px;
  }

  .grid-item {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 500;
    font-size: 1rem;
    text-align: center;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease;
  }

  .grid-item:hover {
    transform: scale(1.05);
    background-color: #cae8c3;
  }

  a {
    font-family: 'Dancing Script', cursive;
  font-size: 1.8rem;
  font-style: italic;
  font-weight:bold;
  padding:0.2rem;
    color: #035053;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
</head>
<body>

  <h1>
  <span class="emoji">🧩✨🎭</span> PersonaQuest <span class="emoji">🧩✨🎭</span>
</h1>
<h2>A Personality Quiz</h2>
<div style="font-size: 2.0rem; color: #035053; margin-bottom: 2rem;">
  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
</div>

  <h2>Control Room: Where the Question's Come to Life</h2>
  
  <div class="grid-container">
    <div class="grid-item"><a href="addQ">Add Questions</a></div>
    <div class="grid-item"><a href="editQ">Edit Questions</a></div>
    <div class="grid-item"><a href="deleteQ">Delete Questions</a></div>
    <div class="grid-item"><a href="viewQ">View Questions</a></div>
  </div>

  <!-- Footer placeholder -->
</body>
</html>
