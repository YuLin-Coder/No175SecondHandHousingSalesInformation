<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>二手房买卖信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="/text2/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/text2/css/main.css"/>
    <script type="text/javascript" src="/text2/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/text2/js/libs/modernizr.min.js"></script>
	</script>
	<style type="text/css">
	
	
	</style>
	<script type="text/javascript">
	var error="${param.error}";
	if(error=="applycheck"){

	alert("你还没完善个人信息，请完善个人信息后再进行申请操作");
	}else if(error=="applysuccess"){
		alert("申请成功，请耐心等待房东联系您！");	
	}
		
	</script>
</head>
<body>
<div>
	<div class="result-title">
	<h1>合同信息列表</h1>
	</div>
	<form id="contractForm" name="contractForm" action="contractlist.action" method=post >
		<div class="result-title">
			<div class="result-list">
			</div>
		</div>

		<div class="result-content">
			<table id="grid" class="result-tab" width="100%">
				<tbody>
					<tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
							<td>卖方姓名</td>
						<td>卖方身份证号</td>
						<td>买方姓名</td>
						<td>买方身份证号</td>
						<td>中介姓名</td>
						<td>房屋位置</td>
						<td>房屋价格</td>
						<td>付款方式</td>
						<td>付款次数</td>
						<td>备注</td>
						<td>生效时间</td>
						<td>截止时间</td>
						<td>状态</td>
						<td>立契</td>
					</tr>
					<c:forEach items="${contractlist}" var="contractlist">
						<tr
										style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
										<td>${contractlist.sellername}</td>
										<td>${contractlist.selleridcard}</td>
										<td>${contractlist.buyername }</td>
										<td>${contractlist.buyeridcard}</td>
										<td>${contractlist.agencyname}</td>
										<td>${contractlist.houselocation}</td>
										<td>${contractlist.houseprice}</td>
										<td>${contractlist.paytype}</td>
										<td>${contractlist.paycount}</td>
										<td>${contractlist.note}</td>
										<td>${contractlist.starttime}</td>
										<td>${contractlist.endtime}</td>
										<td>
											<c:if test="${ contractlist.status == '2' }">
													待立契
											</c:if>
										</td>
										<td><a class="link-update"
											href="/text2/contract/makecontract.action?id=${contractlist.id }"
											onclick="return window.confirm('确定要完成立契吗？')">完成</a>
											&nbsp;&nbsp; 
										
							</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
					
						<tr>
						<tr>
							<span id=pagelink>
								<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right; margin-top:10px">
									共[<B>${p.total}</B>]条记录，共[<B>${p.pages}</B>]页
									,

									<c:if test="${ p.pageNum > 1 }">
													[<A href="javascript:to_page(${p.prePage})">前一页</A>]
												</c:if>
										<input type="hidden" name="page" id="page" value=""/>
									第<B>${p.pageNum}</B>页

									<c:if test="${ p.pageNum < p.pages }">
													[<A href="javascript:to_page(${p.nextPage})">后一页</A>] 
												</c:if>

									
								</div>
							</span>
						
						</tr>
						</tbody>
						</tbody>
	</form>
</div>
 <script language=javascript>
	// 提交分页的查询的表单
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.houseForm.submit();
	}
</script>
</body>
</html>