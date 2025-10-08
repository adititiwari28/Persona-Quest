<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>Welcome | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
  margin: 0;
  padding: 0;
  font-family: 'Poppins', sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
  animation: bgCycle 15s infinite ease-in-out;
  transition: background-color 0.5s ease;
  position: relative;
  padding-bottom:3rem;
}

@keyframes bgCycle {
  0%   { background-color: #acf099; }  /* soft cream */
  25%  { background-color: #b46fed; }  /* lavender */
  50%  { background-color: #ff9b5e; }  /* sky blue */
  75%  { background-color: #c8a2f5 }  /* blush pink */
  100% { background-color: #61a5f7; }  /* minty aqua */
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

  .admin-btn {
  position: absolute;
  top: 1rem;
  right: 2rem;
  background-color: #6b2fd8;
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  text-decoration: none;
  font-weight: 500;
  transition: background-color 0.3s ease;
}

.admin-btn:hover {
  background-color: #8756ec;
}
  .content {
    text-align: center;
    margin-top: 1rem;
  }

  .content h2 {
    font-size: 1.5rem;
    color: #fff;
    margin-bottom: 1rem;
  }

 .fact-container {
  background-color: #fff;
  border-radius: 12px;
  padding: 2rem;
  max-width: 700px;
  margin: 2rem auto;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  backdrop-filter: blur(6px);
  text-align: center;

  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* ⬅️ changed from center */
  align-items: center;

  min-height: 200px;
  position: relative;
}

.fact-content {
  font-family: 'Dancing Script', cursive;
  font-size: 1.4rem;
  font-weight: 600;
  color: #6b2fd8;
  line-height: 1.6;
  text-align: center;
  margin-top: 0.5rem; /* ⬅️ slight push down from heading */
}

.start-btn {
  background-color: #6b2fd8;
  color: white;
  padding: 0.8rem 1.5rem;
  font-size: 1.2rem;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  text-decoration: none;
}

.start-btn:hover {
  background-color: #8756ec;
}

</style>


</head>
<body>
  <a href="adminLogin" class="admin-btn">Admin Panel</a>

  <h1>
    <span class="emoji">🧩✨🎭</span> PersonaQuest <span class="emoji">🧩✨🎭</span>
  </h1>
  <h2>A Personality Quiz</h2>
  <div style="font-size: 2.0rem; color: #fff; margin-bottom: 1rem;">
  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
</div>
 
  <div class="content">
    <h2>Ready to discover your vibe?</h2>

  <div class="fact-container">
  <h2 style="color: #fff;">Personality Fact</h2>
  <div class="fact-content">
    <c:out value="${personalityFact}" escapeXml="false"/>
  </div>
</div>



<a href="${pageContext.request.contextPath}/startQuiz" class="start-btn">🚀 Let’s vibe-check your soul!</a>

  </div>
</body>

</html>

