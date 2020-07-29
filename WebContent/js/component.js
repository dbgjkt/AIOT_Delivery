/*
 * render sideBar, topBar, other components.
 * need jquery. 
 */

function render_sidebar() {
    $(".my-sidebar").append(`
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <li>
            <div class="sidebar-brand d-flex align-items-center justify-content-center" onclick="gotoDashboard()">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fa fa-truck"></i>
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
            <form id="dashboardPage" class="nav-link" method="post" action="ServerMain">
                <i class="fas fa-fw fa-chart-area"></i>
                <span onclick="gotoDashboard()">主控台</span>
            </form>
        </li>
        <li class="nav-item active">
            <form id="carPage" class="nav-link" method="post" action="Car">
                <i class="fas fa-fw fa-car"></i>
                <span onclick="gotoCarPage()">車輛狀況</span>
            </form>
        </li>
        <li class="nav-item active">
            <form id="orderPage" class="nav-link" method="post" action="Order">
                <i class="fas fa-fw fa-file"></i>
                <span onclick="gotoOrderPage()">訂單</span>
            </form>
        </li>
        <li class="nav-item active">
            <form id="customerPage" class="nav-link" method="post" action="Customer">
                <i class="fas fa-fw fa-user"></i>
                <span onclick="gotoCustomerPage()">客戶</span>
            </form>
        </li>
    </ul>
`);
}

function render_topbar() {
    $(".my-topbar").append(`
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <li>
                        <div class="topbar-divider d-none d-sm-block"></div>
                    </li>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">`+
                            $('.my-topbar').attr("username")+`
                                <jsp:getProperty name="user" property="name"/>
                            </span>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
`);
}

function render_admin_logout() {
    $(".admin-logout").append(`
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="ServerLogout">Logout</a>
            </div>
        </div>
    </div>
</div>
    `);
}

function render_user_logout() {
    $(".user-logout").append(`
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="user_login.html">Logout</a>
            </div>
        </div>
    </div>
</div>
    `);
}


function render_footer() {
    $(".my-footer").append(`
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; NexRover 2020</span>
                </div>
            </div>
        </footer>
    `);
}

$(function(){
    render_sidebar();
    render_topbar();
    render_admin_logout();
    render_user_logout();
    render_footer();
});
