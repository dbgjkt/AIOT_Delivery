package com.aiotdelivery.DAO;

import com.aiotdelivery.bean.*;
import com.aiotdelivery.tools.MyStringFix;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    /* server: dashboard */
    private static final String GET_DASHBOARD_COUNTS = "SELECT * FROM v_dashboard_counts";
    private static final String GET_DASHBOARD_PIE = "SELECT * FROM v_orderlist_pie";
    private static final String GET_CAR_INFO_ALL = "SELECT * FROM v_carlist";
    private static final String GET_ORDER_LISTS_ALL = "SELECT * FROM v_orderlist ORDER BY arrive_time DESC";
    private static final String GET_VIEW_CAR_ORDER_ALL = "SELECT * FROM v_car_order";

    private static final String GET_ADMIN_LISTS_ALL = "SELECT * FROM admin";
    private static final String GET_CUSTOMER_LISTS_ALL = "SELECT * FROM customer";
    private static final String GET_ORDER_STATUS_ALL = "SELECT * FROM order_status";
    private static final String GET_CAR_ALL = "SELECT * FROM car";
    private static final String GET_CAR_STATUS_ALL = "SELECT * FROM car_status";

    /* insert */
    private static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer VALUES (?, ?, ?, ?, ?)";
    private static final String INSERT_NEW_ORDER = "INSERT INTO order_list (order_id, car_id, customer_id, arrive_time, start_addr, dest_addr, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

    /* register */
    private static final String REGISTER_NEW_CUSTOMER = "INSERT INTO customer VALUES (?, ?, sha(?), ?, ?, '1')";

    /* update */
    private static final String UPDATE_ORDER = "UPDATE order_list SET customer_id = ?, car_id = ?, arrive_time = ?, status = ? WHERE order_id = ?";
    private static final String UPDATE_ORDER_BY_USER = "UPDATE order_list SET arrive_time = ?, dest_addr = ? WHERE order_id = ?";
    private static final String UPDATE_CAR = "UPDATE car SET status = ?, location = ? WHERE id = ?";
    private static final String UPDATE_CUSTOMER = "UPDATE customer SET name = ?, phone = ?, email = ?, payment = ? where id = ?";


    /* delete */
    private static final String DELETE_ORDER = "DELETE FROM order_list WHERE order_id = ?";

    /* user */
    private static final String GET_ORDER_LISTS_USER = "SELECT * FROM v_orderlist WHERE customer_name = ?";
    //private static final String GET_USER_INFO_BY_NAME = "SELECT * FROM customer WHERE name = ?";
    private static final String GET_USER_INFO_BY_NAME_AND_PASS = "SELECT * FROM customer WHERE name = ? AND password=sha(?)";
    //private static final String GET_ADMIN_INFO_BY_NAME = "SELECT * FROM admin WHERE name = ?";
    private static final String GET_ADMIN_INFO_BY_NAME_AND_PASS = "SELECT * FROM admin WHERE name = ? AND password=sha(?)";

    private static final String GET_ONE_FREE_CAR = "SELECT car_id FROM v_carfree LIMIT 1";
    private static final String GET_MAX_ORDER_ID = "SELECT MAX(order_id) FROM order_list";
    private static final String GET_MAX_CUSTOMER_ID = "SELECT MAX(id) FROM customer";

    /* user: insert */
    /* order_id, customer_id, car_id, time, start_addr, dest_addr, status */
    private static final String INSERT_ORDER = "INSERT INTO order_list VALUES (?, ?, ?, ?, ?, ?, 0)";

    /* Car Message */
    private static final String UPDATE_CAR_MESSAGE = "UPDATE car SET location = ? WHERE id = ?";
    
    
    private Connection conn;

    public DeliveryDAO() {
        try {
            Context context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/servdb");
            conn = ds.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertCustomer(CustomerBean customerBean) {
        try {
            // INSERT
            PreparedStatement pstmt = conn.prepareStatement(INSERT_NEW_CUSTOMER);
            pstmt.setString(1, customerBean.getId());
            pstmt.setString(2, customerBean.getName());
            pstmt.setString(3, customerBean.getPhone());
            pstmt.setString(4, customerBean.getEmail());
            pstmt.setString(5, customerBean.getPayment());
            pstmt.execute();
            System.out.println("INSERT success!");
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertOrder(OrderListBean orderListBean) {
        try {
            
            // get orderId
            int orderId = -1;
            PreparedStatement pstmt = conn.prepareStatement(GET_MAX_ORDER_ID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                orderId = Integer.parseInt(rs.getString("MAX(order_id)")) + 1;
            }
            
            // INSERT
            pstmt = conn.prepareStatement(INSERT_NEW_ORDER);

            pstmt.setString(1, String.valueOf(orderId));
            pstmt.setString(2, orderListBean.getCarId());
            pstmt.setString(3, orderListBean.getCustomerId());
            pstmt.setString(4, orderListBean.getArriveTime());
            pstmt.setString(5, orderListBean.getStartAddr());
            pstmt.setString(6, orderListBean.getDestAddr());
            pstmt.setString(7, orderListBean.getStatus());
            pstmt.execute();
            System.out.println("INSERT Order!");
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertOrderByUser(ViewOrderListBean viewOrderListBean, String customerId) {
        try {
            // get orderId
            int orderId = -1;
            PreparedStatement pstmt = conn.prepareStatement(GET_MAX_ORDER_ID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                orderId = Integer.parseInt(rs.getString("MAX(order_id)")) + 1;
            }

            // get carId
            String carId = "";
            pstmt = conn.prepareStatement(GET_ONE_FREE_CAR);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                carId = rs.getString("car_id");
            }

            System.out.println("start insert order by user:");
            System.out.println("customerId = " + customerId);
            System.out.println("orderId = " + orderId);
            System.out.println("carId = " + carId);
            // INSERT
            pstmt = conn.prepareStatement(INSERT_ORDER);
            pstmt.setString(1, String.valueOf(orderId));
            pstmt.setString(2, customerId);
            pstmt.setString(3, carId);
            pstmt.setString(4, viewOrderListBean.getArriveTime());
            pstmt.setString(5, "新北市板橋區民族路168號\r\n");
            pstmt.setString(6, viewOrderListBean.getDestAddr());
            pstmt.execute();
            System.out.println("INSERT success!");
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
/*
    public int getNewCustomerId() {
        int customerId = -1;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_MAX_CUSTOMER_ID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                customerId = Integer.parseInt(rs.getString("MAX(id)")) + 1;
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return customerId;
    }
//*/

    public void registerCustomer(CustomerBean CustomerBean) {
        try {
            System.out.println("start register:");

            // get customerId
            int customerId = -1;
            PreparedStatement pstmt = conn.prepareStatement(GET_MAX_CUSTOMER_ID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                customerId = Integer.parseInt(rs.getString("MAX(id)")) + 1;
            }

            // INSERT
            pstmt = conn.prepareStatement(REGISTER_NEW_CUSTOMER);
            pstmt.setString(1, String.valueOf(customerId));
            pstmt.setString(2, CustomerBean.getName());
            pstmt.setString(3, CustomerBean.getPassword());
            pstmt.setString(4, CustomerBean.getPhone());
            pstmt.setString(5, CustomerBean.getEmail());
            pstmt.execute();
            System.out.println("REGISTER success!");
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updateOrder(OrderListBean orderListBean) {
        try {
            // UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE_ORDER);
            stmt.setString(1, orderListBean.getCustomerId());
            stmt.setString(2, orderListBean.getCarId());
            stmt.setString(3, orderListBean.getArriveTime());
            stmt.setString(4, orderListBean.getStatus());
            stmt.setString(5, orderListBean.getOrderId());
            stmt.execute();
            System.out.println("UPDATE success!");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updateOrderUser(OrderListBean orderListBean) {
        try {
            // UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE_ORDER_BY_USER);
            stmt.setString(1, orderListBean.getArriveTime());
            stmt.setString(2, orderListBean.getDestAddr());
            stmt.setString(3, orderListBean.getOrderId());
            stmt.execute();
            System.out.println("UPDATE success!");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updateCar(CarBean carBean) {
        try {
            // UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE_CAR);
            stmt.setString(1, carBean.getStatus());
            stmt.setString(2, carBean.getCarLocation());
            stmt.setString(3, carBean.getCarId());
            stmt.execute();
            System.out.println("UPDATE success!");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updateCustomer(CustomerBean customerBean) {
        try {
            // UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE_CUSTOMER);
            stmt.setString(1, customerBean.getName());
            stmt.setString(2, customerBean.getPhone());
            stmt.setString(3, customerBean.getEmail());
            stmt.setString(4, customerBean.getPayment());
            stmt.setString(5, customerBean.getId());
            stmt.execute();
            System.out.println("UPDATE Customer!");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public List<OrderStatusBean> getOrderStatusAll() {
        List<OrderStatusBean> orderStatusBeanList = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ORDER_STATUS_ALL);
            ResultSet rs = stmt.executeQuery();
            orderStatusBeanList = new ArrayList<>();
            OrderStatusBean orderStatusBean;
            while (rs.next()) {
                orderStatusBean = new OrderStatusBean();
                orderStatusBean.setStatus(rs.getString("status"));
                orderStatusBean.setDescription(rs.getString("description"));
                orderStatusBeanList.add(orderStatusBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderStatusBeanList;
    }

    public List<CarBean> getCarAll() {
        List<CarBean> carBeanList = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_CAR_ALL);
            ResultSet rs = stmt.executeQuery();
            carBeanList = new ArrayList<>();
            CarBean carBean;
            while (rs.next()) {
                carBean = new CarBean();
                carBean.setCarId(rs.getString("id"));
                carBean.setStatus(rs.getString("status"));
                carBean.setCarLocation(rs.getString("location"));
                carBeanList.add(carBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return carBeanList;
    }

    public List<CarStatusBean> getCarStatusAll() {
        List<CarStatusBean> carStatusBeanList = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_CAR_STATUS_ALL);
            ResultSet rs = stmt.executeQuery();
            carStatusBeanList = new ArrayList<>();
            CarStatusBean carStatusBean;
            while (rs.next()) {
                carStatusBean = new CarStatusBean();
                carStatusBean.setStatus(rs.getString("status"));
                carStatusBean.setDescription(rs.getString("description"));
                carStatusBeanList.add(carStatusBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return carStatusBeanList;
    }

    public List<ViewCarOrderBean> getViewCarOrderAll() {
        List<ViewCarOrderBean> viewCarOrderBeanList = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_VIEW_CAR_ORDER_ALL);
            ResultSet rs = stmt.executeQuery();
            viewCarOrderBeanList = new ArrayList<>();
            ViewCarOrderBean viewCarOrderBean;
            while (rs.next()) {
                viewCarOrderBean = new ViewCarOrderBean();
                viewCarOrderBean.setCar_id(rs.getString("car_id"));
                viewCarOrderBean.setOrder_id(rs.getString("order_id"));
                viewCarOrderBean.setArrive_time(rs.getString("arrive_time"));
                viewCarOrderBeanList.add(viewCarOrderBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewCarOrderBeanList;
    }

    public void deleteOrder(String orderId) {
        try {
            PreparedStatement stmt = conn.prepareStatement(DELETE_ORDER);
            stmt.setString(1, orderId);
            stmt.execute();
            System.out.println("DELETE success!: " + orderId);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public ViewDashBoardCountBean getDashBoardCounts() {
        ViewDashBoardCountBean viewDashBoardCountBean = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_DASHBOARD_COUNTS);
            ResultSet rs = stmt.executeQuery();
            viewDashBoardCountBean = new ViewDashBoardCountBean();
            if (rs.next()) {
                viewDashBoardCountBean.setCarGoing(rs.getString("going"));
                viewDashBoardCountBean.setDelivering(rs.getString("delivering"));
                viewDashBoardCountBean.setWaiting(rs.getString("waiting"));
                viewDashBoardCountBean.setCarStaying(rs.getString("staying"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewDashBoardCountBean;
    }

    public ViewDashBoardPieBean getDashBoardPie() {
        ViewDashBoardPieBean viewDashBoardPieBean = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_DASHBOARD_PIE);
            ResultSet rs = stmt.executeQuery();
            viewDashBoardPieBean = new ViewDashBoardPieBean();
            if (rs.next()) {
                viewDashBoardPieBean.setPieFinished(rs.getString("finished"));
                viewDashBoardPieBean.setPieWorking(rs.getString("delivering"));
                viewDashBoardPieBean.setPieWaiting(rs.getString("waiting"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewDashBoardPieBean;
    }

    public List<ViewCarBean> getCarInfoAll() {
        List<ViewCarBean> viewCarBeans = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_CAR_INFO_ALL);
            ResultSet rs = stmt.executeQuery();
            viewCarBeans = new ArrayList<>();
            ViewCarBean viewCarBean;
            while (rs.next()) {
                viewCarBean = new ViewCarBean();
                viewCarBean.setCarId(rs.getString("car_id"));
                viewCarBean.setOrderId(rs.getString("last_order_id"));
                viewCarBean.setDescription(rs.getString("description"));
                viewCarBean.setLocation(rs.getString("car_location"));
                viewCarBeans.add(viewCarBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewCarBeans;
    }

    public List<CustomerBean> getCustomerListAll() {
        List<CustomerBean> customerBeans = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_CUSTOMER_LISTS_ALL);
            ResultSet rs = stmt.executeQuery();
            customerBeans = new ArrayList<>();
            CustomerBean customerBean;
            while (rs.next()) {
                customerBean = new CustomerBean();
                customerBean.setId(rs.getString("id"));
                customerBean.setName(rs.getString("name"));
                customerBean.setPassword(rs.getString("password"));
                customerBean.setPhone(MyStringFix.phoneDashAdd(rs.getString("phone")));
                customerBean.setEmail(rs.getString("email"));
                customerBean.setPayment(rs.getString("payment"));
                customerBeans.add(customerBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return customerBeans;
    }

    public List<CustomerBean> getAdminListAll() {
        List<CustomerBean> adminBeans = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ADMIN_LISTS_ALL);
            ResultSet rs = stmt.executeQuery();
            adminBeans = new ArrayList<>();
            CustomerBean adminBean;
            while (rs.next()) {
                adminBean = new CustomerBean();
                adminBean.setId(rs.getString("id"));
                adminBean.setName(rs.getString("name"));
                adminBean.setPassword(rs.getString("password"));
                adminBean.setPhone(rs.getString("phone"));
                adminBean.setEmail(rs.getString("email"));
                adminBeans.add(adminBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return adminBeans;
    }

    public List<ViewOrderListBean> getOrderListAll() {
        List<ViewOrderListBean> viewOrderListBeans = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ORDER_LISTS_ALL);
            ResultSet rs = stmt.executeQuery();
            viewOrderListBeans = new ArrayList<>();
            ViewOrderListBean viewOrderListBean;
            while (rs.next()) {
                viewOrderListBean = new ViewOrderListBean();
                viewOrderListBean.setOrderId(rs.getString("order_id"));
                viewOrderListBean.setCustomerName(rs.getString("customer_name"));
                viewOrderListBean.setCarId(rs.getString("car_id"));
                viewOrderListBean.setDestAddr(rs.getString("dest_addr"));
                viewOrderListBean.setArriveTime(rs.getString("arrive_time"));
                viewOrderListBean.setDescription(rs.getString("description"));
                viewOrderListBeans.add(viewOrderListBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewOrderListBeans;
    }

    public List<ViewOrderListBean> getOrderListByName(String userName) {
        List<ViewOrderListBean> viewOrderListBeans = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ORDER_LISTS_USER);
            stmt.setString(1, userName);
            ResultSet rs = stmt.executeQuery();
            viewOrderListBeans = new ArrayList<>();
            ViewOrderListBean viewOrderListBean;
            while (rs.next()) {
                viewOrderListBean = new ViewOrderListBean();
                viewOrderListBean.setOrderId(rs.getString("order_id"));
                viewOrderListBean.setCustomerName(rs.getString("customer_name"));
                viewOrderListBean.setCarId(rs.getString("car_id"));
                viewOrderListBean.setDestAddr(rs.getString("dest_addr"));
                viewOrderListBean.setArriveTime(rs.getString("arrive_time"));
                viewOrderListBean.setDescription(rs.getString("description"));
                viewOrderListBeans.add(viewOrderListBean);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return viewOrderListBeans;
    }

    public CustomerBean getUserInfoByName(String userName, String password) {
        CustomerBean user = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_USER_INFO_BY_NAME_AND_PASS);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            user = new CustomerBean();
            if (rs.next()) {
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setPayment(rs.getString("payment"));
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return user;
    }

    public CustomerBean getAdminInfoByName(String userName, String password) {
        CustomerBean user = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ADMIN_INFO_BY_NAME_AND_PASS);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            user = new CustomerBean();
            if (rs.next()) {
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return user;
    }

/*
    public String getFreeCarId() {
        String carId = "";
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_ONE_FREE_CAR);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                carId = rs.getString("car_id");
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return carId;
    }
//*/
/*
    public int getNewOrderId() {
        int orderId = -1;
        try {
            PreparedStatement stmt = conn.prepareStatement(GET_MAX_ORDER_ID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                orderId = Integer.parseInt(rs.getString("MAX(order_id)")) + 1;
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderId;
    }
//*/
/*
    public int checkIdentity(String userName, String password) {
        // 0: others
        // 1: admin
        // 2: customer
        int identity = 0;
        try {
            String dbUserName = "";
            String dbPassword = "";
            PreparedStatement stmt = conn.prepareStatement(GET_ADMIN_INFO_BY_NAME);
            stmt.setString(1, userName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                dbUserName = rs.getString("name");
                dbPassword = rs.getString("password");
            }
            if (!"".equals(userName) && userName.equals(dbUserName) && password.equals(dbPassword)) {
                identity = 1;
            } else {
                stmt = conn.prepareStatement(GET_USER_INFO_BY_NAME);
                stmt.setString(1, userName);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    dbUserName = rs.getString("name");
                    dbPassword = rs.getString("password");
                }
                if (!"".equals(userName) && userName.equals(dbUserName) && password.equals(dbPassword)) {
                    identity = 2;
                }
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return identity;
    }
//*/

    public int checkIdentity2(String userName, String password) {
        // 0: others
        // 1: admin
        // 2: customer
        int identity = 0;
        try {
            String dbUserName = "";
            PreparedStatement stmt = conn.prepareStatement(GET_ADMIN_INFO_BY_NAME_AND_PASS);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                dbUserName = rs.getString("name");
            }
            if (!"".equals(userName) && userName.equals(dbUserName)) {
                identity = 1;
            } else {
                stmt = conn.prepareStatement(GET_USER_INFO_BY_NAME_AND_PASS);
                stmt.setString(1, userName);
                stmt.setString(2, password);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    dbUserName = rs.getString("name");
                }
                if (!"".equals(userName) && userName.equals(dbUserName)) {
                    identity = 2;
                }
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return identity;
    }

    /*
     * Car Control
     */
    public void updateCarMessage(String id, String location) {
        try {
            // UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE_CAR_MESSAGE);
            stmt.setString(1, location);
            stmt.setString(2, id);
            stmt.execute();
            System.out.println("UPDATE Car Message");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
    }
}
