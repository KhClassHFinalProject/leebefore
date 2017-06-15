<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {packages: ['corechart']});     
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {packages: ['corechart']});     
</script>
<body>
	<div class="row">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</div>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/anal/analSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md">
					<h2>도서관 통계</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md">
					<ul class="nav nav-tabs">
					  <li role="presentation"><a href="analSearch.ju">검색어통계</a></li>
					  <li role="presentation" class="active"><a href="analUser.ju">이용자통계</a></li>
					</ul>
				</div>
				<div class="col-md-5">
					<div id="container1" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</div>
				<div class="col-md-7">
					<div id="container2" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</div>
				<div class="col-md-5">
					<div id="container3" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</div>
				<div class="col-md-7">
					<div id="container4" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</div>
			</div>
		</div>
	</div>
	
<script language="JavaScript">
function drawChart() {
	var gender = ${gender};
	var age = ${age};
	var like = ${like};
	var email = ${email};

	// gender
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows(gender);
   var options = {'title':'도서관 이용회원 성별',
      'width':500,
      'height':400};
   var chart = new google.visualization.PieChart(document.getElementById('container1'));
   chart.draw(data, options);
   
   // age
   var data = google.visualization.arrayToDataTable(age);
   var options = {
      title: '도서관 회원 연령분포'	  
   }; 
   var chart = new google.visualization.ColumnChart(document.getElementById('container2'));
   chart.draw(data, options);
   
   
   // email
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows(email);
   var options = {'title':'도서관 회원 사용메일빈도',
      'width':500,
      'height':400,
       pieHole: 0.4
   };
   var chart = new google.visualization.PieChart(document.getElementById('container3'));
   chart.draw(data, options);
   
   // like
   var data = google.visualization.arrayToDataTable(like);
   var options = {
      title: '도서관 회원 관심사'	  
   }; 
   var chart = new google.visualization.ColumnChart(document.getElementById('container4'));
   chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawChart);
</script>	
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
     google.charts.load('current', {packages: ['corechart']});     
   </script>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 회원정보 부분 css -->

</head>
<body>
	<div class="row">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</div>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/anal/analSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md">
					<h2>도서관 통계</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md">
					<ul class="nav nav-tabs">
					  <li role="presentation"><a href="analSearch.ju">검색어통계</a></li>
					  <li role="presentation" class="active"><a href="analUser.ju">이용자 통계</a></li>
					  <li role="presentation"><a href="#">Messages</a></li>
					</ul>
				</div>
				<div class="col-md-5">
					<div id="container" style="width: 400px; height: 400px;"></div>
				</div>
				<div class="col-md-7">
					<div id="container1" style="width: 550px; height: 400px;"></div>
				</div>
				<div class="col-md-5">
					<div id="container2" style="width: 400px; height: 400px;"></div>
				</div>
				<div class="col-md-7">
					<div id="container3" style="width: 550px; height: 400px;"></div>
				</div>
			</div>
		</div>
	</div>
	
<script language="JavaScript">
function drawChart() {
   var gender = ${gender};
   var age = ${age};
   var email = ${email};
   var like = ${like};
   
   
   // gender
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows(gender);
   var options = {'title':'도서관 회원 성별',
      'width':500,
      'height':400};
   var chart = new google.visualization.PieChart(document.getElementById('container'));
   chart.draw(data, options);
   
	// age
   var data = google.visualization.arrayToDataTable(age);
   var options = {
      title: '도서관 회원 연령대'	  
   }; 
   var chart = new google.visualization.ColumnChart(document.getElementById('container1'));
   chart.draw(data, options);
   
   // email
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows(email);
   var options = {'title':'도서관 회원 사용 E-mail',
      'width':550,
      'height':400,
       pieHole: 0.4
   };
   var chart = new google.visualization.PieChart(document.getElementById('container2'));
   chart.draw(data, options);
   
   // like
   var data = google.visualization.arrayToDataTable(like);
   var options = {
      title: '도서관 회원 관심사'	  
   }; 
   var chart = new google.visualization.ColumnChart(document.getElementById('container3'));
   chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawChart);

</script>


</body>
>>>>>>> origin/Daewon
</html>