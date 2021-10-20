<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style type="text/css">
	.wrap {
		width: 300px;
		height: 300px;
		background-color: skyblue;
	}
	table {
		width: 100%;
		text-align: center;
		border-collapse: collapse;
	}
	
	table, td {
		border: 1px solid skyblue;
		padding: 10px;
	}
	td {
		background-color: white;
	}
	td:nth-child(4n) {
		background-color: pink;	
	}
</style>
</head>
<body>
	<div class="wrap">
		<p>계산기</p>
		<p>표준</p>
		<h1 style="text-align: right; margin-right: 10px;">0</h1>
		<table>
			<tr>
				<td>c</td>
			</tr>
			<tr>
				<td>7</td>
				<td>8</td>
				<td>9</td>
				<td>x</td>
			</tr>
			<tr>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>-</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>+</td>
			</tr>
			<tr>
				<td></td>
				<td>0</td>
				<td></td>
				<td>=</td>
			</tr>
		</table>	
	</div>

</body>
</html>