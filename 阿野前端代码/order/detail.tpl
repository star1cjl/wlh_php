<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<link rel="shortcut icon" href="/images/favicon.ico"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>订单详情</title>

<link rel="stylesheet" type="text/css" href="/kit/weui/css/base.css" />
<link rel="stylesheet" type="text/css" href="/kit/weui/css/weui.min.css" />
<link rel="stylesheet" type="text/css" href="/kit/weui/css/jquery-weui.min.css" />

<script type="text/javascript" src="/kit/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/kit/weui/js/jquery-weui.min.js"></script>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<style type="text/less">
    .orderinfo{
        font-size: 14px;
        line-height: 20px;
        color: #333;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }
</style>

<script type="text/javascript">

    wx.config({
        debug: false,
        appId: '{$appId}',
        timestamp: '{$timestamp}',
        nonceStr: '{$nonceStr}',
        signature: '{$signature}',
        jsApiList: [
            'hideOptionMenu','chooseWXPay'
        ]
    });

    $(function(){

        wx.ready(function(){
            wx.hideOptionMenu();
        });

    });
</script>

</head>

<body ontouchstart>

<div class="weui_tab">
    <div style="background-color: #4c4c4c;text-align: center;color: #fff;display: block;position: relative;font-size: 16px;line-height: 48px;">
        <a href="javascript:history.go(-1);" style="position: absolute;left: 15px;"><img src="/images/wechat/back.png" style="width: 24px;height: 24px;margin-top: 12px;"></a>订单详情
    </div>

    <div class="weui_tab_bd" style="padding-bottom: 100px;padding-top: 0;">
    <div class="weui_panel weui_panel_access" style="margin-top: 1.17em;">
        <div class="weui_cells" style="margin-top: 0;">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>订单编号：{$order->orderno}</p>
                </div>
                {if $order->status eq '008001'}
                    <div class="weui_cell_ft"><a href="/order/online_charge/{$order->id}" class="weui_btn weui_btn_mini weui_btn_primary" style="line-height: 2.6;background-color:#e60012;">去付款</a></div>
                {else}
                    <div class="weui_cell_ft" style="color: #e91021;">{$order->statusname}</div>
                {/if}

            </div>
        </div>

        {if !empty($order->expressno)}
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_small_appmsg">
                <div class="weui_cells weui_cells_access">
                    <a class="weui_cell" href="/order/express_info?orderid={$order->id}&expressno={$order->expressno}">
                        <div class="weui_cell_hd"><img src="/images/wechat/order_process.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                        <div class="weui_cell_bd weui_cell_primary" style="margin-left: 10px;padding: 10px 0;">
                            {if $order->status eq '008005' || $order->status eq '008006' || $order->status eq '008007'}
                                <p style="color: #44b549;font-size: 16px;">您的快递已签收，期待下次继续为您服务</p>
                            {elseif $order->status eq '008004'}
                                <p style="color: #e60012;font-size: 16px;">您的快递正在配送中…… [物流跟踪]</p>
                            {/if}

                            {*<p style="font-size: 14px;">2016-06-08 12:20:56</p>*}
                        </div>
                        <span class="weui_cell_ft"></span>
                    </a>
                </div>
            </div>
        </div>
        {/if}

        <div class="weui_panel_bd">
            <a href="javascript:;" class="weui_media_box weui_media_appmsg weui_cell">
                <div class="weui_media_hd" style="width: 20px;">
                    <img class="weui_media_appmsg_thumb" src="/images/wechat/location.png" alt="">
                </div>
                <div class="weui_media_bd" style="margin-left: 15px;">
                    <h4 class="weui_media_title">收货人：{$order->acceptname}</h4>
                    <p class="orderinfo">联系电话：{$order->mobile}</p>
                    <p class="orderinfo">收货地址：{$order->address}</p>
                </div>
            </a>
        </div>
    </div>

    <div class="weui_panel weui_panel_access" style="margin-top: 1.17em;">
        <div class="weui_panel_bd">
            {foreach from=$order->goods item="goods"}
                <a href="/goods/{$goods->goodsid}" class="weui_media_box weui_media_appmsg" style="cursor: default;">
                    <div class="weui_media_hd">
                        <img class="weui_media_appmsg_thumb" src="{imageurl pic = $goods->imgurl size = '78x78'}" alt="" style="border: #eee solid 1px;border-radius: 3px;">
                    </div>
                    <div class="weui_media_bd" style="flex: 2;">
                        <p class="weui_media_desc" style="color: #333;line-height: 20px;">{$goods->goodsname}</p>
                    </div>
                    <div class="weui_media_bd">
                        <div class="fs20 fr">￥{$goods->realprice}</div><br>
                        <div class="fs20 fr" style="text-decoration: line-through;color: #999;">￥{$goods->marketprice}</div><br>
                        <div class="fs20 fr" style="color: #999;">X {$goods->goodsnums}</div>
                    </div>
                </a>
            {/foreach}


        </div>


        <div class="weui_cells" style="margin-top: 0;">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">

                </div>
                <div class="weui_cell_ft">
                    <div style="color: #666;">共{count($order->goods)}件商品 合计：<span style="display:inline-block;width: 77px;color:#f28f00; ">￥{$order->payableamount}</span></div>
                    {if $order->couponamount gt 0}
                        <div style="color: #999;">优惠券抵扣：<span style="display:inline-block;width: 77px;">￥{$order->couponamount}</span></div>
                    {/if}
                    {if $order->payableamount-$order->couponamount neq $order->discountamount}
                        <div style="color: #999;">折扣金额：<span style="display:inline-block;width: 77px;">￥{$order->discountamount}</span></div>
                    {/if}
                    <div style="color: #999;">实付运费：<span style="display:inline-block;width: 77px;">￥{$order->realfreight}</span></div>
                    {if $order->payableamount neq $order->totalamount}
                        <div style="color: #999;">应付总额：<span style="display:inline-block;width: 77px;">￥{$order->totalamount}</span></div>
                    {/if}
                    {if $order->pointsamount gt 0}
                        <div style="color: #999;">积分抵扣：<span style="display:inline-block;width: 77px;">￥{$order->pointsamount}</span></div>
                    {/if}
                    {if $order->commissionamount gt 0}
                        <div style="color: #999;">佣金抵扣：<span style="display:inline-block;width: 77px;">￥{$order->commissionamount}</span></div>
                    {/if}
                    <div style="color: #999;">实付金额：<span style="display:inline-block;width: 77px;color: #e60012;">￥{$order->realamount}</span></div>
                </div>
            </div>
            {if $order->status eq '008005'}
            <div class="weui_cell">
                <a href="/order/after_sales_list/{$order->id}" class="apply_after_sales weui_btn weui_btn_primary" style="width: 100%;background:url(/images/wechat/shouhou.png) no-repeat 32% #fff;color: #e60012;font-size: 14px;">退换货申请</a>
            </div>
            {/if}
        </div>
    </div>

    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <h4 class="weui_media_title">配送信息</h4>
                <p class="orderinfo">配送方式：普通快递</p>
                <p class="orderinfo">配送时间：{$order->deliverytime}</p>
            </div>
        </div>
    </div>

    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <h4 class="weui_media_title">发票信息</h4>
                {if $order->isinvoice eq '0'}
                    <p class="orderinfo">发票内容：不开发票</p>
                {else}
                    <p class="orderinfo">发票内容：明细</p>
                    <p class="orderinfo">发票抬头：{$order->invoicetitle}</p>
                {/if}
            </div>
        </div>
    </div>

    <div class="weui_panel weui_panel_access">
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <h4 class="weui_media_title">订单信息</h4>
                <p class="orderinfo">订单编号：{$order->orderno}</p>
                {if $order->expressno neq ''}
                <p class="orderinfo">配送单号：{$order->expressno}</p>
                {/if}
                <p class="orderinfo">下单时间：{$order->cts}</p>
            </div>
        </div>
    </div>
    </div>
    {$page = 'order'}
    {include file="footer.tpl"}
</div>
</body>
</html>