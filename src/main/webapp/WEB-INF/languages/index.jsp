<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<div class="container mt-5">
    <table class="table table-striped">
        <thead>
            <tr class="table-secondary">
                <th scope="col">Name</th>
                <th scope="col">Creator</th>
                <th scope="col">Version</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${langs}" var="language">
            <tr>
                <td><a href="/languages/${language.id}">${language.name}</a></td>
                <td><c:out value="${language.creator}"/></td>
                <td><c:out value="${language.currentVersion}"/></td>
                <td class="d-flex">
                    <form action="/languages/${language.id}" method="post" class="m-0">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="delete" class="bg-transparent border border-0 text-primary text-decoration-underline">
                        <a href="/languages/edit/${language.id}" class="ms-3">edit</a>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <form:form action="/languages" method="post" modelAttribute="language" class="mt-5">
        <p class="d-flex justify-content-between mx-3">
            <form:label path="name">Name</form:label>
            <form:errors path="name" class="text-danger"/>
            <form:input path="name"/>
        </p>
        <p class="d-flex justify-content-between mx-3">
            <form:label path="creator">Creator</form:label>
            <form:errors path="creator" class="text-danger"/>
            <form:input path="creator"/>
        </p>
        <p class="d-flex justify-content-between mx-3">
            <form:label path="currentVersion">Version</form:label>
            <form:errors path="currentVersion" class="text-danger"/>
            <form:input placeholder="Ej: 1.2" path="currentVersion"/>
        </p>
        <div class="d-flex justify-content-end me-3">
            <input type="submit" value="Submit"/>
        </div>
    </form:form>
</div>

