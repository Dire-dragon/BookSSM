<%@ page import="com.google.code.kaptcha.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>后台登录</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css" />
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>书图后台登录系统</h3>
        <div class="m-login-warp">
            <form class="layui-form">
                <div class="layui-form-item">
                    <input id="username" type="text" name="username" required lay-reqText="用户名不能为空" lay-verify="required|username" placeholder="用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" required lay-reqText="密码不能为空" lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <input type="text" name="verity" required lay-reqText="验证码不能为空" lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <img src="${APP_PATH}/captcha" id="img-captcha">
                    </div>
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button id="login_btn" class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <a href="${APP_PATH}/regist" class="layui-btn layui-btn-normal" style="width: 166px">注册</a>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2015-2016 by XIAODU</p>
    </div>
</div>
<script src="${APP_PATH}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/js/jquery-1.12.4.js"></script>
<script>
    $(function () {

        //验证码点击刷新
        $("#img-captcha").click(function () {
            $(this).attr("src","${APP_PATH}/captcha?" + Math.random());
        })

        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form,
                layer = layui.layer;


            //自定义验证规则
            form.verify({
                username: [/^[\u4E00-\u9FA5a-zA-Z_0-9]{2,10}$/, "请输入正确的用户名"],
                password: [/(.+){5,12}$/, '密码错误'],
                verity: [/^[a-zA-Z0-9]{4}$/, '验证码错误'],
            });


            //监听提交
            form.on('submit(login)', function(data) {
                $.ajax({
                    url: "${APP_PATH}/login",
                    type: "GET",
                    data: data.field,
                    success: function (result) {
                        if(result.code == 100){
                            layer.msg("用户名或密码错误",{
                                time:2000
                            });
                        }else if(result.code == 101){
                            layer.msg("验证码错误",{
                                time:2000
                            })
                            //刷新验证码
                            $("#img-captcha").attr("src","${APP_PATH}/captcha?" + Math.random());
                        }else if(result.code == 200){
                            location="${APP_PATH}/main?username=" + data.field.username;
                        }
                    },
                    error: function (result) {
                    }
                })
                return false;
            });

        });

    })


</script>
</body>

</html>