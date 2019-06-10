<%@page import="Bean.*,DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>个人中心-学生</title>

    <!-- css -->
    <link href="../css/PC.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />

    <!--javascript-->
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>



    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <link href="../css/header_and_footer.css" rel="stylesheet" />
</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
    <iframe src="../header_and_footer/header.html" id="iframe-header"></iframe>
  <div class="jskapian chengse">
  <br/><br/>
		<div class="touxiang"><img src="../image/sivan.jpg"/>
		</div>
		<div style="position:absolute;left:50%;margin:0 20px;width:220px;">
		<h1>StCarmen</h1>
		<h2>ä¸­å½äººæ°å¤§å­¦</h2>
		<div class="guanzhu">å³æ³¨TA</div></div>
		<p>ããããããããããä¸ªæ§ç­¾åããããããããããã</p>
		<div class="hang">
		<div class="geshu">1</div>
		<div class="geshu">1</div>
		<div class="geshu">52</div></div>
		<div class="hang">
		<div class="geshu">å³æ³¨</div>
		<div class="geshu">ç²ä¸</div>
		<div class="geshu">å­¦ä¹ æ¶é¿</div></div>
		<div class="triangle1"></div>
		<div class="triangle2"></div>
</div>
	<div class="biaoti">æå­¦è¯¾ç¨</div>
	<div class="text-center" >
	<a href="#">
	<div class="kapian">
	<div class="pic">
	<img src="../image/kecheng1.jpg"/>
	</div>
	<div class="txt">
	<h3>è¯¸å­çæºæ§</h3>
	<h4>åå¼å¤§å­¦</h4>
	<div class="jianjie">ç»è¯´åéæ³ä¸å®¶æºæ§</div>
	<div class="pingfen">è¯åï¼</div>
	<div class="score">9.5</div>
	<div class="userdata"><span class="glyphicon glyphicon-thumbs-up"></span>26258</div>
	</div>
	</div>
	</a>
		<a href="#">
	<div class="kapian">
	<div class="pic">
	<img src="../image/kecheng2.jpg"/>
	</div>
	<div class="txt">
	<h3>åè¯èºæ¯</h3>
	<h4>æ­¦æ±å¤§å­¦</h4>
	<div class="jianjie">ä¸èµ·èµ°è¿åè¯çå®¡ç¾æ¬è´¨ååäººçåä½å®æ</div>
	<div class="pingfen">è¯åï¼</div>
	<div class="score">9.2</div>
	<div class="userdata"><span class="glyphicon glyphicon-thumbs-up"></span>18902</div>
	</div>
	</div>
	</a>  
		<a href="#">	
	<div class="kapian">
	<div class="pic">
	<img src="../image/kecheng3.jpg"/>
	</div>
	<div class="txt">
	<h3>äº¤æ¿ä¼ è¯</h3>
	<h4>å¹¿ä¸å¤è¯­å¤è´¸å¤§å­¦</h4>
	<div class="jianjie">æ³æä¸ºå£è¯å¤§ç¥ï¼ä»è¿é¨è¯¾å¼å§å§</div>
	<div class="pingfen">è¯åï¼</div>
	<div class="score">8.9</div>
	<div class="userdata"><span class="glyphicon glyphicon-thumbs-up"></span>1750</div>
	</div>
	</div>
	</a>  
	<br style="clear:both;"></div>
