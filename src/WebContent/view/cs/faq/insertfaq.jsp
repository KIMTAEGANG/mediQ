<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        fieldset{margin:0 20% 0 20%; }
        .irum{text-align:center;}
        #title{padding: 5px 0 5px 0;}
        .btn{text-align:right;}
        select{padding: 3px 0 5px 0 ;}
        #titletd{padding-top: 7px; padding-bottom:10px;}
    </style>
</head>
<body>
	<h1>FAQ</h1>
<hr/><br/>
    <form method="get" id="frm1" action="./faqList.jsp">
        <fieldset>
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td width="150" height="30" class="irum">����</td>
                    <td>
                        <select>
                            <option value="����">����</option>
                            <option value="�α���">�α���</option>
                            <option value="��ǰ ����">��ǰ ����</option>
                            <option value="��Ÿ">��Ÿ</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="150" height="30" class="irum">����</td>
                    <td id="titletd"><input type="text" id="title" name="title" size="50" placeholder="������ �Է��ϼ���" /> </td>
                <tr>
                    <td class="irum">����</td>
                    <td><textarea cols="70" rows="10" id="content" name="content" placeholder="������ �Է��ϼ���"></textarea></td>
                <tr>
                    <td colspan="2" class="btn"><br/>
                        <input type="submit" id="submitBtn" name="submitBtn" value="Ȯ��"/>
                        <input type="reset" id="resetBtn" name="resetBtn" value="���"/>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>