<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/layout.jsp">
    <jsp:param name="title" value="Liste des Produits" />
    <jsp:param name="content" value="/WEB-INF/views/produits/content/liste.jsp" />
    <jsp:param name="currentPage" value="produits" />
</jsp:include> 