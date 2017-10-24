<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/thirdlib/web/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/thirdlib/web/css/main.css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.simple.min.js"></script>

<script type="text/javascript">
window.onload = function(){
var myChart = echarts.init(document.getElementById('main'));
// 指定图表的配置项和数据
var option = {
    title: {
        text: 'ECharts 入门示例'
    },
    tooltip: {},
    legend: {
        data:['销量']
    },
    xAxis: {
        data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
    },
    yAxis: {},
    series: [{
        name: '销量',
        type: 'bar',
        data: [5, 20, 36, 10, 10, 20]
    }]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
}
</script>
</head>
<body class="childrenBody">
	<div class="panel_box row">
		<div class="panel col">
				<div class="panel_icon">
					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
				</div>
				<div class="panel_word newMessage">
					<span></span>
					<cite>新消息</cite>
				</div>
		</div>
		
		<div class="panel col">
				<div class="panel_icon" style="background-color:#FF5722;">
					<i class="iconfont icon-dongtaifensishu" data-icon="icon-dongtaifensishu"></i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<cite>新增人数</cite>
				</div>
			
		</div>
		
		<div class="panel col">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<cite>用户总数</cite>
				</div>
		
		</div>
		
		<div class="panel col">
				<div class="panel_icon" style="background-color:#5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
				</div>
				<div class="panel_word imgAll">
					<span> ${num} </span>
					<cite>在线人数</cite>
				</div>
		</div>
		
		<div class="panel col">
				<div class="panel_icon" style="background-color:#F7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
					<span></span>
					<cite>商品总数</cite>
				</div>
		</div>
		<div class="panel col max_panel">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word allNews">
					<span></span>
					<cite>订单总数</cite>
				</div>
		
		</div>
	</div>


	<div class="row">
		<div class="sysNotice col" id="main" style="width: 600px;height:400px;">
			<blockquote class="layui-elem-quote title">更新日志</blockquote>
			
		</div>
		<div class="sysNotice col">
			<blockquote class="layui-elem-quote title">系统基本参数</blockquote>
			<table class="layui-table">
				<colgroup>
					<col width="150">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>当前版本</td>
						<td class="version">淘一淘1.0</td>
					</tr>
					<tr>
						<td>开发作者</td>
						<td class="author">郝振</td>
					</tr>
					<tr>
						<td>网站首页</td>
						<td class="homePage"><a href="${pageContext.request.contextPath}/user/logout.shtml">前台首页</a></td>
					</tr>
					<tr>
						<td>服务器环境</td>
						<td class="server">tomcat </td>
					</tr>
					<tr>
						<td>数据库版本</td>
						<td class="dataBase">mysql5.0</td>
					</tr>
					<tr>
						<td>最大上传限制</td>
						<td class="maxUpload">100k</td>
					</tr>
					<tr>
						<td>当前用户权限</td>
						<td class="userRights">操作员</td>
					</tr>
				</tbody>
			</table>
			<blockquote class="layui-elem-quote title">最新文章<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news"></tbody>
			</table> 
		</div>
	</div>

</body>
</html>