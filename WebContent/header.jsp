<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<style>
*{
	margin: 0;
	padding: 0;
}

html,body{
	width: 100%;
	height: 100%;
}

header{
	width: 100%;
	height: 12%;
	background: steelblue;
	color: white;
	line-height: 120px;
	text-align: center;
}

nav{
	width: 100%;
	height: 5%;
	background: purple;
	color: white;
	line-height: 45px;
	text-align: center;
}
nav ul {
	display: inline-block;
	list-style-type: none;
}

nav li {
	float: left;
	margin: 0 20px;
}

nav a {
	display: block;
	text-decoration: none;
	color: white;
}

nav a:HOVER {
	color: white;
	font-size: 1.1em;
	font-weight: bold;
}

section{
	width: 100%;
	height: 78%;
}

section h2{
	margin: 20px auto;
	text-align: center;
}

footer{
	width: 100%;
	height: 5%;
	background: grey;
	color: white;
	line-height: 45px;
	text-align: center;
	font-size: 0.9em;
}

table{
	margin: 0 auto;
	border-collapse: collapse;
	border: 2px solid grey;	
}

tr,th,td{
	border: 1px solid black;	
}

#tr_btn{
	height: 50px;
}

#btn1{
	width: 110px;
	height: 30px;
	background: lightgrey;
	color: black;
}

#btn2{
	width: 110px;
	height: 30px;
	background: black;
	color: white;
}

.btn_group{
	margin: 15px auto;
}

#p1{
	margin-right: 5px;
	text-align: right;
}

#p2{
	margin-left: 5px;
	text-align: left;
}
</style>
</head>
<body>
	<header>
		<h1>매장 입출고 관리 시스템 ver 1.0</h1>
	</header>
</body>
</html>