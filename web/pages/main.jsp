<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页面</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%--  自己的css样式  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/s.css">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="pages/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="pages/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="pages/bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="pages/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="pages/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <%--<style type="text/css">
        @import url("${pageContext.request.contextPath}/s.css");
    </style>--%>
</head>
<%--<jsp:include page="function.jsp"/>--%>

<body>

<div class="heading">
    雇员信息管理系统
</div>

<div class="guide">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/employees" style="text-decoration: none;color: cornflowerblue">雇员管理</a>
        </li>
    </ul>
</div>

<div class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><button type="button" onclick="add()" class="btn btn-block btn-primary">新增学生</button></h3>
                </div>
                <!-- /.box-header -->
                <!--                 example1     -->
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="10%">序号</th>
                            <th>头像</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>出生日期</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
</div>
<!-- jQuery 3 -->
<script src="pages/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="pages/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="pages/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="pages/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="pages/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="pages/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="pages/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="pages/dist/js/demo.js"></script>
<!-- page script -->
<script>


    $(function () {
        queryDatas("/HRM_SSM_war_exploded/employees");
    })
    function queryDatas(requestURL){
        $('#example1').DataTable({
            "bStateSave":true,//当刷新页面的时候我们希望，table和刷新前的一致。dataTables提供方法将table的状态保存起来。我们只需要把stateSave设置为true
            "destroy":true, //解决重新加载表格内容问题
            "sAjaxSource" : requestURL,
            "language": {url:"dataTable-language.txt"},
            "ordering":true,
            "columns":[
                {
                    "data":null,
                    "render" : function(data, type, full, meta){
                        return meta.row+1;
                    }
                },
                {
                    "data":"image",
                    "render" : function(data){
                        var image = "<img style='width: 30px;height: 30px' src='/HRM_SSM_war_exploded/upload/"+data+"'/>";
                        return image;
                    }
                },
                {"data":"e_no"},
                {"data":"name"},
                {
                    "data":"gender",
                    "render": function ( data ) {
                        return data==0?'女':'男'
                    }
                },
                {"data":"birthday"},
                {"data":"department.departmentName"},
                {
                    "data":"id",
                    "render": function (data) {
                        var opreate = "<div class='btn-group'><button  type='button' class='btn btn-warning btn-xs' onclick='deleteById("+data+")'>删除</button>";
                        opreate += "<button type='button' class='btn btn-info btn-xs' onclick='edit("+data+")'>编辑</button></div>";
                        return opreate;
                    }
                }
            ],
            "columnDefs":[{
                "targets":[1,3,4,5,6,7],
                "orderable": false
            }]
        })
    }
    /*"paging": true,// 是否开启本地分页
            "ordering": false,// 是否开启本地排序
            "info": true,// 是否显示左下角信息
            "lengthChange": false,// 是否允许用户改变表格每页显示的记录数
            "processing": true,// 是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)
            "searching": false,// 是否允许 DataTables 开启本地搜索
            "serverSide": true,// 是否开启服务器模式*/
    function deleteById(id) {
        $.ajax({
            url:"/HRM_SSM_war_exploded/employee/"+id,
            type:"DELETE",
            success:function (result) {
                if (result == "success"){
                    window.location.reload();
                }else{
                    $('#modal-message').html("删除失败！");
                    $('#modal-default').modal('show');
                }
            }
        })
    }
    function add() {
        window.location.href="general.html"
    }
    function edit(id){
        window.location.href="/HRM_SSM_war_exploded/view/edit.html?id="+id;
    }
</script>
</body>

</html>