<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.aiotdelivery.bean.ViewOrderListBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<%-- <jsp:useBean id="user" class="com.aiotdelivery.bean.CustomerBean" scope="session" /> --%>
<%-- <% List<ViewOrderListBean> ords = (ArrayList<ViewOrderListBean>) request.getAttribute("ords"); %> --%>
<% CustomerBean user = (CustomerBean) session.getAttribute("customer"); %>

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

    <!-- DataTable -->
    <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <li>
            <div class="sidebar-brand d-flex align-items-center justify-content-center" onclick="gotoDashboard()">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                </div>
                <div class="sidebar-brand-text mx-3">NexRover</div>
            </div>
        </li>

        <!-- Divider -->
        <li>
	        <hr class="sidebar-divider my-0">
        </li>

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <form id="dashboardPage" class="nav-link" method="post" action="UserMain">
                <i class="fas fa-fw fa-file"></i>
                <span onclick="gotoDashboard()">所有訂單</span>
            </form>
        </li>
        <li class="nav-item active">
            <form id="insertForm" class="nav-link" method="post" action="AddNewOrder">
                <i class="fas fa-fw fa-plus"></i>
                <span onclick="insertForm()">新增訂單</span>
            </form>
        </li>
        <li class="nav-item active">
            <form id="aboutusPage" class="nav-link" method="post" action="AboutUs">
                <i class="fas fa-fw fa-info"></i>
                <span onclick="gotoAboutUs()">關於 NexRover</span>
            </form>
        </li>
    </ul>
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
                        <h6 class="m-0 font-weight-bold text-primary">所有訂單</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="myDataTable" class="display">
                                <thead>
                                <tr>
                                    <th>訂單編號</th>
                                    <th>姓名</th>
                                    <th>預定時間</th>
                                    <th>出車編號</th>
                                    <th>目的地</th>
                                    <th>訂單狀態</th>
                                    <th>編輯資料</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ords}" var="ord" varStatus="c" >
                                <tr>
                                    <td>${ord.orderId}</td>
                                    <td>${ord.customerName}</td>
                                    <td>${ord.arriveTime}</td>
                                    <td>${ord.carId}</td>
                                    <td>${ord.destAddr}</td>
                                    <td>${ord.description}</td>
                                    <td><input type="button" value="修改" onclick="updateOrder(${ord.orderId})"/>
                                        <input type="button" value="刪除" onclick="deleteOrder(${ord.orderId})"/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <h3>共${ords.size()}筆訂單資料</h3>
                            <input type="button" value="新增訂單" onclick="insertForm()"/>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <form id="updateOrder" method="post" action="EditUserMain"></form>
        <form id="deleteOrder" method="post" action="DeleteOrderUser"></form>

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
<div class="user-logout"></div>


<!-- link to jQuery -->
<script src="js/jquery-3.4.1.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!--引用dataTables.js-->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<script>
    $(function () {
        $('#table_id').DataTable();
        $("#myDataTable").DataTable({
            searching: true, //關閉filter功能
            // columnDefs: [{
            //     targets: [3],
            //     orderable: false,
            // }]
        });
    });
</script>

<!-- sidebar control (need jQuery)-->
<script src="js/sidebar-control.js"></script>
<script src="js/crud.js"></script>
<script src="js/component.js"></script>

</body>

</html>