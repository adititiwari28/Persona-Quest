
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>Quiz | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    transition: background-color 0.5s ease;
    min-height: 100vh;
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

  .admin-btn {
  position: absolute;
  top: 1rem;
  right: 2rem;
  background-color: #61a5f7;
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  text-decoration: none;
  font-weight: 500;
  transition: background-color 0.3s ease;
}

.admin-btn:hover {
  background-color: #003c3e;
}
  .quiz-container {
    margin: 3rem auto;
    width: 90%;
    max-width: 600px;
    background-color: #ffffff;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }

  .quiz-container h2 {
    font-size: 1.7rem;
    margin-bottom: 1rem;
    color: #333;
  }

  .option {
    margin: 0.8rem 0;
  }

  .option input {
    margin-right: 0.5rem;
  }

  .next-btn {
    background-color: #6b2fd8;
    color: white;
    padding: 0.7rem 1.2rem;
    border: none;
    border-radius: 6px;
    font-size: 1rem;
    cursor: pointer;
    margin-top: 1.5rem;
    transition: background-color 0.3s ease;
  }

  .next-btn:hover {
    background-color: #8756ec;
  }
</style>

<script>
  window.onload = function() {
    const colors = ["#fef6e4", "#e8e2ff", "#dff6ff", "#ffe5ec", "#e0f7fa"];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.backgroundColor = randomColor;
  };
</script>
</head>
<body>

  <a href="adminLogin" class="admin-btn">Admin Panel</a>

  <h1>
    <span class="emoji">🧩✨🎭</span> PersonaQuest <span class="emoji">🧩✨🎭</span>
  </h1>
  <h2>A Personality Quiz</h2>
  <div style="font-size: 2.0rem; color: #035053; margin-bottom: 2rem; text-align: center;">
  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
</div>


  <div class="quiz-container">
    <form action="nextQuestion" method="post">
      <input type="hidden" name="qid" value="${question.id}" />

      <h2>${question.qtext}</h2>

      <div class="option">
        <input type="radio" name="selected" value="1" required /> ${question.opta}
      </div>
      <div class="option">
        <input type="radio" name="selected" value="2" /> ${question.optb}
      </div>
      <div class="option">
        <input type="radio" name="selected" value="3" /> ${question.optc}
      </div>

      <button type="submit" class="next-btn">Next</button>
    </form>
  </div>

</body>
</html>

