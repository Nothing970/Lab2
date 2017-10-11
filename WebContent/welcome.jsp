<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用</title>
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

			<div class="formtd" style="margin:30px 0 0 0;font-size:20px">
			<p>数据库中初始数据如下：</p><br>
			<table border="1" style="border-collapse: collapse;text-align:center">
				<tr>
					<th class="booktd" colspan="6">图书数据</th>
				</tr>
		        <tr>
			        <td class="booktd">图书ISBN</td>
				    <td class="booktd">图书标题</td>
				    <td class="booktd">作者ID</td>
				    <td class="booktd">出版社</td>
				    <td class="booktd">出版日期</td>
				    <td class="booktd">图书价格</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-302-20882-2</td>
				    <td class="booktd">AIR范例精解</td>
				    <td class="booktd">10011</td>
				    <td class="booktd">清华大学出版社</td>
				    <td class="booktd">2009-09-01</td>
				    <td class="booktd">59.80</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-121-28796-1</td>
				    <td class="booktd">语音识别实践</td>
				    <td class="booktd">10012</td>
				    <td class="booktd">中国工信出版集团</td>
				    <td class="booktd">2016-07-01</td>
				    <td class="booktd">79.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-121-28620-9</td>
				    <td class="booktd">自然语言处理</td>
				    <td class="booktd">10013</td>
				    <td class="booktd">中国工信出版集团</td>
				    <td class="booktd">2016-05-01</td>
				    <td class="booktd">79.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-111-51912-6</td>
				    <td class="booktd">Xcode</td>
				    <td class="booktd">10014</td>
				    <td class="booktd">机械工业出版社</td>
				    <td class="booktd">2015-11-12</td>
				    <td class="booktd">69.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-121-06074-8</td>
				    <td class="booktd">编程之美</td>
				    <td class="booktd">10015</td>
				    <td class="booktd">电子工业出版社</td>
				    <td class="booktd">2008-03-23</td>
				    <td class="booktd">40.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-302-30714-3</td>
				    <td class="booktd">DATA MINING</td>
				    <td class="booktd">10016</td>
				    <td class="booktd">IEEE PRESS</td>
				    <td class="booktd">2013-01-03</td>
				    <td class="booktd">59.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-111-45378-9</td>
				    <td class="booktd">计算机网络</td>
				    <td class="booktd">10017</td>
				    <td class="booktd">China Machine Press</td>
				    <td class="booktd">2016-11-01</td>
				    <td class="booktd">79.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-302-36038-4</td>
				    <td class="booktd">计算机系统结构教程（第二版）</td>
				    <td class="booktd">10018</td>
				    <td class="booktd">清华大学出版社</td>
				    <td class="booktd">2014-10-02</td>
				    <td class="booktd">39.50</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-04-037060-7</td>
				    <td class="booktd">工科数学分析</td>
				    <td class="booktd">10019</td>
				    <td class="booktd">高等教育出版社</td>
				    <td class="booktd">2008-01-05</td>
				    <td class="booktd">33.90</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-04-037018-8</td>
				    <td class="booktd">线性代数与空间解析几何</td>
				    <td class="booktd">10019</td>
				    <td class="booktd">高等教育出版社</td>
				    <td class="booktd">2008-06-12</td>
				    <td class="booktd">27.20</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-04-037018-8</td>
				    <td class="booktd">线性代数与空间解析几何</td>
				    <td class="booktd">10019</td>
				    <td class="booktd">高等教育出版社</td>
				    <td class="booktd">2008-06-12</td>
				    <td class="booktd">27.20</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-5603-3411-0</td>
				    <td class="booktd">数理逻辑引论</td>
				    <td class="booktd">10020</td>
				    <td class="booktd">哈尔滨工业大学出版社</td>
				    <td class="booktd">2011-11-11</td>
				    <td class="booktd">16.00</td>
		        </tr>
		        <tr>
			        <td class="booktd">978-7-04-022473-3</td>
				    <td class="booktd">数据结构与算法</td>
				    <td class="booktd">10021</td>
				    <td class="booktd">Higher Education Press</td>
				    <td class="booktd">2000-06-06</td>
				    <td class="booktd">29.00</td>
		        </tr>
			</table><br>
			<table border="1" style="border-collapse: collapse;text-align:center">
				<tr>
					<th class="booktd" colspan="4">作者数据</th>
				</tr>
		        <tr>
				    <td class="booktd">作者ID</td>
				    <td class="booktd">作者名字</td>
				    <td class="booktd">作者年龄</td>
				    <td class="booktd">作者国籍</td>
		        </tr>
		        <tr>
			        <td class="booktd">10011</td>
				    <td class="booktd">Marc Leuchner</td>
				    <td class="booktd">50</td>
				    <td class="booktd">Boston, America</td>
		        </tr>
		        <tr>
			        <td class="booktd">10012</td>
				    <td class="booktd">俞栋</td>
				    <td class="booktd">40</td>
				    <td class="booktd">America</td>
		        </tr>
		        <tr>
			        <td class="booktd">10013</td>
				    <td class="booktd">罗刚</td>
				    <td class="booktd">42</td>
				    <td class="booktd">中国</td>
		        </tr>
		        <tr>
			        <td class="booktd">10014</td>
				    <td class="booktd">李俊阳</td>
				    <td class="booktd">35</td>
				    <td class="booktd">中国</td>
		        </tr>
		        <tr>
			        <td class="booktd">10015</td>
				    <td class="booktd">《编程之美》小组	</td>
				    <td class="booktd">2</td>
				    <td class="booktd">中国</td>
		        </tr>
		        <tr>
			        <td class="booktd">10016</td>
				    <td class="booktd">Mehmed Kantardzic</td>
				    <td class="booktd">45</td>
				    <td class="booktd">America</td>
		        </tr>
		        <tr>
			        <td class="booktd">10017</td>
				    <td class="booktd">James F.Kurose</td>
				    <td class="booktd">50</td>
				    <td class="booktd">America</td>
		        </tr>
		        <tr>
			        <td class="booktd">10018</td>
				    <td class="booktd">张晨曦</td>
				    <td class="booktd">50</td>
				    <td class="booktd">中国</td>
		        </tr>
		        <tr>
			        <td class="booktd">10019</td>
				    <td class="booktd">哈尔滨工业大学数学系</td>
				    <td class="booktd">98</td>
				    <td class="booktd">中国</td>
		        </tr>
		         <tr>
			        <td class="booktd">10020</td>
				    <td class="booktd">张岩</td>
				    <td class="booktd">55</td>
				    <td class="booktd">中国</td>
		        </tr>
		        <tr>
			        <td class="booktd">10021</td>
				    <td class="booktd">张岩</td>
				    <td class="booktd">60</td>
				    <td class="booktd">中国</td>
		        </tr>
			</table>
			</div>
</body>
</html>