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

    	$('#sale_details_insumo').typeahead({
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

        $('#sale_details_insumo').focus();

    	$('#sale_details_insumo').typeahead('val', $('#sale_details_insumo_descripcion').val() );

    	$('#sale_details_insumo').on('typeahead:select', function(object, datum){
            $('#sale_details_insumo').val(datum.id);
            $('#sale_details_qty').focus();
            subtotal();
        });

        $('#sale_details_insumo').on('typeahead:change', function(event, data){
            $('#sale_details_insumo').val(data);
        });

        $('#sale_details_insumo').on('blur', function() {
        	data = $('#sale_details_insumo').val();
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
                        $('#sale_details_insumo_id').val(res["0"].id.toString());
                        $('#sale_details_price').val(res["0"].price.toString());
        				$('#sale_details_insumo').css('border-color', '#ccc');
                        subtotal();
        			}
        		}
        	});
        });

        function subtotal() {
            $('#sale_details_subtotal').val($('#sale_details_qty').val() * $('#sale_details_price').val());
        };

        $('#sale_details_qty').blur(function(){
             subtotal();
        });

        $('#sale_details_price').blur(function(){
             subtotal();
        });

    });
});
jQuery(function() {
  return $('#sale_details_insumo.descripcion').autocomplete({
    source: ['apple', 'apricot', 'avocado']
  });
});