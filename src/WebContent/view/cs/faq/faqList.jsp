<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <style>
        .page_body{width:80%; margin:0px 10% 0px 10%;}
        #category{float:left;}
        #fsearch{float:right;}
        #fboard_list{clear:both;}
        th{padding:13px 0 12px 0; background:gray;}
        #pageBtn{text-align:center;}
        #writebtn{float:right; margin-top:25%;}
        tr{text-align:center;}
        a{text-decoration:none; color:black;}
        table{margin-top:30px;}
        #writeBtn{float:right;}
        .hidden{display:none;}
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="../js/faq.js" charset='euc-kr'></script>
</head>
<body>
faqPage=${faqPage}<br/>
	*���������� ${faqPage.total}��<br/>
	���������� : ${faqPage.currentPage}/���������� ${faqPage.totalPages }
<h1>FAQ</h1>
<hr/><br/>
<div class="page_body">
    <div class="board_search">
        <select name="category" id="category" onchange="if(this.value) location.href=(this.value);">
            <option value="����">����</option>
            <option value="faqList.jsp?category=�α���">�α���</option>
            <option value="faqList.jsp?category=��ǰ ����"><a href="#">��ǰ ����</a></option>
            <option value="faqList.jsp?category=��Ÿ"><a href="#">��Ÿ</a></option>
        </select>
        <form name="fsearch" id="fsearch" method="get" action="faqList.jsp">
            <input type="text" name="search" id="search">
            <input type="submit" value="�˻�" class="btn_submit">
        </form>
    </div>
    <div id="fboard_list"><br/>
    	<table cellpadding="0" cellspacing="0" board="1" width="100%" class="result">
    		<thead>
    			<tr>
    				<th width="10%">��ȣ</th>
    				<th width="35%">����</th>
    				<th width="10%">�۾���</th>
    				<th width="10%">��¥</th>
    				<th width="10%">ī�װ�</th>
    				<th width="5%">��ȸ</th>
    			</tr>
    		</thead>
    			<c:if test="${ articlePAGE.hasNoFaq()}">
	    			<tr>
	    				<td colspan="6">�Խñ��� �������� �ʽ��ϴ�</td>
	   				</tr>
    			</c:if>
				<c:forEach var="faq" items="${faqPage.content }">
	    			<tr class="row">
	    				<td>${faq.sn }</td>
	    				<td>${ faq.title }</td>
	    				<td>${faq.writer }</td>
	    				<td>${faq.rdate }</td>
	    				<td>${faq.category }</td>
	    				<td>${faq.vcount }</td>
	    			</tr>
	    			<tr class="hidden">
	    				<td colspan="6">
	    					<p>${faq.contents}</p>
	    					<%-- <c:if test=""> --%>
	    					<form method="post" action="./insertfaq.jsp">
	    						<input type="submit" id="modifyBtn" name="modifyBtn" value="����"/>
	    						<input type="button" id="deleteBtn"  name="deleteBtn" value="����" onclick="f1()"/>
	    					</form>
	    					<%-- </c:if> --%>
	    				</td>
	   				</tr>
				</c:forEach>
				<%-- <c:if test=""> --%>
				<tr>
					<td colspan="6"><a href="/mediq/faqinsert.do"><input type="button"  id="writeBtn" value="�۾���"/></a></td>
				</tr>
				<%-- </c:if> --%>
				<!--  ����¡ ó�� -->
				<c:if test="${articlePAGE.hasFaq()}">
				<tr>
					<td colspan="6">
						<c:if test="${faqPage.startPage>10 }">
							<a href="faqlist.do?pageNo=${ faqPage.startpage-10 }">[����]</a>
						</c:if>
						
						<c:forEach var="pNo" begin="${ faqPage.startPage }" end="${ faqPage.endPage }">
							<a href="faqlist.do?pageNo=${pNo }">[${pNo}]</a>
						</c:forEach>
						
						<c:if test="${faqPage.endPage<faqPage.totalPages }">
							<a href="faqlist.do?pageNo=${faqPage.startpage+10 }">[����]</a>
						</c:if>
					</td>
				</tr>
			</c:if>
    	</table>
   	</div>
 </div>
</body>
</html>