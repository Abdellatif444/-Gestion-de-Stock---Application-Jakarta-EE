<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/layout.jsp">
    <jsp:param name="title" value="Sortie de Stock" />
    <jsp:param name="content" value="/WEB-INF/views/stocks/content/sortie.jsp" />
    <jsp:param name="currentPage" value="stocks" />
</jsp:include> 