layui.config({
	base : "/Cart/back/resources/thirdlib/web/js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage.render,
		$ = layui.jquery;
	
	
	//加载页面数据
	var newsData = '';
	
	$.get("/Cart/ProductType/index.action", function(data){
		var newArray = [];
		//单击首页“待审核文章”加载的信息
		if($(".top_tab li.layui-this cite",parent.document).text() == "待审核文章"){
			if(window.sessionStorage.getItem("addNews")){
				var addNews = window.sessionStorage.getItem("addNews");
				newsData = JSON.parse(addNews).concat(data);
			}else{
				newsData = data;
			}
			for(var i=0;i<newsData.length;i++){
        		if(newsData[i].newsStatus == "待审核"){
					newArray.push(newsData[i]);
        		}
        	}
        	newsData = newArray;
   
		}else{    //正常加载信息
			newsData = data;
			
			if(window.sessionStorage.getItem("addNews")){
				var addNews = window.sessionStorage.getItem("addNews");
				newsData = JSON.parse(addNews).concat(newsData);
		}
			//执行加载数据的方法
			newsList();
		}
	})

	
	//添加商品类别
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "商品类别添加",
				type : 2,
				content : "/Cart/ProductType/add.action",
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回商品类别列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},500)
				}
			})			
			layui.layer.full(index);
		})
	}).resize();



	//通过判断文章是否全部选中来确定全选按钮是否选中
	form.on("checkbox(choose)",function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
		if(childChecked.length == child.length){
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
		}else{
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
		}
		form.render('checkbox');
	})

	//是否展示
	form.on('switch(isShow)', function(data){
		var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            layer.close(index);
			layer.msg("状态修改成功！");
        },2000);
	})
 
	//新增操作
	$("body").on("click",".news_edit",function(){
		   layer.open({
		        type: 2
		        ,title: '商品类别新增' //不显示标题栏
		        ,closeBtn: true
		        ,area: ['390px', '260px']
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
/*		        ,btn: ['火速围观', '残忍拒绝']
*/		        ,moveType: 1 //拖拽模式，0或者1
		        ,content:'/Cart/ProductType/add.action'
		        ,maxmin: true
		        ,success: function(layero){
		          var btn = layero.find('.layui-layer-btn');
		          btn.css('text-align', 'center');
		          btn.find('.layui-layer-btn0').attr({
		            href: 'Cart/ProductType/update.action'
		            ,type: 'resert'
		          });
		        }
		      });		
		})
		 
	  
		$("body").on("click",".new_edit",function(){
			layer.open({
				
				type: 2
				,title: '商品类别修改' //不显示标题栏
				,closeBtn: true
				,area: ['390px', '260px']
			    ,shade: 0.8
			    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			    ,btn: ['火速围观', '残忍拒绝']
				,moveType: 1 //拖拽模式，0或者1
				,content:'/Cart/ProductType/edit.action&id='
				,maxmin: true
				,success: function(layero){
				 var btn = layero.find('.layui-layer-btn');
			     btn.css('text-align', 'center');
				 btn.find('.layui-layer-btn0').attr({
							 href: 'Cart/ProductType/update.action'
								 ,type: 'resert'
						 });
					 }
			});		
		})


	$("body").on("click",".news_del",function(){  //删除
		var _this = $(this);
		layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
			//_this.parents("tr").remove();
			for(var i=0;i<newsData.length;i++){
				if(newsData[i].newsId == _this.attr("data-id")){
					newsData.splice(i,1);
					newsList(newsData);
				}
			}
			layer.close(index);
		});
	})
   
	
	

	
	
})
