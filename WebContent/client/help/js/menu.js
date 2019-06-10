/* 菜单栏效果 */
function mouseOver(i) {
	hideCurrent();
	document.getElementById("menu_text"+i).style.color="#ffffff";
	var x = (i-1)*125-1;
	var obj = document.getElementById("menu_red_bg");
	obj.style.left=x+"px";
	obj.style.display = "inline";

	if (i != 1) {
		document.getElementById("banner_shadow").style.display="inline";
		document.getElementById("child_menu"+i).style.display="inline";
	}
}

function mouseOut(i) {
	document.getElementById("menu_text"+i).style.color="#000000";
	document.getElementById("menu_red_bg").style.display="none";
	if (i != 1) {
		document.getElementById('banner_shadow').style.display="none";
		document.getElementById("child_menu"+i).style.display="none";
	}
	displayCurrent();
}

function menuMouseOver(i) {
	hideCurrent();
	var x = (i-1)*125-1;
	document.getElementById("menu_red_bg").style.left=x+"px";
	document.getElementById("menu_text"+i).style.color="#ffffff";
	document.getElementById("banner_shadow").style.display="inline";
	document.getElementById("child_menu"+i).style.display="inline";
	document.getElementById("menu_red_bg").style.display="inline";
}

function menuMouseOut(i) {
	document.getElementById("menu_text"+i).style.color="#000000";
	document.getElementById('banner_shadow').style.display="none";
	document.getElementById("child_menu"+i).style.display="none";
	document.getElementById("menu_red_bg").style.display="none";
	displayCurrent();
}

function displayCurrent() {
	document.getElementById("menu_text"+curMenu).style.color="#ffffff";
	var x = (curMenu-1)*125-1;
	var obj = document.getElementById("menu_red_bg");
	obj.style.left=x+"px";
	obj.style.display = "inline";
}

function hideCurrent() {
	document.getElementById("menu_text"+curMenu).style.color="#000000";
	document.getElementById("menu_red_bg").style.display="none";
}