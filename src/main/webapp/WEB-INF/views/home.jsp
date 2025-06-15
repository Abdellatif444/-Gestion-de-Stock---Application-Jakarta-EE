<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/layout.jsp">
    <jsp:param name="title" value="Accueil"/>
    <jsp:param name="currentPage" value="accueil"/>
    <jsp:param name="content" value="/WEB-INF/views/home/dashboard.jsp"/>
</jsp:include> 