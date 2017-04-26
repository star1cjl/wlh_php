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
<title>会员中心</title>

<link rel="stylesheet" type="text/css" href="/kit/weui/css/base.css" />
<link rel="stylesheet" type="text/css" href="/kit/weui/css/weui.min.css" />
<link rel="stylesheet" type="text/css" href="/kit/weui/css/jquery-weui.min.css" />

<script type="text/javascript" src="/kit/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/kit/weui/js/jquery-weui.min.js"></script>

<style type="text/less">

</style>

<script type="text/javascript">
    $(function(){
        $('.logout').on('click', function() {
            $.confirm("您确定要退出登录吗?", "提示", function() {
                location.href = '/home/logout';
            }, function() {
                //取消操作
            });
        });
    });
</script>

</head>

<body ontouchstart>

<div class="weui_tab">
    <div style="background-color: #4c4c4c;text-align: center;color: #fff;display: block;position: relative;font-size: 16px;line-height: 48px;">
        <a href="javascript:history.go(-1);" style="position: absolute;left: 15px;"><img src="/images/wechat/back.png" style="width: 24px;height: 24px;margin-top: 12px;"></a>会员中心
    </div>

    <div class="weui_tab_bd" style="padding-bottom: 100px;padding-top: 0;">
        <div class="weui_panel weui_panel_access">
            <div class="weui_panel_bd" style="background-color: #e70012;padding: 10px 0;">
                <div class="weui_media_box weui_media_appmsg">
                    <div class="weui_media_hd">
                        <img class="weui_media_appmsg_thumb" src="{$user->avatar}" alt="" style="border-radius: 50%;">
                    </div>
                    <div class="weui_media_bd" style="margin-left: 5px;color: #fff;">
                        <div style="font-size: 18px;padding-bottom:5px;border-bottom: #f16671 solid 1px;">
                            <img src="/images/wechat/user_name.png" style="width: 13px;vertical-align: middle;margin-right: 5px;">
                            <span style="vertical-align: middle;">{$user->name}</span>
                        </div>
                        <div style="margin-top: 5px;font-size: 14px;">
                            <img src="/images/wechat/user_level.png" style="width: 13px;vertical-align: middle;margin-right: 5px;">
                            <span style="vertical-align: middle;">会员:{$curruser->levelname}</span>

                            <img src="/images/wechat/user_jifen.png" style="width: 13px;vertical-align: middle;margin-left:5px;margin-right: 5px;">
                            <span style="vertical-align: middle;">积分:{$user->points}积分</span>

                        </div>
                    </div>
                </a>
                </div>
            </div>

            {if $user->isdistribution eq '1'}
                <a class="weui_panel_ft" href="/profile/profit">
                    <span style="color: #e70012;font-size: 24px;">{$totalcommission}</span><br>
                    <span style="color: #999;">我的总收益</span>
                </a>
            {/if}

            {*<div class="weui-row weui-no-gutter" style="border-top: #e5e6e5 solid 1px;border-bottom: #e5e6e5 solid 1px;text-align: center;">*}
                {*<div class="weui-col-33" style="border-right: #e5e6e5 solid 1px;padding: 10px 0;">*}
                    {*<span style="font-size: 20px;">142.32</span><br>*}
                    {*<span style="color: #999;font-size: 14px;">本月收益</span>*}
                {*</div>*}
                {*<div class="weui-col-33" style="border-right: #e5e6e5 solid 1px;padding: 10px 0;">*}
                    {*<span style="font-size: 20px;">342.32</span><br>*}
                    {*<span style="color: #999;font-size: 14px;">本月销量</span>*}
                {*</div>*}
                {*<div class="weui-col-33" style="padding: 10px 0;">*}
                    {*<span style="font-size: 20px;">7</span><br>*}
                    {*<span style="color: #999;font-size: 14px;">本月订单</span>*}
                {*</div>*}
            {*</div>*}
        </div>

        <div class="weui_panel">
            <div class="weui_panel_bd">
                <div class="weui_media_box weui_media_small_appmsg">
                    <div class="weui_cells weui_cells_access">
                        {if $user->isdistribution eq '1'}
                        <a class="weui_cell" href="/profile/partner">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_daiyan.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>我的代言小伙伴</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        {/if}
                        <a class="weui_cell" href="/profile/order">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_order.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>我的订单</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        <a class="weui_cell" href="/profile/address">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_address.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>地址管理</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        <a class="weui_cell" href="/profile/coupon">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_coupon1.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>我的优惠券</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        <a class="weui_cell" href="/profile/coupon_exchange">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_zhuanqian.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>优惠券兑换</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        <a class="weui_cell" href="/profile/myqrcode">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_qrcode.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>我的专属二维码</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                        <a class="weui_cell" href="/profile/password">
                            <div class="weui_cell_hd"><img src="/images/wechat/profile_pwd.png" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary" style="font-size: 16px;padding-left: 6px;">
                                <p>修改密码</p>
                            </div>
                            <span class="weui_cell_ft"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <a href="javascript:;" class="weui_btn weui_btn_plain_primary logout" style="font-size:16px;width: 90%; margin-top: 20px;margin-bottom: 50px;border:#eee solid 1px;color: #999;">退出登录</a>
    </div>

    {$page = 'profile'}
    {include file="footer.tpl"}
</div>


</body>
</html>