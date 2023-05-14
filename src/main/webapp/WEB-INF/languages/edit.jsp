<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<div class="container mt-5">
    <div class="d-flex justify-content-end">
        <form action="/languages/${language.id}" method="post">
            <input type="hidden" name="_method" value="delete">
            <input type="submit" value="Delete" class="bg-transparent border border-0 text-primary text-decoration-underline">
            <a href="/languages" class="ms-3">Dashboard</a>
        </form>
    </div>
    <form:form action="/languages/edit/${language.id}" method="post" modelAttribute="language">
        <input type="hidden" name="_method" value="put">
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

