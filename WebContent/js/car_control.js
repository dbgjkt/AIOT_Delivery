function motor(cmd) {
    $.get('http://6f99e3c784eb.ngrok.io' + cmd, callback);
}

function callback(value, status) {
    if (status == "success") {
        $('#output').text(value);
    } else {
        $('#output').text("Error!");
    }
}

function sendMsgToCar(mode, box) {
    //TODO: send variables mode, box to car
    let cmd = '';
    cmd += (mode) ? 'ctrl':'auto';
    cmd += (box) ? 'on':'off';
    $.get('http://6f99e3c784eb.ngrok.io/msg/' + cmd, callback);
}

$(function() {
    let mode = false;   // true:ctrl, false:auto
    let box = false;    // true:open, false:close
    $('#output').text("Ready");

    $(document).keydown(function(event) {
        let keyNum = event.which; // 獲取鍵值
        console.log(keyNum)

        switch (keyNum) { // 判斷按鍵
        case 37:
            motor('L');
            break; // 左
        case 38:
            motor('F');
            break; // 上
        case 39:
            motor('R');
            break; // 右
        case 40:
            motor('B');
            break; // 下
        default:
        } // Switch 結束

    }) // keydown事件結束

    $(document).keyup(function(event) {
        let keyNum = event.which; // 獲取鍵值
        // console.log(keyNum)
        motor('S');
    })

    $("#auto-mode").click(function() {
        $("#auto-mode").addClass('mode-on').siblings().removeClass('mode-on');
        mode = false;
        // TODO: send request "auto-mode"
        sendMsgToCar(mode,box);
    });

    $("#ctrl-mode").click(function() {
        $("#ctrl-mode").addClass('mode-on').siblings().removeClass('mode-on');
        mode = true;
        // TODO: send request "ctrl-mode"
        sendMsgToCar(mode,box);
    });
    
    $("#box-on").click(function() {
        $("#box-on").addClass('mode-on').siblings().removeClass('mode-on');
        box = true;
        // TODO: send request "box-open"
        sendMsgToCar(mode,box);
    });

    $("#box-off").click(function() {
        $("#box-off").addClass('mode-on').siblings().removeClass('mode-on');
        box = false;
        // TODO: send request "box-close"
        sendMsgToCar(mode,box);
    });

}) // jQuery 結束

function carControl(key) {
    console.log(key);
}
