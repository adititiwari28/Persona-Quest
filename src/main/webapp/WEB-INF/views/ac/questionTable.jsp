
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Table | Personality Pulse</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

 /* body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f8ff;
  }*/
  .table-wrapper{
  background-color: transparent;
  padding: 1rem;
  width: 100%;
  font-family: 'Poppins', sans-serif;
  
  }

  .table-box {
    background: rgba(255, 255, 255, 0.95);
    padding: 1.5rem;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    width: 90%;
    max-width: 800px;
    margin: 2rem auto;
    overflow-x: auto;
  }
  .scroll-table {
  max-height: 15rem; /* approx height for 3 rows */
  overflow-y: auto;
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
    background-color: #a45de8;
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
    border: none;
    border-radius: 5px;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    color: white;
  }

  .edit-btn {
    background-color: #7D62F9;
  }

  .delete-btn {
    background-color: #a45de8;
  }
</style>
</head>
<body>
 
 <div class="table-wrapper">
<div class="table-box">
<div class="scroll-table">

  <table>
    <thead>
      <tr>
        <th>Q ID</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <c:if test="${actionType != 'view'}">
          <th>Action</th>
        </c:if>
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
         <c:if test="${actionType == 'edit'}">
  <td>
    <a href="editQ?id=${q.id}" class="action-btn edit-btn"
    onclick="return ">Edit</a>
  </td>
</c:if>

<c:if test="${actionType == 'delete'}">
  <td>
    <a href="deleteQ/confirm?id=${q.id}" class="action-btn delete-btn"
   onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>

    
  </td>
</c:if>

        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</div>
</div>

</body>
</html>

