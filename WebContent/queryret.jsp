<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询图书</title>
<link rel="stylesheet" href="css/mystyle.css">
</head>

<body>
			<div class="nav">
				<ul>
					<li><a href="welcome.jsp">首页</a></li>
					<li><a href="newbook.jsp">新增图书</a></li>
					<li><a href="updatebook.jsp">更新图书</a></li>
				</ul>
				<s:form action="queryAuthorBook" method="post">
					<input type="text" name="AuthorName" id="AuthorName" class="search">
					<button class="searchbtn" onclick="this.form.submit()"><span>开始查询 </span></button>
				</s:form>
			</div>
			
			<div>  
			<ul><li class="ret" id="query_ret" style="margin:20px 0 0 550px;font-size:20px"></li></ul>
		    <table id="bookList" class="querytable">
		        <tr>
		            <th class="booktd">图书编号</th>
			        <th class="booktd">图书ISBN</th>
				    <th class="booktd">图书标题</th>
				    <th class="booktd">作者ID</th>
				    <th class="booktd">出版社</th>
				    <th class="booktd">出版日期</th>
				    <th class="booktd">图书价格</th>
				    <th class="booktd">编辑操作</th>
				    <th class="booktd">删除操作</th>
		        </tr>
				<s:iterator value="#request.bookList" id="book" status="number">
					<tr>
						<td class="booktd"><s:property value="#number.index"/></td>
						<td class="booktd"><s:property value="#book.ISBN"/></td>
						<td>
							<button  class="btn2" onclick="queryBookDetail('<s:property value="#book.ISBN"/>',<s:property value='#book.AuthorID'/>)"><s:property value='#book.Title'/></button>
						</td>
						<td class="booktd"><s:property value="#book.AuthorID"/></td>
						<td class="booktd"><s:property value="#book.Publisher"/></td>
						<td class="booktd"><s:property value="#book.PublishDate"/></td>
						<td class="booktd"><s:property value="#book.Prices"/></td>
						<td>
						<s:form action="editBook" method="post">
							<s:hidden name="ISBN" value="%{#book.ISBN}"/>
							<button  class="btn2" onclick="this.form.submit()">编辑图书</button>
						</s:form>
						</td>
						<td>
						<s:form action="deleteBook" method="post">
							<s:hidden name="ISBN" value="%{#book.ISBN}"/>
							<s:hidden name="AuthorName" value="%{#request.authorName}"/>
							<button  class="btn2" onclick="this.form.submit()">删除图书</button>
						</s:form>
						</td>
					</tr>
			    </s:iterator>
			</table>
			</div>

			<div id="fade" class="black_overlay"></div>
			<div id="light" class="white_content">
			<table>
				<tr>
		            <th class="booktd">图书详细信息</th>
		            <th><button  class="btn2" onclick="closeMask()" style="float:right">关闭</button></th>
		        </tr>
		        <tr>
		            <td class="booktd">图书ISBN</td>
		            <td class="booktd" id="mask_ISBN"></td>
		        </tr>
		        <tr>
		            <td class="booktd">图书标题</td>
		            <td class="booktd" id="mask_Title"></td>
		        </tr>
		        <tr>
		            <td class="booktd">作者ID</td>
		            <td class="booktd" id="mask_BookAuthorID"></td>
		        </tr>
		        <tr>
		            <td class="booktd">出版社</td>
		            <td class="booktd" id="mask_Publisher"></td>
		        </tr>
		        <tr>
		            <td class="booktd">出版日期</td>
		            <td class="booktd" id="mask_PublishDate"></td>
		        </tr>
		         <tr>
		            <td class="booktd">图书价格</td>
		            <td class="booktd" id="mask_Prices"></td>
		        </tr>
			</table>
			<ul><li class="booktd">-------------------------------------------</li></ul>
			<table>
				<tr>
		            <th class="booktd">作者详细信息</th>
		        </tr>
		        <tr>
		            <td class="booktd">作者ID</td>
		            <td class="booktd" id="mask_AuthorID"></td>
		        </tr>
		        <tr>
		            <td class="booktd">作者名字</td>
		            <td class="booktd" id="mask_AuthorName"></td>
		        </tr>
		        <tr>
		            <td class="booktd">作者年龄</td>
		            <td class="booktd" id="mask_AuthorAge"></td>
		        </tr>
		        <tr>
		            <td class="booktd">作者国家</td>
		            <td class="booktd" id="mask_AuthorCountry"></td>
		        </tr>
			</table>
			</div>   

			<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
			<script type="text/javascript">
			$(document).ready(function(){
				var ret="${request.queryRet}";
        		if(ret=="empty"){
        			document.getElementById("query_ret").innerText="请输入作者名字";
        		}else if(ret=="noauthor"){
        			document.getElementById("query_ret").innerText="作者不存在";
        		}else if(ret=="nobook"){
        			document.getElementById("query_ret").innerText="没有该作者写的书";
        		}else{
        			document.getElementById("bookList").style.display="block";
        			document.getElementById("AuthorName").value="${request.AuthorName}";
        		}
        	});
        	function queryBookDetail(a,b){
        		$.ajax({
	                url:"query_queryBookDetail",
	                data:{'ISBN':a,
	                	  'AuthorID':b
	                },
	                dataType:'json',
	                type:'post',  
	                async: false,  
	                success:function(data){
	                	var d = eval("("+data+")");
	                 	var book=d.book;
	                 	var author=d.author;
                	    document.getElementById('light').style.display='block';
                	    document.getElementById('fade').style.display='block';
	                 	document.getElementById("mask_ISBN").innerText=book["ISBN"];
	                    document.getElementById("mask_Title").innerText=book["Title"];
                	    document.getElementById("mask_BookAuthorID").innerText=book["AuthorID"];
                	    document.getElementById("mask_Publisher").innerText=book["Publisher"];
                	    document.getElementById("mask_PublishDate").innerText=book["PublishDate"];
                	    document.getElementById("mask_Prices").innerText=book["Prices"]+"元";
                	    document.getElementById("mask_AuthorID").innerText=author["AuthorID"];
	                    document.getElementById("mask_AuthorName").innerText=author["AuthorName"];
                	    document.getElementById("mask_AuthorAge").innerText=author["AuthorAge"];
                	    document.getElementById("mask_AuthorCountry").innerText=author["AuthorCountry"];
	                },
	               error:function () {alert("error");}
	             });  
        	}
        	function closeMask(){
        		document.getElementById('light').style.display='none';
         	    document.getElementById('fade').style.display='none';
        	}
			</script>
        

</body>
</html>