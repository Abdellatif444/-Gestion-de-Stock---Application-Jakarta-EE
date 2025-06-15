<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="card">
    <h2 class="card-title"><i class="fas fa-list"></i> ${tableTitle}</h2>
    
    <c:if test="${not empty filterOptions}">
        <div class="form-group">
            <label for="filter${filterName}" class="form-label">Filtrer par ${filterLabel}</label>
            <select id="filter${filterName}" class="form-select" 
                    onchange="window.location.href='${pageContext.request.contextPath}/${baseUrl}?${filterParam}=' + this.value">
                <option value="">${filterAllLabel}</option>
                <c:forEach var="option" items="${filterOptions}">
                    <option value="${option.value}" ${param[filterParam] == option.value ? 'selected' : ''}>
                        ${option.label}
                    </option>
                </c:forEach>
            </select>
        </div>
    </c:if>

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <c:forEach var="column" items="${columns}">
                        <th>${column}</th>
                    </c:forEach>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <c:forEach var="field" items="${item.fields}">
                            <td>
                                <c:if test="${field.type == 'badge'}">
                                    <span class="badge badge-${field.badgeType}">
                                        ${field.value}
                                    </span>
                                </c:if>
                                <c:if test="${field.type != 'badge'}">
                                    ${field.value}
                                </c:if>
                            </td>
                        </c:forEach>
                        <td>
                            <a href="${pageContext.request.contextPath}/${baseUrl}?action=edit&${idParam}=${item.id}" 
                               class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/${baseUrl}?action=delete&${idParam}=${item.id}" 
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet élément ?')">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div> 