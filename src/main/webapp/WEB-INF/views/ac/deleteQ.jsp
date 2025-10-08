<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>Delete Q | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background-color: #e698ed;
    height: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-bottom: 3rem;
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

  
 h4 {
  font-size: 1.3rem;
  font-weight: 500;
  margin-top: 1.5rem;
  margin-bottom: 1rem;
  color: #035053;
  text-align: center;
}

h4 span.emoji {
  display: inline-block;
  animation: pulseEmoji 1.8s infinite ease-in-out;
}
  .form-box {
    background: rgba(255, 255, 255, 0.95);
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    width: 300px;
    text-align: center;
  }

  .form-box input {
    width: 100%;
    padding: 0.6rem;
    margin: 0.5rem 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
  }

  .form-box button {
    background-color: #a45de8;
    color: white;
    border: none;
    padding: 0.7rem 1.2rem;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 100%;
    margin-top: 1rem;
  }

  .form-box button:hover {
    background-color: #035053;
  }
  
  a{
  display: inline-block;
  margin-top: 2rem; 
  margin-bottom: 1rem;
   background-color: #a45de8;
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 500;
    transition: background-color 0.3s ease;
    }
   a:hover {
	 background-color: #003c3e;
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
  
  <h4><span class="emoji">🗑️🎭</span> This question’s had its spotlight — delete time! <span class="emoji">🗑️🎭</span></h4>


  <div class="form-box">
    <form action="deleteQ" method="post">
      <label for="qid">Enter Question ID to Delete:</label>
      <input type="text" id="qid" name="qid" required />
      <button type="submit">Delete Question</button>
    </form>
  </div>

   <jsp:include page="questionTable.jsp" />
   <a href="${pageContext.request.contextPath}/adminDashboard">Back to Dashboard</a>
   
  <!-- Footer placeholder -->

</body>
</html>

