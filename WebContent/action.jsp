<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:choose>
	<c:when test="${param.type == 'register' }">
		<title>注册成功</title>
	</c:when>
	<c:otherwise>
		<title>用户信息</title>
	</c:otherwise>
</c:choose>
</head>
<body>
<c:set var="flag" value="false"/>
<sql:setDataSource
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="111111"
	url="jdbc:mysql://127.0.0.1:3306/jstl"
	var="jstl"
	scope="page"/>
<sql:query var="rs" scope="page" dataSource="${jstl}">
	select * from info
</sql:query>
	<c:choose>
		<c:when test="${param.type == 'register' }">
			<c:forEach var="row" items="${rs.rows}">
				<c:if test="${row['user'] == param.user }">
					<c:set var="flag" value="true"/>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${flag }">
					<jsp:forward page="index.jsp?ua=register&error=true"></jsp:forward>
				</c:when>
				<c:otherwise>
					<sql:update dataSource="${jstl}">
						insert into info values ('${param.user}', '${param.pwd}')
					</sql:update>
					<H1>注册成功</H1>
					<div align="right">返回<a href="index.jsp">登录</a>界面</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${param.type == 'info' }">
			<sql:update dataSource="${jstl }" >
				update info set pwd = '${param.pwd }' where user = '${param.user }'
			</sql:update>
			<jsp:forward page="action.jsp?type=login"></jsp:forward>
		</c:when>
		<c:otherwise>
			<c:forEach var="row" items="${rs.rows}">
				<c:if test="${row['user'] == param.user }">
				<c:if test="${row['pwd'] == param.pwd }">
					<c:set var="flag" value="true"/>
					</c:if>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${flag }">
					<table border="1">
						<tr>
							<td>用户名</td>
							<td>密码</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${rs.rows}" var="row">
							<tr>
								<td>${row['user']}</td>
								<td>${row['pwd']}</td>
								<td><a href="infoupdate.jsp?user=${row['user']}&pwd=${row['pwd']}">修改</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<jsp:forward page="index.jsp?error=true"></jsp:forward>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</body>
</html>