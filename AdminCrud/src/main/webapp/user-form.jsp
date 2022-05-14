<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>User Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
body{
margin:0;
padding:0;
background:url(file:///C:/Users/Suba/eclipse-workspace/AdminCrud/src/main/webapp/WEB-INF/cyber.jpg);
background-size:cover;
}
  </style>
        </head>

        <body>

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkblue">
                    <div>
                        <a href=" " class="navbar-brand"> User Management  </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
                    </ul>
                </nav>
            </header>
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <c:if test="${user != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${user == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${user != null}">
                                    Edit User
                                </c:if>
                                <c:if test="${user == null}">
                                    Add New User
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${user != null}">
                            <input type="hidden" name="userid" value="<c:out value='${user.userid}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>User First Name</label> <input type="text" value="<c:out value='${user.fname}' />" class="form-control" name="fname" required="required">
                        </fieldset>
                         <fieldset class="form-group">
                            <label>User Last Name</label> <input type="text" value="<c:out value='${user.lname}' />" class="form-control" name="lname" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>User Email</label> <input type="email" value="<c:out value='${user.email}' />" class="form-control" name="email">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>User Country</label> <input type="text" value="<c:out value='${user.country}' />" class="form-control" name="country">
                        </fieldset>

                        <input type="submit"  value="Save" class="btn btn-success">
                        </form>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>