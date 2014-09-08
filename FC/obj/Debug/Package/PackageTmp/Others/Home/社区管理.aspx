<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
    <link type="text/css" href="../../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

    <link href="../../JqueryUi/assets/css/docs.css" rel="stylesheet">
    <link href="../../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SFkvTUOgS05vQGeoDksvrDFb"></script>
    <title>社区活动</title>
    <style type="text/css">
    body, html 
    {
        width: 970px;
        height: 600px;
        overflow: hidden;
        margin-top:10px;
    } 
    #allmap
    {
        height: 690px;
        overflow: hidden;
        margin:0px;
    } 
    #textlist
    {
        margin-top: 10px;
        text-align: center;        
    }
    #textlistIn
    {
        padding: 0px;
    }
    @media (max-device-width: 750px){#golist{display: block!important;}}#golist {display: none;}
    </style>
</head>
<body>
    <div class="span12" style="margin:0px;width:950px;">
        <div class="row-fluid">
            <div class="span3" id="textlist">
                <div class="hero-unit" id="textlistIn">
                <h3><sub>Hello, world!</sub></h3>

                <h4>这是一个可视化布局模板, 你可以点击模板里的文字进行修改, 也可以通过点击弹出的编辑框进行富文本修改. 拖动区块能实现排序.</h4>

                <p><a class="btn btn-primary" href="#">参看更多 &raquo;</a></p>
                </div>
            </div>
            <div class="span9" id="allmap">
            </div>
            <p> 0</p>
        </div>
    </div>
</html>
<script type="text/javascript">

    // 百度地图API功能
    var map = new BMap.Map("allmap", { mapType: BMAP_HYBRID_MAP });      //设置卫星图为底图
    map.centerAndZoom('武汉', 11);     // 初始化地图,设置中心点坐标和地图级别     

    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
    map.addControl(new BMap.NavigationControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN }));  //左下角，仅包含平移按钮

    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用



    var json_data = [[114.384, 30.405]];
    var pointArray = new Array();
    for (var i = 0; i < json_data.length; i++) {
        var marker = new BMap.Marker(new BMap.Point(json_data[i][0], json_data[i][1])); // 创建点
        map.addOverlay(marker);    //增加点
        pointArray[i] = new BMap.Point(json_data[i][0], json_data[i][1]);
        marker.addEventListener("click", attribute);
    }
    //让所有点在视野范围内
    map.setViewport(pointArray);
    //获取覆盖物位置
    function attribute(e) {
        var p = e.target;
        alert("marker的位置是" + p.getPosition().lng + "," + p.getPosition().lat);
    }   
  </script>

