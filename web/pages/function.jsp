<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty msg}">
    <c:out value="<script>alert('${msg}')</script>" escapeXml="false"/>
    <c:remove var="msg" scope="session"/>
</c:if>