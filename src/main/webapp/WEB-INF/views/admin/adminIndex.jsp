<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminIndex</title>
<style>
table{
	width: 400px;
	height: 400px;
	text-align: center;
}
</style>
</head>
<body>
<h2>AdminIndex.jsp</h2>
<table>
	<tr>
		<td><a href="memberList.ju"><img src="resources/img/member.png"><br>회원관리</a></td>
		<td><a href="bookList.ju"><img src="resources/img/book.png"><br>일반도서관리</a></td>
		<td><a><img src="resources/img/ebook.png"><br>전자도서관리</a></td>
	</tr>
	<tr>
		<td><a href="loanbookList.ju"><img src="resources/img/loan.png"><br>대출도서관리</a></td>
		<td><a><img src="resources/img/home.png"><br>메인 페이지로</a></td>
		<td><a href="bookingIndex.ju"><img src="resources/img/seat.png"><br>자리예약관리</a></td>
	</tr>
	<tr>
		<td><a href="learningList.ju"><img src="resources/img/learn.png"><br>수강관리</a></td>
		<td><a href="fedexList.ju"><img src="resources/img/fedex.png"><br>택배대출관리</a></td>
		<td><a href="calendar.ju"><img src="resources/img/calendar.png"><br>캘린더 관리</a></td>
	</tr>
</table>
</body>
</html>