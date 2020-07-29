$(document).ready(function(){
    
    (function($) {
        "use strict";
        
        var value = $("#password_reg").val();

        $.validator.addMethod("checklower", function(value) {
          return /[a-z]/.test(value);
        });

        $.validator.addMethod("checkdigit", function(value) {
          return /[0-9]/.test(value);
        });

        
        $(function(){
            $('#registerForm').validate({

           onkeyup: function(element, event) {
             //去除左側空白
             var value = this.elementValue(element).replace(/^\s+/g, "");
             $(element).val(value);
            },
            rules: {
              name: {
                required: true
              },
              phone:{
                required: true,
                minlength: 10,
                number: true
              },
              email: {
                required: true,
                email: true
              },
              password: {
                  required: true,
                  minlength: 5,
                  checklower: true,
                  checkdigit: true
              },
              password_confirm: {
                  required: true,
                  minlength: 5,
                  equalTo: "#cusPwd"
              },
                	
            },
            messages: {
              name: {
                required:'必填'
              },
              phone: {
                required:'必填',
                minlength:'不得少於10位',
                number:'電話需為數字'
              },
              email: {
                  required:'必填',
                  email:'Email格式不正確'
              },
              password: {
                    required: '必填',
                    minlength:'不得少於5位',
                    checklower: '必須包含英文字母',
                    checkdigit: '必須包含數字'
              },
              password_confirm: {
                    required: '必填',
                    minlength: '不得少於5位',
                    equalTo: "必須與密碼相同",
              },
            },
            submitHandler: function(form) {
            form.submit();
            }
      });

    });

    
        
 })(jQuery)
})