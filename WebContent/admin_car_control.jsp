<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.aiotdelivery.bean.CustomerBean"%>

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

<title>Car Control</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for car_control-->
<link href="css/car_control.css" rel="stylesheet">
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
                    <section>
                        <nav>
                            <ul>
                                <li>
                                    <div class="view">
                                        <!---------------------------------影像串流視窗----------------------------------------------->
                                        <div class="img_title">
                                            <h1>即時影像：${carId}號車</h1>
                                        </div>
                                        <span class="img">
                                            <img class="car-camera" src="http://192.168.50.65:5000/video_feed" style="width: 50vw" />
                                        </span>
                                        <!---------------------------------------------------------------------------------------->
                                    </div>
                                </li>
                            </ul>
                        </nav>

                        <article>
                            <!---------------------------------- 車子控制 ------------------------------------------------ -->
                            <div class="control">
                                <div class="ControllPanel_title">
                                    <h2>
                                        <span id="output"></span>
                                    </h2>
                                </div>
                                <div>
                                    <table class="ControllPanel">
                                        <tr>
                                            <th colspan="3" class="title">方向控制</th>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input class="F" type="button" onclick="motor('F')" value="前"></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><input class="L" type="button" onclick="motor('L')" value="左"></td>
                                            <td><input class="S" type="button" onclick="motor('S')" value="停"></td>
                                            <td><input class="R" type="button" onclick="motor('R')" value="右"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input class="B" type="button" onclick="motor('B')" value="後"></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><span>&nbsp;</span></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <table class="ControlPanel">
                                        <tr>
                                            <th colspan="3" class="title">模式切換</th>
                                        </tr>
                                        <tr>
                                            <td><span id="auto-mode" class="mode mode-on" style="border: 1px; padding: 5px">自動</span>
                                                <span id="ctrl-mode" class="mode" style="border: 1px; padding: 5px">手動</span>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="ControlPanel">
                                        <tr>
                                            <th colspan="3" class="title">取貨</th>
                                        </tr>
                                        <tr>
                                            <td><span id="box-on" class="mode mode-on" style="border: 1px; padding: 5px">開</span>
                                                <span id="box-off" class="mode" style="border: 1px; padding: 5px">關</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </article>
                    </section>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <form id="updateOrder" method="post" action="EditUserMain"></form>
            <form id="deleteOrder" method="post" action="DeleteOrderUser"></form>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; NexRover 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top"> <i
        class="fas fa-angle-up"></i>
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

    <!-- sidebar control (need jQuery)-->
    <script src="js/sidebar-control.js"></script>
    <script src="js/crud.js"></script>
    <script src="js/car_control.js"></script>
    <script src="js/component.js"></script>

</body>

</html>