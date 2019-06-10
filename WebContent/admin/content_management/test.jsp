<html>
    <head>
        <script type="text/javascript">
        function demo(){
            $("body").css({
                "margin":"0px"
            });
            $("#loading").css({
                "position":"absolute",
                "display":"block",
                "background-color":"gray",
                "z-index":"1000",
                "opacity":"0.5"
                });
            $("#txt").css({
                "position":"absolute",
                "display":"block",
                "left":"50%",
                "top":"50%",
                "z-index":"10000"
            });
        }
    </script>
    </head>
    <body>
         <div id="loading" style="width:100%;height:100%;display:none"></div>
         <div id="txt" style="display:none">
          	   请稍等 <img alt="" src="img/loading.gif" style="height:16px">
         </div>
    </body>
</html>