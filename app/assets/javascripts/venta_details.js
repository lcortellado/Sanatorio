$(document).ready(function(){

    $(document).on("shown.bs.modal", "#new-detail-modal", function() {


    	var insumos_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("descripcion"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/insumos_suggestion',
    	  remote: {
            url: window.location.origin + '/insumos_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#venta_details_insumo').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'descripcion',
    	  source: insumos_suggested,
          templates: {
            suggestion: function (insumo) {
                return '<p>' + insumo.descripcion + '</p>';
            }
          }
    	});

        $('#venta_details_insumo').focus();

    	$('#venta_details_insumo').typeahead('val', $('#venta_details_insumo_descripcion').val() );

    	$('#venta_details_insumo').on('typeahead:select', function(object, datum){
            $('#venta_details_insumo').val(datum.id);
            $('#venta_details_qty').focus();
            subtotal();
        });

        $('#venta_details_insumo').on('typeahead:change', function(event, data){
            $('#venta_details_insumo').val(data);
        });

        $('#venta_details_insumo').on('blur', function() {
        	data = $('#venta_details_insumo').val();
        	url = '/validate_suggested_insumo';
        	$.ajax({
        		url: url,
        		data: { insumo.descripcion: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#sale_details_insumo').css('border-color', 'red');
        			}else{
        				// Item correcto
                        $('#venta_details_insumo_id').val(res["0"].id.toString());
                        $('#venta_details_price').val(res["0"].price.toString());
        				$('#venta_details_insumo').css('border-color', '#ccc');
                        subtotal();
        			}
        		}
        	});
        });

        function subtotal() {
            $('#venta_details_subtotal').val($('#venta_details_qty').val() * $('#venta_details_price').val());
        };

        $('#venta_details_qty').blur(function(){
             subtotal();
        });

        $('#venta_details_price').blur(function(){
             subtotal();
        });

    });
});
jQuery(function() {
  return $('#venta_details_insumo.descripcion').autocomplete({
    source: ['apple', 'apricot', 'avocado']
  });
});