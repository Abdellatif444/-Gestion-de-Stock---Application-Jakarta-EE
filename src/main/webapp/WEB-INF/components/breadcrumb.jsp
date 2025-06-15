<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/" class="breadcrumb-item">
        <i class="fas fa-home"></i> Accueil
    </a>
    <c:if test="${not empty pageTitle}">
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">${pageTitle}</span>
    </c:if>
    <c:if test="${not empty subPageTitle}">
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">${subPageTitle}</span>
    </c:if>
</div>

<style>
.breadcrumb {
    background-color: var(--background-color);
    padding: 0.5rem 1rem;
    border-radius: 4px;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    font-size: 0.9rem;
}

.breadcrumb-item {
    color: var(--primary-color);
    text-decoration: none;
}

.breadcrumb-item:hover {
    text-decoration: underline;
}

.breadcrumb-item.active {
    color: var(--text-color);
    font-weight: 500;
}

.breadcrumb-separator {
    margin: 0 0.5rem;
    color: var(--text-muted);
}
</style> 