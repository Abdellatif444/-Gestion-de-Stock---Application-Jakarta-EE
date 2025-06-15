<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/layout.jsp">
    <jsp:param name="title" value="Gestion des Stocks"/>
    <jsp:param name="currentPage" value="stocks"/>
    <jsp:param name="content" value="/WEB-INF/views/stocks/content/liste.jsp"/>
</jsp:include> 