<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" class="com.aiotdelivery.bean.CustomerBean" scope="session" />
<%-- List<CustomerBean> customers = (ArrayList<CustomerBean>) request.getAttribute("customers"); --%>
<%-- CustomerBean user = (CustomerBean) session.getAttribute("user"); --%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Customer</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
                <!--<div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                    <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                </div>-->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">客戶列表</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="myDataTable" class="display">
                                <thead>
                                <tr>
                                    <th>顧客編號</th>
                                    <th>顧客姓名</th>
                                    <th>顧客電話</th>
                                    <th>顧客信箱</th>
                                    <th>付款方式</th>
                                    <th>編輯資料</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${customers}" var="customer" varStatus="c">
                                    <c:choose>
                                        <c:when test="${customer.id==customerId}">
                                            <tr>
                                                <td>${customer.id}
                                                    <label for="customerId">
                                                        <input type="text" name="customerId" id="customerId" style="display: none"
                                                               size="8" maxlength="10" value="${customer.id}">
                                                    </label>
                                                </td>

                                                <td>
                                                    <label for="customerName">
                                                        <input type="text" name="customerName" id="customerName"
                                                               size="8" maxlength="10" value="${customer.name}">
                                                    </label>
                                                </td>

                                                <td>
                                                    <label for="customerPhone">
                                                        <input type="text" name="customerPhone" id="customerPhone" size="12"
                                                               maxlength="12" value="${customer.phone}">
                                                    </label>
                                                </td>

                                                <td>
                                                    <label for="customerEmail">
                                                        <input type="text" name="customerEmail" id="customerEmail" size="25"
                                                               value="${customer.email}">
                                                    </label>
                                                </td>

                                                <td>
                                                    <label for="customerPayment">
                                                        <input type="text" name="customerPayment" id="customerPayment" size="1"
                                                               maxlength="1" value="${customer.payment}">
                                                    </label>
                                                </td>

                                                <td><input type="button" value="修改" onclick="updateCustomerDB()"/>
                                                    <input type="button" value="取消" onclick="gotoCustomerPage()"/></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td>${customer.id}</td>
                                                <td>${customer.name}</td>
                                                <td>${customer.phone}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.payment}</td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form id="updateCustomer" method="post" action="UpdateToCustomer"></form>
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