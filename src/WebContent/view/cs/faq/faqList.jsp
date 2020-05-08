<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <style>
        .page_body{width:80%; margin:0px 10% 0px 10%;}
        #category{float:left;}
        #fsearch{float:right;}
        #fboard_list{clear:bo	th;}
        th{padding:13px 0 12px 0; background:gray;}
        #pageBtn{text-align:center;}
        #writebtn{float:right; margin-top:25%;}
        tr{text-align:center;}
        a{text-decoration:none; color:black;}
        table{margin-top:30px;}
    </style>
</head>
<body>

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
    	<table cellpadding="0" cellspacing="0" board="1" width="100%">
    		<thead>
    			<tr>
    				<th width="10%">��ȣ</th>
    				<th width="35%">����</th>
    				<th width="10%">ī�װ�</th>
    				<th width="10%">�۾���</th>
    				<th width="10%">��¥</th>
    				<th width="5%">��ȸ</th>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td>��ȣ</td>
    				<td><a href="#">����</a></td>
    				<td>�α���</td>
    				<td>�۾���</td>
    				<td>��¥</td>
    				<td>��ȸ��</td>
    			</tr>
    			<tr>
    				<td>��ȣ</td>
    				<td><a href="#">����</a></td>
    				<td>�α���</td>
    				<td>�۾���</td>
    				<td>��¥</td>
    				<td>��ȸ��</td>
    			</tr>
    		</tbody>
    	</table>
</body>
</html>