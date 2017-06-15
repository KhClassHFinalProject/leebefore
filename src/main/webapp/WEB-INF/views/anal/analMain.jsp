<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>

<!-- 검색어부분링크 -->
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,600,200italic,600italic&subset=latin,vietnamese' rel='stylesheet' type='text/css'>
<script src="http://phuonghuynh.github.io/js/bower_components/jquery/dist/jquery.min.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/d3/d3.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/d3-transform/src/d3-transform.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/extarray.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/misc.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/micro-observer.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/microplugin/src/microplugin.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/bubble-chart.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/plugins/central-click/central-click.js"></script>
<script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/plugins/lines/lines.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 검색어 부분 css -->
<style>
  .bubbleChart {
    min-width: 100px;
    max-width: 1000px;
    height: 700px;
    margin: 0 auto;
  }
  .bubbleChart svg{
    background: white;
  }
</style>
<!-- 검색어부분 js -->
<script type="text/javascript">
var a = ${list};
	$(document).ready(function () {
		  var bubbleChart = new d3.svg.BubbleChart({
		    supportResponsive: true,
		    //container: => use @default
		    size: 600,
		    //viewBoxSize: => use @default
		    innerRadius: 600 / 3.5,
		    //outerRadius: => use @default
		    radiusMin: 50,
		    //radiusMax: use @default
		    //intersectDelta: use @default
		    //intersectInc: use @default
		    //circleColor: use @default
		    data: {
		      items: a,
		      eval: function (item) {return item.count;},
		      classed: function (item) {return item.text.split(" ").join("");}
		    },
		    plugins: [
		      {
		        name: "central-click",
		        options: {
		          text: "(See more detail)",
		          style: {
		            "font-size": "12px",
		            "font-style": "italic",
		            "font-family": "Source Sans Pro, sans-serif",
		            //"font-weight": "700",
		            "text-anchor": "middle",
		            "fill": "white"
		          },
		          attr: {dy: "65px"},
		          centralClick: function() {
		            alert("Here is more details!!");
		          }
		        }
		      },
		      {
		        name: "lines",
		        options: {
		          format: [
		            {// Line #0
		              textField: "count",
		              classed: {count: true},
		              style: {
		                "font-size": "28px",
		                "font-family": "Source Sans Pro, sans-serif",
		                "text-anchor": "middle",
		                fill: "white"
		              },
		              attr: {
		                dy: "0px",
		                x: function (d) {return d.cx;},
		                y: function (d) {return d.cy;}
		              }
		            },
		            {// Line #1
		              textField: "text",
		              classed: {text: true},
		              style: {
		                "font-size": "14px",
		                "font-family": "Source Sans Pro, sans-serif",
		                "text-anchor": "middle",
		                fill: "white"
		              },
		              attr: {
		                dy: "20px",
		                x: function (d) {return d.cx;},
		                y: function (d) {return d.cy;}
		              }
		            }
		          ],
		          centralFormat: [
		            {// Line #0
		              style: {"font-size": "50px"},
		              attr: {}
		            },
		            {// Line #1
		              style: {"font-size": "30px"},
		              attr: {dy: "40px"}
		            }
		          ]
		        }
		      }]
		  });
		});
	</script>

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
					  <li role="presentation" class="active"><a href="analSearch.ju">검색어통계</a></li>
					  <li role="presentation"><a href="analUser.ju">이용자통계</a></li>
					</ul>
				</div>
				<div class="col-md">
					<div class="bubbleChart" ></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>