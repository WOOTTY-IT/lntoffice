'use strict';
$(document).ready(function() {
    $(function(){
        $('#auth-signin').validate({
            rules: {
                'validation-username': {
                    required: true
                },
                'validation-password': {
                    required: true
                }
            },

            submitHandler: function (form) {
                    console.log('submitHandler');
                    
                $.ajax({
                    url : form.action,
                    type: form.method,
                    // data: $(from).serialize(),
                    data: { username:"woodies", password: "pass1234" },
                    success: function (response) {
                            
                        setTimeout(function () {
                            console.log(response);
                        },2000);
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
