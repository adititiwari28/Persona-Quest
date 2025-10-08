<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>Your Personality Result | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

 body {
  font-family: 'Poppins', sans-serif;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
  animation: bgCycle 15s infinite ease-in-out;
  transition: background-color 0.5s ease;
}

@keyframes bgCycle {
  0%   { background-color: #acf099; }  /* soft cream */
  25%  { background-color: #b46fed; }  /* lavender */
  50%  { background-color: #ff9b5e; }  /* sky blue */
  75%  { background-color: #c8a2f5 }  /* blush pink */
  100% { background-color: #61a5f7; }  /* minty aqua */
}




  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  h1 {
  font-size: 2.5rem;
  font-weight: 600;
  margin-top: 2rem;
  margin-bottom: 0.5rem;
  color: #fff;
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
  color: #fff;
  text-align: center;
  margin-bottom: 1rem;
}

  .result-box {
    background-color: #ffffff;
    margin-top: 2rem;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
    max-width: 650px;
    text-align: center;
    animation: fadeIn 1.5s ease-in;
  }

  .result-box h2 {
    font-size: 2.2rem;
    color: #ff6f61;
    margin-bottom: 1rem;
  }
  
  .result-box p {
    font-size: 1.15rem;
    color: #333;
    line-height: 1.7;
    margin-top: 1rem;
    white-space: pre-line;
  }

  .btn-group {
    margin-top: 2rem;
    display: flex;
    justify-content: center;
    gap: 1rem;
  }

  .btn-group a {
    background-color: #6b2fd8;
    color: white;
    padding: 0.8rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease;
  }

  .btn-group a:hover {
    background-color: #8756ec;
  }
</style>
  
  
</head>
<body>

  

  <h1>
    <span class="emoji">🧩✨🎭</span> PersonaQuest <span class="emoji">🧩✨🎭</span>
  </h1>
  <h2>A Personality Quiz</h2>
  <div style="font-size: 2.0rem; color: #fff; margin-bottom: 1rem; text-align: center;">
  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
</div>

  <div class="result-box">
    <h2>${resultTitle}</h2>
    <p>${resultDesc}</p>

    <div class="btn-group">
      <a href="${pageContext.request.contextPath}/">🏠 Back to Home</a>
      <a href="${pageContext.request.contextPath}/retake">🔁 Retake Quiz</a>

    </div>
  </div>

</body>
</html>
  