<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- search -->
<div class="container-fluid" style="background-image: url('/lee/resources/find/img/bookImg2.jpg');">
	<div class="row-fluid">
		<form class="col-md" name="submit" onsubmit="return false;">
		  <div class="input-group">
		    <input type="text" class="form-control query" placeholder="Search" name="query" id="query">
		    <div class="input-group-btn">
		      <button class="btn btn-default" type="submit" onclick="detailSearch()">
		        <i class="glyphicon glyphicon-search"></i>
		      </button>
		    </div>
		  </div>
		</form>
	</div>
</div>

<!-- detail -->
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne" style="text-align: center;">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          		<i class="glyphicon glyphicon-chevron-down"></i>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <!-- detail search -->
		<div class="container-fluid">
			<div class="row-fluid">
			<form class="col-md" name="submit" onsubmit="return false;">
				<!-- category -->
				<div class="col-md-5">
					<div class="row-fluid">
						<div class="col-md">
							<select name="bk_lg" id="bk_lg" class="form-control" onchange="find()">
								<option selected="selected" value="99">전체</option>
								<option value="0">철학</option>
								<option value="1">종교</option>
								<option value="2">인문과학</option>
								<option value="3">자연과학</option>
								<option value="4">예술</option>
								<option value="5">언어</option>
								<option value="6">문학</option>
								<option value="7">역사</option>
							</select>
						</div>
						<div class="col-md">
							<div class="md col-md"></div>
						</div>
					</div>
				</div>
				<div class="col-md-5 col-md-offset-2">
					<div class="row">
						<div class="col-md">
							<input type="text" name="bk_writer" id="bk_writer" class="form-control" placeholder="저자"/>
						</div>
						<div class="col-md">
							<input type="text" name="bk_publisher" id="bk_publisher" class="form-control" placeholder="출판사"/>
						</div>
						
					</div>
				</div>
				
				<div class="col-md col-md-offset-1">
					<div class="row-fluid">
						<div class="input-group input-group-btn" style="text-align: center; padding-top: 20px;">
				      		<button class="btn btn-default btn-lg" id="1" type="submit" onclick="detailSearch()">
				       		 <i class="glyphicon glyphicon-search"></i>
				      		</button>
				    	</div>
					</div>
				</div>
			</form>	
			</div>
		</div>
      </div>
    </div>
  </div>
</div>

    