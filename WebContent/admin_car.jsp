<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aiotdelivery.bean.ViewCarBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<%@ page import="java.util.*" %>
<%-- <% List<ViewCarBean> cars = (ArrayList<ViewCarBean>) request.getAttribute("cars"); %> --%>
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

    <title>Car</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
        .my-scale-4-3 {
            position: relative;
            max-width: 100%;
            padding-bottom: 60%;
            overflow: hidden;
        }
        
        .my-scale-4-3 iframe{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>

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
                <div class="row">
                    <!-- Google map -->
<!--                     <div class="col-xl-8 col-lg-12"> -->
<!--                         <div class="card shadow mb-4"> -->
<!--                             <div class="card-header py-3"> -->
<!--                                 <h6 class="m-0 font-weight-bold text-primary">地圖</h6> -->
<!--                             </div> -->
<!--                             <div class="card-body my-scale-4-3"> -->
<!--                             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7231.648924214218!2d121.46262309472549!3d25.006080015855797!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a81e37d98de5%3A0x6f9e231a2b78478b!2z5Lit6I-v6Zu75L-h5a246ZmiIOadv-api-aJgA!5e0!3m2!1szh-TW!2stw!4v1589350010008!5m2!1szh-TW!2stw" -->
<!--                                     style="border:0;"  -->
<!--                                     aria-hidden="false" tabindex="0"></iframe> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4"> <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <div class="col-xl-12 col-lg-12">
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
                                        <tr>
                                            <td>${car.carId}</td>
                                            <td>${car.orderId}</td>
                                            <td>${car.description}</td>
                                            <td>${car.location}</td>
                                            <td><input type="button" value="修改"
                                                       onclick="updateCar(${car.carId})"/>
                                                <input type="button" value="監控"
                                                       onclick="controlCar(${car.carId})"/></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                    
                    <form id="updateCar" method="post" action="EditCar"></form>
                    <form id="controlCar" method="post" action="CarControl"></form>
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

<!-- sidebar control (need jQuery)-->
<script src="js/sidebar-control.js"></script>
<script src="js/crud.js"></script>
<script src="js/component.js"></script>

</body>

</html>