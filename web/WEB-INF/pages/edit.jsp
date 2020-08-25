<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>更改雇员信息</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../pages/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../pages/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../pages/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../pages/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../pages/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../pages/dist/css/jquery.datetimepicker.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->

    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->

        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                编辑雇员
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">General Elements</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">修改雇员信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form enctype="multipart/form-data" id="add_form" role="form">
                            <div class="box-body">
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:6%;">姓名:</label>
                                    <input type="text" name="name" class="form-control" style="width:93%;"  placeholder="姓名">
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:6%;">工号:</label>
                                    <input type="text" name="e_no" class="form-control" style="width:93%;"  placeholder="工号">
                                </div>
                                <div class="form-group col-md-6">
                                    <label >性别:&nbsp;</label>
                                    <label class="radio-inline">
                                        <input type="radio"  value="1" name="gender">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio"  value="0" name="gender">女
                                    </label>
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:6%;">薪水:</label>
                                    <input type="text" name="salary" class="form-control" style="width:93%;"  placeholder="薪水">
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:6%;">生日:</label>
                                    <input autocomplete="off"  type="text" name="birthday" class="form-control" id="datetimepicker" style="width:93%;" placeholder="生日">
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:12%;">更改头像:</label>
                                    <input style="display: inline" type="file" name="imageFile">
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:6%;">部门:</label>
                                    <select id="selectClazz" name="department.dep_id" class="form-control" style="width:93%;"></select>
                                </div>
                                <div class="form-group col-md-6 form-inline">
                                    <label style="width:10%;">原头像:</label>
                                    <img src="" style="width: 30px;height: 30px"/>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer" style="text-align: end;">
                                <input type="button" id="submitBtn" class="btn btn-primary" value="提交"/>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->
                </div>
                <!--/.col (left) -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">

    </footer>
    <!--模态窗，显示提交后服务器返回的信息
      data-backdrop="static"点击外部遮罩层不自动关闭
      data-keyboard="false"点击esc按钮不关闭
    -->
    <div class="modal fade" id="modal-default" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p id="modal-message">One fine body&hellip;</p>
                </div>
                <div class="modal-footer">
                    <button id="model-closeBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="../pages/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../pages/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../pages/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../pages/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../pages/dist/js/demo.js"></script>
<script src="../pages/dist/js/jquery.datetimepicker.full.min.js"></script>
<script src="../pages/dist/js/jquery.form.js"></script>
<script>

    var id;
    $(function () {
        /*var url = window.location.search;
        if(url.indexOf("?")!=-1){
            id = url.substr(url.indexOf("=")+1);
        }*/
        id=${varId}
        if (id!=""){
            $.ajax({
                url:"/HRM_SSM_war_exploded/employee/"+id,
                type:"GET",
                success:function (res) {
                    $("input[name='id']").val(res.id)
                    $("#datetimepicker").val(res.birthday)
                    $("input[name='e_no']").val(res.e_no)
                    $("input[name='name']").val(res.name)
                    $("input[name='salary']").val(res.salary)
                    if (res.gender == 0){
                        $("input[type='radio'][value='0']").attr("checked","checked")
                    }
                    if (res.gender == 1){
                        $("input[type='radio'][value='1']").attr("checked","checked")
                    }
                    $("img").attr("src","/HRM_SSM_war_exploded/upload/"+res.image)
                    $.ajax({
                        url:"/HRM_SSM_war_exploded/departments",
                        type:"GET",
                        dataType:"JSON",
                        success:function (data) {
                            $('#selectClazz').prepend("<option value='0'>--请选择部门--</option>")
                            for (var i=0;i<data.length;i++){
                                if (res.department.dep_id == data[i].dep_id){
                                    $('#selectClazz').append("<option selected value='"+data[i].dep_id+"'>"+data[i].departmentName+"</option>")
                                }else {
                                    $('#selectClazz').append("<option value='"+data[i].dep_id+"'>"+data[i].departmentName+"</option>")
                                }
                            }
                        }
                    })
                }
            })
        }
    })

    $('#datetimepicker').datetimepicker({
        format:"Y-m-d",
        timepicker:false
    })

    $('#submitBtn').click(function () {
        var form = $('#add_form')[0];
        var formData = new FormData(form);
        formData.append("_method","PUT")
        $.ajax({
            url:"/HRM_SSM_war_exploded/employee/"+id,
            /*value="/employee/{id}" methode=HttpRequestMethod.POST*/
            type:"POST",
            data:formData,
            processData:false,
            contentType:false,
            success:function (result) {
                if (result == "success")
                    $('#modal-message').html("保存成功！");
                $('#modal-default').modal('show');
            }
        })
    })
    $('#model-closeBtn').click(function () {
        if($('#modal-message').html() == "保存成功！"){
            window.location.href="/HRM_SSM_war_exploded/toMain";
            /*$(location).attr('href', 'data.html');*/
        }
    })
</script>
</body>
</html>