function insertEmp() {
    $("#insertForm").append($("#empno").attr("type", "hidden")).append(
        $("#ename").attr("type", "hidden")).append(
        $("#hiredate").attr("type", "hidden")).append(
        $("#salary").attr("type", "hidden")).append(
        $("#deptno").attr("type", "hidden")).append(
        $("#title").attr("type", "hidden")).submit();
}

function updateEmp(empno) {
    let input = $("<input>").attr("type", "hidden").attr("name", "empno").val(empno);
    $("#updateForm").append($(input)).submit();
}

function deleteEmp(empno) {
    let input = $("<input>").attr("type", "hidden").attr("name", "empno").val(empno);
    $("#deleteForm").append($(input)).submit();
}

function resetEmp() {
    $(":text").val("");
}

function insertForm() {
    $("#insertForm").submit();
}

function insertCheck() {
    if (confirm("確定新增？")) {
        $("#insertForm").submit();
    }
}

function updateOrder(orderId) {
    let input = $("<input>").attr("name", "orderId").val(orderId);
    $("#updateOrder").append($(input)).submit();
}

function updateOrderDB() {
    if (confirm("確定修改？")) {
        $("#updateOrder").append($("#orderId").attr("type", "hidden"))
            .append($("#carId").attr("type", "hidden"))
            .append($("#customerId").attr("type", "hidden"))
            .append($("#arriveTime").attr("type", "hidden"))
            .append($("#status").attr("type", "hidden")).submit();
    }
}

function updateOrderUser() {
    if (confirm("確定修改？")) {
        $("#updateOrder").append($("#orderId").attr("type", "hidden"))
            .append($("#arriveTime").attr("type", "hidden"))
            .append($("#destAddr").attr("type", "hidden")).submit();
    }
}

function deleteOrder(orderId) {
    if (confirm("確定刪除？")) {
        let input = $("<input>").attr("name", "orderId").val(orderId);
        $("#deleteOrder").append($(input)).submit();
    }
}

function updateCar(carId) {
    let input = $("<input>").attr("name", "carId").val(carId);
    $("#updateCar").append($(input)).submit();
}

function updateCarDB() {
    if (confirm("確定修改？")) {
        $("#updateCar").append($("#carId").attr("type", "hidden"))
            .append($("#status").attr("type", "hidden"))
            .append($("#Location").attr("type", "hidden")).submit();
    }
}

function updateCustomer(customerId) {
    let input = $("<input>").attr("name", "customerId").val(customerId);
    $("#updateCustomer").append($(input)).submit();
}

function updateCustomerDB() {
    if (confirm("確定修改？")) {
        $("#updateCustomer").append($("#customerId").attr("type", "hidden"))
            .append($("#customerName").attr("type", "hidden"))
            .append($("#customerPhone").attr("type", "hidden"))
            .append($("#customerEmail").attr("type", "hidden"))
            .append($("#customerPayment").attr("type", "hidden")).submit();
    }
}

function controlCar(carId) {
    let input = $("<input>").attr("name", "carId").val(carId);
    $("#controlCar").append($(input)).submit();
}