'use strict';
$(document).ready(function () {
    /*var $button = $('#btn-signin');
    $button.click(function () {
        console.log("button clicked.");
    });*/

    /*$('#auth-signin-form').submit(function( event ) {
      alert( "Handler for .submit() called." );
      event.preventDefault();
    });*/

    $('#auth-signin-form').validate({
        rules: {
            'username': {
                required: true
            },
            'password': {
                required: true
            }
        },
        messages: {
            'username': {
                required: "ป้อนยูสเซอร์เนม"
            },
            'password': {
                required: "ป้อนรหัสผ่าน"
            }
        },
        submitHandler: function (form) {
            /*Deprecation Notice: The jqXHR.success(), jqXHR.error(), and jqXHR.complete() callbacks are removed as of jQuery 3.0. 
            You can use jqXHR.done(), jqXHR.fail(), and jqXHR.always() instead.*/
            /*No onreadystatechange mechanism is provided, however, since done, fail, always, and statusCode cover all conceivable requirements.*/
            /*jqXHR.done(function( data, textStatus, jqXHR ) {});
            An alternative construct to the success callback option, refer to deferred.done() for implementation details.

            jqXHR.fail(function( jqXHR, textStatus, errorThrown ) {});
            An alternative construct to the error callback option, the .fail() method replaces the deprecated .error() method. Refer to deferred.fail() for implementation details.

            jqXHR.always(function( data|jqXHR, textStatus, jqXHR|errorThrown ) { }); (added in jQuery 1.6)
            An alternative construct to the complete callback option, the .always() method replaces the deprecated .complete() method.

            In response to a successful request, the function's arguments are the same as those of .done(): data, textStatus, and the jqXHR object. For failed requests the arguments are the same as those of .fail(): the jqXHR object, textStatus, and errorThrown. Refer to deferred.always() for implementation details.

            jqXHR.then(function( data, textStatus, jqXHR ) {}, function( jqXHR, textStatus, errorThrown ) {});
            Incorporates the functionality of the .done() and .fail() methods, allowing (as of jQuery 1.8) the underlying Promise to be manipulated. Refer to deferred.then() for implementation details.*/

            // console.log('form submitHandler');
            $.ajax({
                url : "./php/auth-signin.php",
                type: "POST",
                data: $(form).serialize(),
                dataType: 'json',
                beforeSend: function ( request , PlainObject ) {
                    // console.log('ajax beforeSend: sending..');
                    console.log(PlainObject.data);
                },
                success: function(response, textStatus, jqXHR) {
                    // var obj = jQuery.parseJSON( response );
                    console.log('ajax success: ' , response );
                    if (response.isLogin) {
                        /*$('#ModalAuth-Signin').find('.modal-body h5').text('ล็อกอินสำเร็จ');
                        $('#ModalAuth-Signin').modal({backdrop:false, keyboard:true});
                        $('#ModalAuth-Signin').on('hidden.bs.modal', function (event) {
                            window.location.href = response.redirect_path;
                        });*/
                            window.location.href = response.redirect_path;
                    }else{
                        $('#ModalAuth-Signin').find('.modal-body h5').text('ยูเซอร์เนมหรือรหัสผ่านไม่ถูกต้อง');
                        $('#ModalAuth-Signin').modal({backdrop:false, keyboard:true});
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('ajax error: ' + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    console.log('ajax complete: ' + jqXHR);
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

    })

});
