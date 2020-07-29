<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<% CustomerBean user = (CustomerBean) session.getAttribute("customer"); %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>智能車送貨服務 v1.0</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="css/jquery.datetimepicker.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">新增訂單</h1>
                                </div>
                                <form id="insertForm" method="post" action="InsertOrderUser">
                                    <div class="form-group">
                                        <label for="user_name" class="form_label">姓名：</label>
                                        <input
                                                type="text" class="form-control form-control-user"
                                                id="user_name" name="user_name" autofocus
                                                required="required" value="<%=user.getName()%>" disabled/>
                                    </div>
                                    <div class="form-group" style="display:none">
                                        <label for="prod_name" class="form_label">商品名稱：</label>
                                        <input
                                                type="text" class="form-control form-control-user"
                                                id="prod_name" name="prod_name" aria-describedby="emailHelp"
                                                required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="deli_addr" class="form_label">取貨地址：</label>
                                        <input
                                                type="text" class="form-control form-control-user"
                                                id="deli_addr" name="deli_addr" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="deli_time" class="form_label">取貨時間：</label>
                                        <input
                                                type="text" class="form-control form-control-user datetimepicker"
                                                id="deli_time" name="deli_time" required="required" autocomplete="off"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="form_label">連絡電話：</label>
                                        <input
                                                type="text" class="form-control form-control-user"
                                                id="phone" name="phone" value="<%=user.getPhone()%>"
                                                required="required"/>
                                    </div>
                                    <div class="items">
                                        <label for="remark" class="form_label">備註：</label>
                                        <input
                                                type="text" name="remark"
                                                class="form-control form-control-user" id="remark" autofocus
                                                autocomplete="off" size="40" maxlength="30"
                                        />
                                    </div>
                                    <hr>
                                    <input type="button" onclick="insertCheck()"
                                           class="btn btn-primary btn-user btn-block" value="確定送出"/>
                                    <input type="reset" class="btn btn-primary btn-user btn-block"
                                           value="清除重填"/>

                                </form>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- link to jQuery -->
<script src="js/jquery-3.4.1.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script src="js/jquery.datetimepicker.full.min.js"></script>
<script src="js/jquery-ui.js"></script>

<script>
    $(function () {
        $(".datetimepicker").datetimepicker();
    });
</script>

<script src="js/crud.js"></script>

</body>

</html>
