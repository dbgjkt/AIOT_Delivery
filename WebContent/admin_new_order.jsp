<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.aiotdelivery.bean.CarBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<%@ page import="com.aiotdelivery.bean.OrderStatusBean" %>

<%-- List<CarBean> carList = (ArrayList<CarBean>) request.getAttribute("car"); --%>
<%-- List<CustomerBean> customers = (ArrayList<CustomerBean>) request.getAttribute("customers"); --%>
<%-- List<OrderStatusBean> OrderStatusList = (ArrayList<OrderStatusBean>) request.getAttribute("orderStatus"); --%>

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
                                <!-- form -->
                                <form method="post" action="InsertOrder">
                                    <div class="form-group">
                                        <label for="orderCarId" class="form_label">車子編號：</label>
                                        <select name="orderCarId" id="orderCarId">
                                        <c:forEach items="${car}" var="car" varStatus="c">
                                            <option value="${car.carId}">${car.carId}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="orderCustomerId" class="form_label">顧客姓名：</label>
                                        <select name="orderCustomerId" id="orderCustomerId">
                                        <c:forEach items="${customers}" var="customer" varStatus="c">
                                            <option value="${customer.id}">${customer.name}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="arriveTime" class="form_label">訂單時間：</label>
                                        <input type="datetime-local" name="arriveTime" id="arriveTime"
                                               size="15" maxlength="16" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label for="destAddr" class="form_label">送貨地址：</label>
                                        <input type="text" name="destAddr" id="destAddr"
                                               size="20" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label for="orderStatus" class="form_label">訂單狀態：</label>
                                        <select name="orderStatus" id="orderStatus">
                                        <c:forEach items="${orderStatus}" var="orderStatus" varStatus="c">
                                            <option value="${orderStatus.status}">${orderStatus.description}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                    <hr>
                                    <input type="submit" class="btn btn-primary btn-user btn-block" value="確定送出"/>
                                    <input type="reset" class="btn btn-primary btn-user btn-block" value="清除重填"/>
                                </form>
                                <!-- form end -->
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

</body>

</html>