</div>
</div>
	<div class="biaoti">è¯¾åéç¬</div>
	<div class="text-center">
	  	<div class="baikapian wenzhang"> 
	<div class="shouji"><span class="glyphicon glyphicon-book"></span>&ensp;æè®°æç« </div>
	<div class="wentopic">MyCat å¯èï¼åå¸å¼ç³»ç»çæ°æ®åºæ¶ææ¼å</div>
		<div class="hotpic">
	<img src="../image/wenzhang1.jpg"/>
	</div>
	<div class="hotcontent">åæ°æ®åºæ¶æ ä¸ä¸ªé¡¹ç®å¨åæçæ¶åï¼ä¸ºäºå°½å¯è½å¿«å°éªè¯å¸åºï¼å¶å¯¹ä¸å¡ç³»ç»çæå¤§è¦æ±æ¯å¿«éå®ç°ãå¨è¿ä¸ªé¶æ®µï¼ä»£ç å¼åäººåä¸ºäºè½å¿«éå®ç°ä¸å¡ç³»ç»ï¼ä¸è¬é½æ¯å°ææå±çº§ï¼MVCï¼çä¸å¡ä»£ç é½åå¨åä¸ä¸ªé¡¹ç®ä¸­ï¼ææçä¸å¡æ°æ®é½å­æ¾å¨åä¸ä¸ªæ°æ®åºä¸­ãæ­¤æ¶ï¼é¡¹ç®çæ´ä½æ¶æå¾å¦ä¸æç¤º...</div>
	<div class="hotcontent">æµè§</div>
	<div class="hotcontent">366</div>
	<div class="hotcontent">æ¨è</div>
	<div class="hotcontent">6</div>
	<a href="#">	<div class="tiaozhuan">
	éè¯»å¨æ<span class="glyphicon glyphicon-arrow-right"></span>
	</div></a>
  </div>
    	<div class="baikapian wenzhang"> 
	<div class="shouji"><span class="glyphicon glyphicon-book"></span>&ensp;æè®°æç« </div>
	<div class="wentopic">ãJavaæ¡æ¶åé¡¹ç®ä»å¥é¨å°è£é¼ãç¬¬åä¸è ç¨æ·æ°å¢ä¹ææ°æ®ä¼ éå°åå°</div>
		<div class="hotpic">
	<img src="../image/wenzhang2.jpg"/>
	</div>
	<div class="hotcontent">è®©æä»¬ç»§ç»­æ¥åâä¸»çº¿ä»»å¡âï¼è¿ä¸èï¼æä»¬æ¥åå·ä½çç¨æ·æ°å¢åè½ãé¦åï¼ä¸ºäºç®åèµ·è§ï¼ææä¸»é¡µé¢æ¹äºä¸äºï¼æ¹çæ¯åè¡¨é£ä¸åãå å»äºä¸äºå­æ®µï¼åæ°æ®åºè¡¨å¯¹åºä¸è´ï¼ ç°å¨ï¼æä»¬è¦å®ç°ä¸ä¸ªææï¼å°±æ¯å½æç¹å»æ°å¢ç¨æ·çæé®æ¶ï¼å°±å¼¹åºä¸ä¸ªæ¡æ¥ãå ä¸ºæä»¬ä½¿ç¨çæ¯EasyUIç»ä»¶ï¼æä»¥æä»¬å¯ä»¥ç¨dialogç»ä»¶æ¥...</div>
	<div class="hotcontent">æµè§</div>
	<div class="hotcontent">313</div>
	<div class="hotcontent">æ¨è</div>
	<div class="hotcontent">3</div>
	<a href="#">	<div class="tiaozhuan">
	éè¯»å¨æ<span class="glyphicon glyphicon-arrow-right"></span>
	</div></a>
  </div>
  </div>

  	<div class="biaoti">è¯ä¹¦</div>
  <div class="text-center" style="margin-bottom:50px;">	
  <div style="width:150px;height:230px;display:inline-block;margin:10px 20px;">	
	<div class="zhengshu">
	<img src="../image/kecheng1.jpg">
	</div>
	<div class="zstxt">è¯¸å­çæºæ§</div></div>
	  <div style="width:150px;height:230px;display:inline-block;margin:10px 20px;">
	<div class="zhengshu">
	<img src="../image/kecheng2.jpg">
	</div>
	<div class="zstxt">åè¯èºæ¯</div></div>
	  <div style="width:150px;height:230px;display:inline-block;margin:10px 20px;">
	<div class="zhengshu">
	<img src="../image/kecheng3.jpg">
	</div>
	<div class="zstxt">äº¤æ¿ä¼ è¯</div></div>
	</div>
    <iframe src="../header_and_footer/footer.html" id="iframe-footer"></iframe>
</body>
</html>
