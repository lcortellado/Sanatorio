function subtotal() {
            $('#sale_details_subtotal').val($('#sale_details_qty').val() * $('#sale_details_price').val());
        };

        $('#sale_details_qty').blur(function(){
             subtotal();
        });

        $('#sale_details_price').blur(function(){
             subtotal();
        });

   