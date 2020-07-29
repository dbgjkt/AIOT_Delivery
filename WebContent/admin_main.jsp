<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.aiotdelivery.bean.ViewDashBoardCountBean" %>
<%@ page import="com.aiotdelivery.bean.ViewDashBoardPieBean" %>
<%@ page import="com.aiotdelivery.bean.CustomerBean" %>
<% ViewDashBoardCountBean dbc = (ViewDashBoardCountBean) session.getAttribute("counts"); %>
<% ViewDashBoardPieBean pie = (ViewDashBoardPieBean) session.getAttribute("pie"); %>
<% CustomerBean user = (CustomerBean) session.getAttribute("user"); %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

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

                <!-- Page Heading -->
<!--                 <div class="d-sm-flex align-items-center justify-content-between mb-4"> -->
<!--                     <h1 class="h3 mb-0 text-gray-800">主控台</h1> -->
<!--                 </div> -->

                <!-- Content Row: Cards -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">行進中車輛
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=dbc.getCarGoing()%>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-road fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">待命中車輛
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=dbc.getCarStaying()%>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-truck-loading fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">送貨中訂單
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=dbc.getDelivering()%>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-shipping-fast fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">等待中訂單
                                        </div>
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=dbc.getWaiting()%>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-spinner fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Content Row: Chart -->
                <div class="row">
                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">運送流量</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Area Chart -->

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">訂單完成度</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                    <span class="mr-2">
                                      <i class="fas fa-circle text-primary"></i> 已完成訂單
                                      <span id="pieDone"><%=pie.getPieFinished()%></span>
                                    </span>
                                    <span class="mr-2">
                                      <i class="fas fa-circle text-success"></i> 送貨中訂單
                                      <span id="pieWorking"><%=pie.getPieWorking()%></span>
                                    </span>
                                    <span class="mr-2">
                                      <i class="fas fa-circle text-info"></i> 等待中訂單
                                      <span id="pieWaiting"><%=pie.getPieWaiting()%></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Pie Chart -->
                </div>
                <!-- End of Content Row: Chart -->
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

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>

<!-- sidebar control (need jQuery)-->
<script src="js/sidebar-control.js"></script>

<script src="js/component.js"></script>

</body>

</html>