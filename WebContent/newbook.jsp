<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增图书</title>
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
    
    <div class="myform" >
		<table>
			<tr>
			<td class="formtd">图书ISBN:</td>
			<td><input type="text" name="ISBN" id="form_ISBN" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">图书题目:</td>
			<td><input type="text" name="Title" id="form_Title" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">作者ID:</td>
			<td><input type="text" onkeyup="this.value=this.value.replace(/\D/g, '')" name="BookAuthorID" id="form_BookAuthorID" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">出版社:</td>
			<td><input type="text" name="Publisher" id="form_Publisher" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">出版日期:</td>
			<td><input type="text" name="PublishDate" id="form_PublishDate" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">图书价格:</td>
			<td><input type="text" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" name="Prices" id="form_Prices" class="bookdetail"></td>
			</tr>
		</table>
	</div>
    
    <div class="retform"> 
    <button class="newbtn" onclick="newBook()"><span>增加图书 </span></button>
    <ul><li class="ret" id="operation_ret" ></li></ul>
    </div>
    
    <div class="myform" id="authorform" style="display:none">
		<table>
			<tr>
			<td class="formtd">作者ID:</td>
			<td><input type="text" onkeyup="this.value=this.value.replace(/\D/g, '')" name="AuthorID" id="form_AuthorID" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">作者姓名:</td>
			<td><input type="text" name="AuthorName" id="form_AuthorName" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">作者年龄:</td>
			<td><input type="text" name="AuthorAge" id="form_AuthorAge" class="bookdetail"></td>
			</tr>
			<tr>
			<td class="formtd">作者国籍:</td>
			<td><input type="text" name="AuthorCountry" id="form_AuthorCountry" class="bookdetail"></td>
			</tr>
		</table>
	</div>
	
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
	function newBook(){
   	 if(document.getElementById("form_ISBN").value!="" &&
 	        document.getElementById("form_Title").value!="" &&
	        document.getElementById("form_BookAuthorID").value!="" &&
	        document.getElementById("form_Publisher").value!="" &&
	        document.getElementById("form_PublishDate").value!="" &&
	        document.getElementById("form_Prices").value!=""){
	    	 $.ajax({
	                url:"new_newBook",
	                data:{'ISBN':$('#form_ISBN').attr('value'),
	                	  'Title':$('#form_Title').attr('value'),
	                	  'BookAuthorID':$('#form_BookAuthorID').attr('value'),
	                	  'Publisher':$('#form_Publisher').attr('value'),
	                	  'PublishDate':$('#form_PublishDate').attr('value'),
	                	  'Prices':$('#form_Prices').attr('value'),
	                	  'AuthorID':$('#form_AuthorID').attr('value'),
	                	  'AuthorName':$('#form_AuthorName').attr('value'),
	                	  'AuthorAge':$('#form_AuthorAge').attr('value'),
	                	  'AuthorCountry':$('#form_AuthorCountry').attr('value')
	                },
	                dataType:'json',
	                type:'post',  
	                async: false,  
	                success:function(data){
	                   if(data=="differ"){
		                   $('#operation_ret').text("作者ID不一致");
	                	   document.getElementById("form_AuthorID").value="";
	                	   document.getElementById("form_AuthorName").value="";
	                	   document.getElementById("form_AuthorAge").value="";
	                	   document.getElementById("form_AuthorCountry").value="";
	                   }else if(data=="noauthor"){
	                	   $('#operation_ret').text("作者不存在，请输入作者信息");
	                	   document.getElementById("authorform").style.display="block";
	                   }else if(data=="bookexist"){
	                	   $('#operation_ret').text("图书ISBN已经存在");
	                   }else if(data=="addbook"){
	                	   $('#operation_ret').text("成功加入图书");
	                	   document.getElementById("authorform").style.display="none";
	                	   document.getElementById("form_ISBN").value="";
	                	   document.getElementById("form_Title").value="";
	                	   document.getElementById("form_BookAuthorID").value="";
	                	   document.getElementById("form_Publisher").value="";
	                	   document.getElementById("form_PublishDate").value="";
	                	   document.getElementById("form_Prices").value="";
	                	   document.getElementById("form_AuthorID").value="";
	                	   document.getElementById("form_AuthorName").value="";
	                	   document.getElementById("form_AuthorAge").value="";
	                	   document.getElementById("form_AuthorCountry").value="";
	                   }else{
	                	   $('#operation_ret').text("成功加入图书和作者");
	                	   document.getElementById("authorform").style.display="none";
	                	   document.getElementById("form_ISBN").value="";
	                	   document.getElementById("form_Title").value="";
	                	   document.getElementById("form_BookAuthorID").value="";
	                	   document.getElementById("form_Publisher").value="";
	                	   document.getElementById("form_PublishDate").value="";
	                	   document.getElementById("form_Prices").value="";
	                	   document.getElementById("form_AuthorID").value="";
	                	   document.getElementById("form_AuthorName").value="";
	                	   document.getElementById("form_AuthorAge").value="";
	                	   document.getElementById("form_AuthorCountry").value="";
	                   }
	                },
	               error:function () {alert("error");}
	             });  
   	 }else{
   		 $('#operation_ret').text("输入不能为空");
   	 }
    }
	</script>
        

</body>
</html>