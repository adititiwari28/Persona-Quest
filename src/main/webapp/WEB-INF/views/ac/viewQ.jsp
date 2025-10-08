<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<title>View Q | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

  body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background-color: #cae8c3;
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


  .table-box {
    background: rgba(255, 255, 255, 0.95);
    padding: 1.5rem;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    width: 90%;
    max-width: 800px;
    overflow-x: auto;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 1rem;
  }

  th, td {
    padding: 0.8rem;
    border: 1px solid #ccc;
    text-align: left;
  }

  th {
    background-color: #61a5f7;
    color: white;
  }

  tr:nth-child(even) {
    background-color: #f9f9f9;
  }

  tr:hover {
    background-color: #ffe2f1;
  }
  .action-btn {
    padding: 6px 12px;
    margin-right: 5px;
    border: none;
    border-radius: 5px;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    color: white;
  }

  .edit-btn {
    background-color: #4CAF50;
  }

  .delete-btn {
    background-color: #f44336;
  }
  
   a{
  display: inline-block; /* ensures margin works properly */
  margin-top: 2rem; /* adds space above the button */
  margin-bottom: 1rem;
   background-color: #61a5f7;
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
  
  <h4><span class="emoji">📜🔍</span> View the questions that shape the vibe <span class="emoji">📜🔍</span></h4>

   <div class="table-box">
    <table>
      <thead>
        <tr>
          <th>Q ID</th>
          <th>Question</th>
          <th>Option A</th>
          <th>Option B</th>
          <th>Option C</th>
          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="q" items="${questions}">
          <tr>
            <td>${q.id}</td>
            <td>${q.qtext}</td>
            <td>${q.opta}</td>
            <td>${q.optb}</td>
            <td>${q.optc}</td>
            
             <!--  
             <td>
              <a href="editQ?id=${q.id}" class="action-btn edit-btn">Edit</a>
              <a href="deleteQ?id=${q.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>
            </td>    -->
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
        <a href="${pageContext.request.contextPath}/adminDashboard">Back to Dashboard</a>
       

  <!-- Footer placeholder -->

</body>
</html>

