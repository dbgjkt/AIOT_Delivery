<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aiotdelivery.bean.ViewCarBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<%@ page import="java.util.*" %>
<%@ page import="com.aiotdelivery.bean.CarStatusBean" %>
<%-- <% List<ViewCarBean> cars = (ArrayList<ViewCarBean>) request.getAttribute("cars"); %> --%>
<%-- <% List<CarStatusBean> carStatusList = (ArrayList<CarStatusBean>) request.getAttribute("carStatus"); %> --%>
<jsp:useBean id="user" class="com.aiotdelivery.bean.CustomerBean" scope="session" />
<%-- CustomerBean user = (CustomerBean) session.getAttribute("user"); --%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Car</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">車輛列表</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" style="width:100%; border-spacing:0;">
                                <thead>
                                <tr>
                                    <th>車輛編號</th>
                                    <th>訂單編號</th>
                                    <th>車輛狀態</th>
                                    <th>目前位置</th>
                                    <th>編輯資料</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>車輛編號</th>
                                    <th>訂單編號</th>
                                    <th>車輛狀態</th>
                                    <th>目前位置</th>
                                    <th>編輯資料</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                
                                <c:forEach items="${cars}" var="car" varStatus="c">
                                    <c:choose>
                                        <c:when test="${car.carId==carId}">
                                            <tr>
                                                <td>${car.carId}
                                                    <label for="carId">
                                                        <input type="text" name="carId" id="carId" style="display: none"
                                                               size="8" maxlength="10" value="${car.carId}">
                                                    </label>
                                                </td>

                                                <td>${car.orderId}
                                                </td>

                                                <td>
                                                    <label for="status">
                                                        <select name="status" id="status">
                                                        <c:forEach items="${carStatus}" var="carStatus" varStatus="c">
                                                            <c:choose>
                                                                <c:when test="${carStatus.description == car.description}">
                                                                    <option value="${carStatus.status}" selected>${carStatus.description}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${carStatus.status}">${carStatus.description}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        </select>
                                                    </label>
                                                </td>

                                                <td>
                                                    <label for="location">
                                                        <input type="text" name="location" id="location" size="25"
                                                               maxlength="25" value="${car.location}">
                                                    </label>
                                                </td>

                                                <td><input type="button" value="修改" onclick="updateCarDB()"/>
                                                    <input type="button" value="取消" onclick="gotoCarPage()"/></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td>${car.carId}</td>
                                                <td>${car.orderId}</td>
                                                <td>${car.description}</td>
                                                <td>${car.location}</td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <form id="updateCar" method="post" action="UpdateToCar"></form>
                
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

<!-- sidebar control (need jQuery)-->
<script src="js/sidebar-control.js"></script>
<script src="js/crud.js"></script>
<script src="js/component.js"></script>

</body>

</html>