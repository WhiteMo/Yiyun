
<%
	pageContext.setAttribute("basePath",request.getContextPath());
%>
<div id="footer-body">
	<div class="container">
		<div class="footer-brand text-center">
			<img src="${basePath}/client/image/header_brand_image.png" />
			<h2 class="">亦云课堂</h2>
		</div>
		<hr style="color: #fff; margin: -10px 0 10px 0;" />
		<div class="row footer-text">
			<div class="col-sm-4 col-xs-12">
				<h4 style="color: #fff; padding-top: 0; padding-left: 10px">
					</h4>
				<div class="footer-sort">
					<a></a>
					<a></a> 
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
			    <a href="${basePath}/client/introduction/introduction.jsp">
				<h4 style="color: #fff; padding-top: 0; padding-left: 10px">
					联系我们
				</h4>
				</a>
				<div style="width:20px">
				</div>
				<div class="footer-icon">
					<img src="${basePath}/client/image/wechat_1.png" onmouseover="footer_change_img()"
						id="footer-wechat" onmouseout="footer_change_back_img()" />
				</div>
			</div>
		</div>

		<div style="color: #555; margin-top: 20px" class="text-center">Copyright
			© 2018 School of Information, Renmin University of China. All rights
			reserved.</div>

	</div>
</div>

