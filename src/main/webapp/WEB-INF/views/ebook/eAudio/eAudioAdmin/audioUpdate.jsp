<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Audio admin</title>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<!-- jQuery import -->
<script src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="/lee/resources/audio/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="/lee/resources/audio/js/jquery.MultiFile.js"></script>

<script>

var idx = location.search;
var idxArray = idx.split("=");
var elIdx = idxArray[1];

$(document).ready(function(){
	
	console.log(elIdx);
	
	$("#cateLg").change(
			function() {
				var cateLgVal=$("#cateLg").val();
				if(cateLgVal==99){
					$("#cateMd").css("display", "none");
				}
				else{
					$.ajax({
						type : "GET"
						, url : "audioCate.ju"
						, data : {cateLgVal : cateLgVal}
						, dataType : "json"
						, success: function(data){
							console.log(data);
							var cateMdArr=data.cateMd;
							var cateMdOption=""
							for(var i=0 ; i<cateMdArr.length ; i++){
								cateMdOption+="<option value='" + i + "'>" + cateMdArr[i] + "</option>";
							}
							$("#cateMd").css("display", "block").html(cateMdOption);
						}
					});
				}
		});
	
	$('#cateLg').change();
	
	//오디오 파일 제한 올리기 전용 업로드
	$('#multiform input[name=audio]').MultiFile({
		max: '@', //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
		accept: 'mp3', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
		maxfile: '@', //각 파일 최대 업로드 크기 1GB?
		maxsize: '@',  //전체 파일 최대 업로드 크기 10GB?
		STRING: { //Multi-lingual support : 메시지 수정 가능
		    remove : "제거", //추가한 파일 제거 문구, 이미지태그를 사용하면 이미지사용가능
		    duplicate : "$file 은 이미 선택된 파일입니다.", 
		    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
		    selected:'$file 을 선택했습니다.', 
		    toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
		    toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
		    toobig: "$file 은 크기가 매우 큽니다. (max $size)"
		},
		list:"#afile3-list" //파일목록을 출력할 요소 지정가능
	});
	
	//이미지 파일 제한 올리기 전용 업로드
	$('#multiform input[name=abimg]').MultiFile({
		max: '@', //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
		accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
		maxfile: 1000000000, //각 파일 최대 업로드 크기 1GB?
		maxsize: 10000000000,  //전체 파일 최대 업로드 크기 10GB?
		STRING: { //Multi-lingual support : 메시지 수정 가능
		    remove : "제거", //추가한 파일 제거 문구, 이미지태그를 사용하면 이미지사용가능
		    duplicate : "$file 은 이미 선택된 파일입니다.", 
		    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
		    selected:'$file 을 선택했습니다.', 
		    toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
		    toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
		    toobig: "$file 은 크기가 매우 큽니다. (max $size)"
		},
		list:"#afile3-list" //파일목록을 출력할 요소 지정가능
	});
});
</script>
</head>
<body>

<h3>오디오 정보 수정</h3>
<form name="multiform" id="multiform" action="eAudioUpdateGo.ju" >
	<!-- 책 정보 입력 -->
	<table class="table">
		<tbody>
			<tr>
				<th>책 이름</th>
				<td><input type="text" class="form-control" placeholder="책이름" name="el_subject" value="${ablist.el_subject }" required="required"></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" class="form-control" placeholder="저자" name="el_writer" value="${ablist.el_writer }" required="required"></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" class="form-control" placeholder="출판사" name="el_pub" value="${ablist.el_pub }" required="required"></td>
			</tr>
			<tr>
				<td>${cateLg }</td>
				<td><select id="cateMd" name="cateMd" class="form-control"  required="required"></select></td>
			</tr>
			<tr>
				<th>책 정보</th>
				<td><textarea class="form-control" rows="3" name="el_info" required="required">${ablist.el_info }</textarea></td>
			</tr>
		</tbody>
	</table>
	
	<input type="submit" id="btnSubmit" value="수정" /><br/>
</form>	

<script>

/*jQuery form 플러그인을 사용하여 폼데이터를 ajax로 전송*/

var downGroupCnt =0; //다운로드그룹 개수카운트

$(function(){
    
	//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
    $('#multiform').ajaxForm({
       cache: false,
       url:"eAudioUpdateGo.ju",
       dataType:"json",
       data:{elIdx :elIdx},
       //보내기전 validation check가 필요할경우
       beforeSubmit: function (data, frm, opt) {
	       alert("전송중");
           return true;
       },
       //submit이후의 처리
       success: function(data){
    	   
    	   alert("전송성공!!");
           console.log(data); //응답받은 데이터 콘솔로 출력         
           location.href='eAudioListAdmin.ju';
           output(data); //받은 정보를 화면 출력하는 함수 호출
       },
       //ajax error
       error: function(e){
           console.log(e);
       }                               
	});
});

//전달받은 정보를 가지고 화면에 보기 좋게 출력
function output(data) {
	//업로드한 파일을 다운로드할수있도록 화면 구성
	$("#result").append("<h3>("+(++downGroupCnt)+") 다운로드</h3>");
    $("#result").append("제목:"+data.title+"<br/>");
    $("#result").append("설명:"+data.description+"<br/>");
  
    if(data.photo){
        $("#result").append("포토:<br/>");           
        $.each(data.photo, function(index, item){
     	   var link = "FileDownload?f="+item.uploadedFileName+"&of="+item.fileName;
     	   $("#result").append("<a href='"+ link +"' download>"+item.fileName+"</a>");
            $("#result").append("<br/>");	               
        });
    }           
	 /*
 	if(data.file){
        var link = "FileDownload?f="+data.file.uploadedFileName+"&of="+data.file.fileName;
        $("#result").append("파일 :<a href='"+ link +"' download>"+data.file.fileName+"</a>");
        $("#result").append("<br/>");
    } */
    
    $('#multiform')[0].reset(); //폼 초기화(리셋); 
    $('#multiform input:file').MultiFile('reset'); //멀티파일 초기화        
}
</script>

</body>
</html>