<%@ page   pageEncoding="UTF-8"%>
<div class="center" style="background:#fff">
	<!--收货地址body部分开始-->
	<div class="border_top_cart">
		<script type="text/javascript">
            var checkoutConfig={
                addressMatch:'common',
                addressMatchVarName:'data',
                hasPresales:false,
                hasBigTv:false,
                hasAir:false,
                hasScales:false,
                hasGiftcard:false,
                totalPrice:244.00,
                postage:10,//运费
                postFree:true,//活动是否免邮了
                bcPrice:150,//计算界值
                activityDiscountMoney:0.00,//活动优惠
                showCouponBox:0,
                invoice:{
                    NA:"0",
                    personal:"1",
                    company:"2",
                    electronic:"4"
                }
            };
            var miniCartDisable=true;
		</script>
		<div class="container">
			<div class="checkout-box">
				<form  id="checkoutForm" action="#" method="post">
					<div class="checkout-box-bd">
						<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
						<input type="hidden" name="Checkout[addressState]" id="addrState"   value="0">
						<!-- 收货地址 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">收货地址</h2>
								<!---->
							</div>
							<div class="box-bd">
								<div class="clearfix xm-address-list" id="checkoutAddrList">
									<dl class="item" >
										<dt>
											<strong class="itemConsignee">${shipping.receiver_name}</strong>
											<span class="itemTag tag">家</span>
										</dt>
										<dd>
											<p class="tel itemTel">${shipping.receiver_phone}</p>
											<p class="itemRegion">${shipping.receiver_address}</p>
											<p class="itemStreet">${shipping.receiver_address}</p>
											<span class="edit-btn J_editAddr">编辑</span>
										</dd>
										<dd style="display:none">
											<input type="radio" name="Checkout[address]" class="addressId"  value="10140916720030323">
										</dd>
									</dl>
									<div class="item use-new-addr"  id="J_useNewAddr" data-state="off">
										<span class="iconfont icon-add"><img src="images/add_cart.png" /></span>
										使用新地址
									</div>
								</div>
								<input type="hidden" name="newAddress[type]" id="newType" value="common">
								<input type="hidden" name="newAddress[consignee]" id="newConsignee">
								<input type="hidden" name="newAddress[province]" id="newProvince">
								<input type="hidden" name="newAddress[city]" id="newCity">
								<input type="hidden" name="newAddress[district]" id="newCounty">
								<input type="hidden" name="newAddress[address]" id="newStreet">
								<input type="hidden" name="newAddress[zipcode]" id="newZipcode">
								<input type="hidden" name="newAddress[tel]" id="newTel">
								<input type="hidden" name="newAddress[tag_name]" id="newTag">
								<!--点击弹出新增/收货地址界面start-->
								<div class="xm-edit-addr-box" id="J_editAddrBox">
									<div class="bd">
										<div class="item">
											<label>收货人姓名<span>*</span></label>
											<input type="text" name="userAddress[consignee]" id="Consignee" class="input" placeholder="收货人姓名" maxlength="15" autocomplete='off'>
											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>联系电话<span>*</span></label>
											<input type="text" name="userAddress[tel]" class="input" id="Telephone" placeholder="11位手机号" autocomplete='off'>
											<p class="tel-modify-tip" id="telModifyTip"></p>
											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>地址<span>*</span></label>
											<select name="userAddress[province]" id="Provinces" class="select-1">
												<option>省份/自治区</option>
											</select>
											<select name="userAddress[city]"  id="Citys" class="select-2" disabled>
												<option>城市/地区/自治州</option>
											</select>
											<select name="userAddress[county]"  id="Countys" class="select-3" disabled>
												<option>区/县</option>
											</select>
											<textarea   name="userAddress[street]" class="input-area" id="Street" placeholder="路名或街道地址，门牌号"></textarea>
											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>邮政编码<span>*</span></label>
											<input type="text" name="userAddress[zipcode]" id="Zipcode" class="input" placeholder="邮政编码"  autocomplete='off'>
											<p class="zipcode-tip" id="zipcodeTip"></p>
											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>地址标签<span>*</span></label>
											<input type="text" name="userAddress[tag]" id="Tag" class="input" placeholder='地址标签：如"家"、"公司"。限5个字内'  >
											<p class="tip-msg tipMsg"></p>
										</div>
									</div>
									<div class="ft clearfix">
										<button  type="button"  class="btn btn-lineDake btn-small " id="J_editAddrCancel">取消</button>
										<button type="button" class="btn btn-primary  btn-small " id="J_editAddrOk">保存</button>
									</div>
								</div>
								<!--点击弹出新增/收货地址界面end-->
								<div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>
							</div>                </div>
						<!-- 收货地址 END-->
						</div>
						</form>
						</div>