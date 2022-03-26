'use strict';
$(document).ready(function() {
    // just for the demos, avoids form submit
/*    jQuery.validator.setDefaults({
      debug: true,
      success: "valid"
    });*/
    $(function() {
        // [ Initialize validation ]
        $('#validation-form123').validate({
            ignore: '.ignore, .select2-input',
            focusInvalid: true,
            rules: {
                'validation-cid': {
                    required: true,
                    minlength: 13,
                    maxlength: 13
                },
                'validation-username': {
                    required: true
                },
                'validation-password': {
                    required: true,
                    minlength: 6,
                    maxlength: 256,
                    // equalTo : 'input[name="validation-password-confirmation"]'
                },
                'validation-password-confirmation': {
                    required: true,
                    minlength: 6,
                    equalTo: 'input[name="validation-password"]'
                },
            },

            submitHandler: function() { 
                let $username = 'input[name="validation-username"]';
                let $password = 'input[name="validation-password"]';
                let $dataString = "username:" + $username + "&password:" + $password;
                $.ajax({
                    type: "POST",
                    url: './assets/includes/auth-signup.php',
                    data: $dataString,
                    success: function(response){
                        if(response=="ok"){
                        console.log(response);
                        setTimeout(' window.location.href = "./auth-signin.html"; ',4000);
                        }
                    },
                    fail: function () {
                        console.log('ajax fail');
                    }
                });
            },

            // Errors //

            errorPlacement: function errorPlacement(error, element) {
                var $parent = $(element).parents('.form-group');

                // Do not duplicate errors
                if ($parent.find('.jquery-validation-error').length) {
                    return;
                }

                $parent.append(
                    error.addClass('jquery-validation-error small form-text invalid-feedback')
                );
            },
            highlight: function(element) {
                var $el = $(element);
                var $parent = $el.parents('.form-group');

                $el.addClass('is-invalid');

                // Select2 and Tagsinput
                if ($el.hasClass('select2-hidden-accessible') || $el.attr('data-role') === 'tagsinput') {
                    $el.parent().addClass('is-invalid');
                }
            },
            unhighlight: function(element) {
                $(element).parents('.form-group').find('.is-invalid').removeClass('is-invalid');
            }
        });
    });
});
