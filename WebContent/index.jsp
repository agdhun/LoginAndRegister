<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:choose>
	<c:when test="${ param.ua == 'register'}">
		<title>注册</title>
	</c:when>
	<c:otherwise>
		<title>登录</title>
	</c:otherwise>
</c:choose>
</head>
<body>
<c:choose>
	<c:when test="${ param.ua == 'register' }">
	<c:if test="${param.error }">
		<font color="red">用户已存在！</font>
	</c:if>
		<form action="action.jsp?type=register" method="post" >
			<table border="1">
				<tr>
					<td>用户名</td>
					<td><input type="text" name="user" ></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" name="pwd" ></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" name="cpwd" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="注册" >
					
				</tr>
			</table>
		</form>
	</c:when>
	<c:otherwise>
	<c:if test="${param.error }">
		<font color="red">用户名或密码错误！</font>
	</c:if>
		<form action="action.jsp?type=login" method="post" >
			<table border="1">
				<tr>
					<td>用户名</td>
					<td><input type="text" name="user" ></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" name="pwd" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="登录" >
					<td align="right"><a href="index.jsp?ua=register">注册</a></td>
				</tr>
			</table>
		</form>
	</c:otherwise>
</c:choose>
</body>
</html>