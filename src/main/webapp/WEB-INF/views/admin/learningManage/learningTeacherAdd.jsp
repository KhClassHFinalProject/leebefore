<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>선생님 등록하기 페이지</h2>
<form name="teacherForm" action="learningTeacherAdd.ju" method="post">
	<table>
		<tr>
			<th>강사 이름</th>
			<td><input type="text" name="tc_name" ></td>
		</tr>
		<tr>
			<th>생년 월일</th>
			<td><input type="text" name="tc_birth"></td>
		</tr>
		<tr>
			<th>강사 주소</th>
			<td><input type="text" name="tc_addr"></td>
		</tr>
		<tr>
			<th>강사 연락처</th>
			<td><input type="text" name="tc_hp"></td>
		</tr>
		<tr>
			<th>강사 소개</th>
			<td><textarea rows="10" cols="20" name="tc_sum"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="강사 등록">
</form>
</body>
</html>