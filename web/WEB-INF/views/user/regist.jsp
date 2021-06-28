<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>后台登录</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css"/>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>书图后台注册系统</h3>
        <div class="m-login-warp">
            <form class="layui-form">
                <div class="layui-form-item">
                    <input id="username" type="text" name="username" required lay-reqText="用户名不能为空"
                           lay-verify="required|username"
                           placeholder="用户名:2-10位中英文均可" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input id="email" type="email" name="email" required lay-reqText="邮箱不能为空"
                           lay-verify="required|email" placeholder="邮箱" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input id="password" type="password" name="password" required lay-reqText="密码不能为空"
                           lay-verify="required|password" placeholder="密码：5-12位字符" autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input id="password_ensure" type="password" name="password_ensure" required lay-reqText="确认密码不能为空"
                           lay-verify="required|password_ensure" placeholder="确认密码" autocomplete="off"
                           class="layui-input">
                </div>

                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">注册</button>
                    </div>
                    <div class="layui-inline">
                        <a href="${APP_PATH}" type="reset" class="layui-btn layui-btn-primary"
                           style="width: 166px">返回</a>
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

        function errorMsg() {
            layer.open({
                title: "错误消息",
                content: "当前网络错误，请稍后再试"
            })
        }

        //用户名判断是否存在
        $("#username").change(function () {
            var re = /^[\u4E00-\u9FA5a-zA-Z_0-9]{2,10}$/;
            if (!re.test($("#username").val())) {
                layer.msg("用户名不合法！", {
                    time: 2000
                });
                return;
            }

            $.ajax({
                url: "${APP_PATH}/isExist",
                type: "GET",
                data: {"username": $("#username").val()},
                success: function (result) {
                    if (result.code == 100) {
                        layer.msg("用户名可用！", {
                            time: 2000
                        });
                    }
                    if (result.code == 200) {
                        layer.msg("用户名已存在！", {
                            time: 2000
                        });
                    }
                }
            })
        })

        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form,
                layer = layui.layer;


            //自定义验证规则
            form.verify({
                username: [/^[\u4E00-\u9FA5a-zA-z0-9]{2,10}$/, "用户名为2-10位中英文"],
                password: [/(.+){5,12}$/, '密码为5-12位字符'],
                password_ensure: [/(.+){5,12}$/, '两次密码不一致'],
            });


            //监听提交
            form.on('submit(login)', function (data) {

                if($("#password").val() != $("#password_ensure").val()){
                    layer.msg("两次密码不一致",{
                        time: 3000
                    });
                    return false;
                }

                $.ajax({
                    url: "${APP_PATH}/regist",
                    type: "POST",
                    data: data.field,
                    success: function (result) {
                        if (result.code == 200) {
                            layer.open({
                                title: "注册消息",
                                content: "注册成功",
                                yes: function () {
                                    location = "${APP_PATH}";
                                }
                            });

                        }
                    },
                    error: function (result) {
                        errorMsg();
                    }

                })

                return false;
            });

        });

    })
</script>
</body>

</html>