<%--防止中文乱码--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>layout 管理系统大布局 - Layui</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css">
</head>
<body>

<%--添加的form表单--%>
<div style="display: none" id="addForm" class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" id="add_bookName" name="bookName" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <input type="text" id="add_author" name="author" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="text" id="add_price" name="price" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">销量</label>
        <div class="layui-input-block">
            <input type="text" id="add_sales" name="sales" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text" id="add_stock" name="stock" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">封面路径</label>
        <div class="layui-input-block">
            <input type="text" id="add_img" name="img" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
</div>
<%--编辑的form表单--%>
<div style="display: none" id="EditForm" class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" id="edt_bookName" name="bookName" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <input type="text" id="edt_author" name="author" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="text" id="edt_price" name="price" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">销量</label>
        <div class="layui-input-block">
            <input type="text" id="edt_sales" name="sales" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text" id="edt_stock" name="stock" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">封面路径</label>
        <div class="layui-input-block">
            <input type="text" id="edt_img" name="img" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="edt_btn" class="layui-btn" lay-submit lay-filter="*">提交</button>
            <button id="edt_cancel_btn" class="layui-btn layui-btn-primary closeBtn">取消</button>
        </div>
    </div>
</div>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">书图管理系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="">书图信息</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    账户信息
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">登陆</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">书图管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">书图信息</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <table id="demo" lay-filter="test"></table>
        <div id="pageInfo" class="layui-col-md8 layui-col-md-offset2"></div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
</body>
<script src="${APP_PATH}/static/layui/layui.js"></script>
<script src="${APP_PATH}/static/js/jquery-1.12.4.js"></script>
<script type="text/javascript">

    var size = 0;

    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });


    function toPage(pn) {
        layui.use('table', function () {
            var table = layui.table;

            table.render({
                elem: '#demo'                       //id选择数据表格
                , url: '${APP_PATH}/books?pn=' + pn //数据接口
                , response: {                       //配置返回的信息
                    statusCode: 200                 //成功的状态安
                }
                , toolbar: '#toolbarDemo'           //id选择自定义头部工具栏
                , cols: [[                          //表头
                    {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'}
                    , {field: 'name', title: '书名'}
                    , {field: 'author', title: '作者', width: 80}
                    , {field: 'price', title: '价格', width: 80}
                    , {field: 'stock', title: '库存', width: 177}
                    , {field: 'imgPath', title: '封面图路径'}
                    , {field: 'operate', title: '操作', fixed: 'right', align: 'center', toolbar: '#barDemo'}]]
                , parseData: function (res) {           //处理数据的函数调用
                    if(size == 0){                      //判断size大小是否为初值
                        size = res.extend.Books.size;   //从服务器的信息中获取分页条数给size赋值
                    }

                    return {                            //返回处理后的数据
                        "code": res.code,
                        "msg": res.msg,
                        "data": res.extend.Books.list,
                        "count": res.extend.Books.total,
                        "info": res.extend.Books
                    };
                }
                , done: function (res, curr, count) {       //渲染后的回调函数
                    page(pn, count);                        //分页条的渲染
                }
            })


            //表格头工具栏触发事件，(id选择，省略#)
            table.on('toolbar(test)', function (obj) {
                switch (obj.event) {
                    case 'add':                     //匹配layevent中的参数
                        layer.open({
                            type: 1,                //类型，1为页面层
                            btn: ['添加','取消'],
                            title: "添加书图",       //弹出层标题
                            content: $("#addForm")  //弹出层内容，传入一个DOM元素
                            ,yes:function (index, layero) {
                                console.log(index,layero);
                            }

                        });
                        break;
                }
            });

            //表格列工具栏触发事件
            table.on("tool(test)", function (obj) {
                switch (obj.event) {
                    case 'edit':                        //编辑按钮事件
                        $.ajax({
                            url: "${APP_PATH}/book",
                            type: "GET",
                            data: {"id": obj.data.id},  //obj.data.id获取该行的id属性
                            success: function (result) {
                                var info = result.extend.book;
                                layer.open({
                                    type:1,
                                    title:"修改书图信息",
                                    content:$("#EditForm"),
                                    success:function (layero, index) {
                                        $("#edt_bookName").val(info.name);
                                        $("#edt_author").val(info.author);
                                        $("#edt_price").val(info.price);
                                        $("#edt_sales").val(info.sales);
                                        $("#edt_stock").val(info.stock);
                                        $("#edt_img").val(info.imgPath);
                                    }
                                })
                            }
                        })
                        break;
                    //删除按钮事件
                    case 'delete':
                        break;
                }
            })
        })
    }

    toPage(1);      //初始化表格

    //分页条生成函数
    function page(pn, count) {

        layui.use('laypage', function () {

            var laypage = layui.laypage;

            laypage.render({                                      //渲染页脚
                elem: 'pageInfo',                                 //指定html中id为pageInfo的标签进行渲染
                curr: pn,                                         //当前页码
                groups: 5,                                        //连续显示页码个数
                count: count,                                     //总页码数
                limit: size,                                      //每页数据个数
                layout: ['prev', 'page', 'next', 'skip', 'count'],//自定义分页样式，prev:上一页，page：连续页码，next：下一页，skip：输入页码跳转，count：显示总页码数
                jump: function (obj, first) {                     //页码点击事件
                    if(!first){                                   //判断是否是第一次调用，防止重复调用。
                        toPage(obj.curr);                         //跳转到点击页面
                    }
                }
            })
        })
    }

    //添加按钮点击事件
    $("#addbtn").click(function () {

        //表单验证

        //异步请求添加书图
        $.ajax({
            url: '${APP_PATH}/book',
            type: "POST",
            data: {
                "name": $("#add_bookName").val(),
                "author": $("#add_author").val(),
                "price": $("#add_price").val(),
                "sales": $("#add_sales").val(),
                "stock": $("#add_stock").val(),
                "imgPath": $("#add_img").val()
            },
            success: function (result) {
                layer.closeAll();//成功关闭弹出框
                toPage(2147483);//跳转到最后一页,2147483是2的32次方减1，为Java中整形的最大值
            },
            error: function () {
                layer.msg("添加失败");
            }
        })
    })

    //关闭按钮点击事件
    $("#add_cancel_btn,#edt_cancel_btn").click(function () {
        layer.closeAll();
    })


</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container layui-col-md2 layui-col-md-offset11">
        <button class="layui-btn layui-btn-sm " lay-event="add">添加</button>
    </div>
</script>
</html>