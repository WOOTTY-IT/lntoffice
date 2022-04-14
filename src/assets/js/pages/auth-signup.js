'use strict';
$(document).ready(function() {
    // just for the demos, avoids form submit
/*    jQuery.validator.setDefaults({
      debug: true,
      success: "valid"
    });*/
    $(function() {
        // [ Initialize validation ]
        $('#auth-signup-form').validate({
            ignore: '.ignore, .select2-input',
            focusInvalid: true,
            rules: {
                'cid': {
                    required: true,
                    minlength: 13,
                    maxlength: 13
                },
                'username': {
                    required: true
                },
                'password': {
                    required: true,
                    minlength: 6,
                    maxlength: 256,
                },
                'password-confirm': {
                    required: true,
                    minlength: 6,
                    equalTo: 'input[name="password"]'
                },
            },

            submitHandler: function(form) { 
                $.ajax({
                    url : "./assets/includes/auth-signup.php",
                    type: "POST",
                    data: $(form).serialize(),
                    dataType: 'json',
                    beforeSend: function ( request , PlainObject ) {
                        console.log(PlainObject.data);
                    },
                    success: function(response, textStatus, jqXHR) {
                        console.log('ajax success: ' , response );
                        if (response.isRegistered) {
                            $('#ModalAuth-Signup').find('.modal-body h5').text('ลงทะเบียนสำเร็จ');
                            $('#ModalAuth-Signup').modal({backdrop:false, keyboard:true});
                            $('#ModalAuth-Signup').on('hidden.bs.modal', function (event) {
                                window.location.href = response.redirect_path;
                            });
                        }else{

                            if (response.status == 'fail') {
                                $('#ModalAuth-Signup').find('.modal-body h5').text('ลงทะเบียนล้มเหลว');
                                $('#ModalAuth-Signup').modal({backdrop:false, keyboard:true});
                            }else if (response.status == 'duplicate') {
                                $('#ModalAuth-Signup').find('.modal-body h5').text('มีผู้ลงทะเบียนแล้ว');
                                $('#ModalAuth-Signup').modal({backdrop:false, keyboard:true});
                            }

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
        });
    });
});
