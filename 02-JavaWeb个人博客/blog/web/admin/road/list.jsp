<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/admin/css/Style1.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript">
			function addRoadItem() {
				window.location.href = "${pageContext.request.contextPath}/admin?method=addRoadItemUI";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>路线图列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addRoadItem()">
							&#28155;&#21152;
						</button>

					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">
									编号
								</td>
								<td align="center" width="15%">
									路线点名称
								</td>
								<td align="center" width="65%">
									路线点名称
								</td>
								<td width="5%" align="center">
									编辑
								</td>
								<td width="5%" align="center">
									删除
								</td>
							</tr>
							<c:forEach items="${ map }" var="year_info">
								<c:forEach items="${year_info.value}" var="roaditem">
									<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">
											${roaditem.rid}
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
											${roaditem.title}
										</td>
										<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="65%">
												${roaditem.content}
										</td>
										<td align="center" style="HEIGHT: 22px">
											<a href="${ pageContext.request.contextPath }/admin?method=editRoadItemUI&rid=${roaditem.rid}">
												<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
											</a>
										</td>
										<td align="center" style="HEIGHT: 22px">
											<a href="${ pageContext.request.contextPath }/admin?method=deleteRoadItem&rid=${roaditem.rid}">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</body>
</HTML>

