<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aiotdelivery.bean.ViewOrderListBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<%@ page import="com.aiotdelivery.bean.OrderStatusBean" %>
<%@ page import="java.util.*" %>
<%-- List<ViewOrderListBean> ords = (ArrayList<ViewOrderListBean>) request.getAttribute("ords"); --%>
<%-- List<CustomerBean> customers = (ArrayList<CustomerBean>) request.getAttribute("customers"); --%>
<%-- List<OrderStatusBean> OrderStatusList = (ArrayList<OrderStatusBean>) request.getAttribute("orderStatus"); --%>
<%-- CustomerBean user = (CustomerBean) session.getAttribute("user"); --%>
<jsp:useBean id="user" class="com.aiotdelivery.bean.CustomerBean" scope="session" />

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Order</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="css/jquery.datetimepicker.css" rel="stylesheet">

    <!-- DataTable -->
    <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <div class="my-sidebar"></div>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <div class="my-topbar" username="<%=user.getName()%>"></div>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">訂單列表</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <!-- form -->
                            <form id="updateOrder" method="post" action="UpdateToOrder">
                                <table id="myDataTable" class="display">
                                    <thead>
                                        <tr>
                                            <th>訂單編號</th>
                                            <th>車子編號</th>
                                            <th>顧客姓名</th>
                                            <th>訂單時間</th>
                                            <th>送貨地址</th>
                                            <th>訂單狀態</th>
                                            <th>編輯資料</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ords}" var="ord" varStatus="c">
                                        <c:choose>
                                            <c:when test="${ord.orderId == orderId}">
                                            
                                        <tr>
                                            <td>${ord.orderId}
                                                <label for="orderId">
                                                    <input type="text" name="orderId" id="orderId" style="display: none"
                                                           size="8" maxlength="10" value="${ord.orderId}">
                                                </label>
                                            </td>
                                            <td>
                                                <label for="carId">
                                                    <input type="text" name="carId" id="carId" size="8" maxlength="10"
                                                           value="${ord.carId}">
                                                </label>
                                            </td>
                                            <td>
                                                <label for="customerId">
                                                    <select name="customerId" id="customerId">
                                                    <c:forEach items="${customers}" var="customer" varStatus="c">
                                                        <c:choose>
                                                        <c:when test="${customer.name == ord.customerName}">
                                                        <option value="${customer.id}" selected>${customer.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <option value="${customer.id}">${customer.name}</option>
                                                        </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                            <td>
                                                <label for="arriveTime">
                                                    <input type="text" name="arriveTime" id="arriveTime" class="datetimepicker"
                                                           size="15" maxlength="16" value="${ord.arriveTime.substring(0,16)}">
                                                </label>
                                            </td>
                                            <td>
                                                <label for="destAddr">
                                                    <input type="text" name="destAddr" id="destAddr"
                                                           size="40" maxlength="40" value="${ord.destAddr}">
                                                </label>
                                            </td>
                                            <td>
                                                <label for="status">
                                                    <select name="status" id="status">
                                                    <c:forEach items="${orderStatus}" var="orderStatus" varStatus="c">
                                                    <c:choose>
                                                        <c:when test="${orderStatus.description == ord.description}">
                                                        <option value="${orderStatus.status}" selected>${orderStatus.description}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <option value="${orderStatus.status}">${orderStatus.description}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                            <td><input type="button" value="修改" onclick="updateOrderDB()"/>
                                                <input type="button" value="取消" onclick="gotoOrderPage()"/></td>
                                        </tr>
                                            </c:when>
                                            <c:otherwise>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:forEach items="${ords}" var="ord" varStatus="c">
                                        <c:choose>
                                            <c:when test="${ord.orderId == orderId}">
                                            </c:when>
                                            <c:otherwise>
                                         <tr>
                                            <td>${ord.orderId}</td>
                                            <td>${ord.carId}</td>
                                            <td>${ord.customerName}</td>
                                            <td>${ord.arriveTime}</td>
                                            <td>${ord.destAddr}</td>
                                            <td>${ord.description}</td>
                                            <td></td>
                                        </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                            <!-- form end -->
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <div class="my-footer"></div>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="admin-logout"></div>

<!-- link to jQuery -->
<script src="js/jquery-3.4.1.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!--引用dataTables.js-->
<script src="js/jquery.dataTables.min.js"></script>

<script>
    $(function () {
        $('#table_id').DataTable();
        $("#myDataTable").DataTable({
            searching: true, //關閉filter功能
            ordering: false
            // columnDefs: [{
            //     targets: [3],
            //     orderable: false,
            // }]
        });
    });
</script>

<script src="js/jquery.datetimepicker.full.min.js"></script>
<script src="js/jquery-ui.js"></script>

<script>
    $(function () {
        $(".datetimepicker").datetimepicker();
    });
</script>

<!-- sidebar control (need jQuery)-->
<script src="js/sidebar-control.js"></script>
<script src="js/crud.js"></script>
<script src="js/component.js"></script>

</body>

</html>