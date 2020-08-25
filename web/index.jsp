<%--
  Created by IntelliJ IDEA.
  User: 昊
  Date: 2020/7/28
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/HRM_SSM_war_exploded/pages/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/HRM_SSM_war_exploded/pages/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/HRM_SSM_war_exploded/pages/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/HRM_SSM_war_exploded/pages/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/HRM_SSM_war_exploded/pages/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="login-box-body">
    <form id="dataForm">
      <div class="form-group has-feedback">
        <input type="text" name="userName" class="form-control" placeholder="Username">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="btn_submit" type="button" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
    </div>
    <!-- /.social-auth-links -->

    <a href="register.jsp" class="text-center">注册</a>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
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
</div>
<!-- /.modal-dialog -->
<!-- jQuery 3 -->
<script src="/HRM_SSM_war_exploded/pages/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/HRM_SSM_war_exploded/pages/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/HRM_SSM_war_exploded/pages/plugins/iCheck/icheck.min.js"></script>
<script>

  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    })
  });
  $("#btn_submit").click(function () {
    $.ajax({
      type: "POST",
      url: "/HRM_SSM_war_exploded/login",
      data: $("#dataForm").serialize(),
      success: function (result) {
        if (result == "failure"){
          $('#modal-message').html("用户名密码错误！");
          $('#modal-default').modal('show');
        }else{
          window.location.href="/HRM_SSM_war_exploded/toMain";
        }
      }
    })
  })
</script>
</body>
</html>
