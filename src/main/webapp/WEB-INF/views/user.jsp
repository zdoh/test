<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>User Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-4eph{background-color:#f9f9f9}
    </style>
</head>
<body>
<c:url var="addAction" value="/user/add" ></c:url>

<form:form action="${addAction}" commandName="user">
    <h1>
        <c:choose>
            <c:when test="${!empty user.name}">
                Edit a User
            </c:when>
            <c:otherwise>
                Add a User
            </c:otherwise>
        </c:choose>
    </h1>
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8"  disabled="true" />
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age" />
            </td>
        </tr>
        <tr>
            <td>
                <spring:message text="Admin"/>
            </td>
            <td>
                <form:select path="admin">
                    <form:option value="true" label="Yes" />
                    <form:option value="false" label="No" />
                </form:select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:choose>
                    <c:when test="${!empty user.name}">
                        <input type="submit"
                               value="<spring:message text="Edit User"/>" />
                    </c:when>
                    <c:otherwise>
                        <input type="submit"
                               value="<spring:message text="Add User"/>" />
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>
</form:form>

<form:form action="/users" method="get">
    <table>
        <tr>
            <td>
                <spring:message text="Search by id:"/>
                <input type="text" name="id">
                <input type="submit" value="Find">
            </td>
        </tr>
        <tr>
            <td>
                <a href="<c:url value='/users' />" >Show all users</a>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>Users List</h3>
<c:if test="${!empty getAllUsers}">
    <table class="tg">
        <tr>
            <th width="80">User ID</th>
            <th width="120">User Name</th>
            <th width="120">User Age</th>
            <th width="120">Admin</th>
            <th width="120">createDate</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${getAllUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <c:choose>
                    <c:when test="${user.admin}">
                        <td>Yes</td>
                    </c:when>
                    <c:otherwise>
                        <td>No</td>
                    </c:otherwise>
                </c:choose>
                <td>${user.createDate}</td>
                <td><a href="<c:url value='/edit/${user.id}' />" >Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}' />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>

    <div id="pagination">

        <c:url value="/users" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/users" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="/users" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="pn next">Next</a>
        </c:if>
    </div>

</c:if>
<c:if test="${empty getAllUsers}">
<table class="tg">
    <tr>
        <spring:message text="No data to show"/>
    </tr>
</table>
</c:if>
</body>
</html>