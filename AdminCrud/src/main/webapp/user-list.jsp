<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
   <title>Admin panel</title>
         
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
body{
margin:0;
padding:0;
background:url(p1.jpg);
background-size:cover;

}
nav-link{
color:white;
}
table table-bordered{
color:white;
}

  </style>
  </head>
  <body>
  <header>
  <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkblue">
  <div>
 <a href="  " class="navbar-brand"> User Management  </a>
   </div>

   <ul class="navbar-nav">
   <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
   </ul>
   </nav>
   </header>
    <br>

    <div class="row">
                

                <div class="container">
                    <h3 class="text-center">List of Users</h3>
                    <hr>
                    <div class="container text-left">

     <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>UserId</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Country</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="user" items="${listUser}">

                                <tr>
                                    <td> <c:out value="${user.userid}" /></td>
                                    <td><c:out value="${user.fname}" /></td>
                                    <td><c:out value="${user.lname}" /></td>
                                    <td><c:out value="${user.email}" /></td>
                                    <td><c:out value="${user.country}" /></td>
                                    
                                    <td><a href="edit?userid=<c:out value='${user.userid}' />">Edit</a> 
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?userid=<c:out value='${user.userid}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>