$(function() {
	layer.ready(function() {

	});
});

function showMsg(txt) {
	layer.alert(txt);
}
function showConfirm(txt, fun1, fun2, button1, button2) {
	var bt1 = "确定";
	var bt2 = "取消";
	if (button1)
		bt1 = button1;
	if (button2)
		bt2 = button2;
	layer.confirm(txt, {
		btn : [ bt1, bt2 ]
	}, function() {
		fun1();
	}, function() {
		if (fun2)
			fun2();

	});

}

function showPage(title, url, width, height, closeCallBack, maxmin) {
	if (maxmin)
		maxmin = true;
	else
		maxmin = false;
	layer.open({
		type : 2,
		title : title,
		maxmin : maxmin,
		area : [ width + 'px', height + 'px' ],
		content : url,
		end : function() {
			if (closeCallBack)
				closeCallBack();
		}

	});
}

$('#youModel').on(
		'shown.bs.modal',
		function(e) {
			// 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
			$(this).css('display', 'block');
			var modalHeight = $(window).height() / 2
					- $('#youModel .modal-dialog').height() / 2;
			$(this).find('.modal-dialog').css({
				'margin-top' : modalHeight
			});
		});

function closePage() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

function sendForm(form) {
	var m = form.find(".must");
	for ( var i = 0; i < m.length; i++) {
		if (m.get(i).value.length == 0) {
			showMsg("不能为空");
			return;
		}
	}
	var data = form.serializeArray();
	var action = form.attr("action");
	sendData(action, data);
}
function sendData(action, data) {
	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		data : data,
		success : function(json) {
			if (json.status > 0) {
				closePage();
			}
		}
	});
}

function showTip(selector, txt) {
	layer.tips(txt, selector, {
		tips : 1
	});
}