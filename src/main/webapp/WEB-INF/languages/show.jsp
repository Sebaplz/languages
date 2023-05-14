<%@ page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<div class="container mt-5">
    <div class="d-flex justify-content-end">
        <a href="/languages">Dashboard</a>
    </div>
    <h2 class="mb-5"><c:out value="${language.name}"/></h2>
    <h2 class="mb-5"><c:out value="${language.creator}"/></h2>
    <h2 class="mb-5"><c:out value="${language.currentVersion}"/></h2>
    <a href="/languages/edit/${language.id}">Edit</a>
    <form action="/languages/${language.id}" method="post" class="m-0">
        <input type="hidden" name="_method" value="delete">
        <input type="submit" value="Delete" class="p-0 mt-3 bg-transparent border border-0 text-primary text-decoration-underline">
    </form>
</div>


