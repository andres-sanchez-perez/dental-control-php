$(document).ready(function(){
    $('#abonoPaciente').on('input',function(){
        if($(this).val()==''){
            $('#SaldoRestante').val(parseFloat($('#Saldo').val())-0);
            return;
        }
        $('#SaldoRestante').val(parseFloat($('#Saldo').val())-parseFloat($('#abonoPaciente').val()));
        return;
    });
   
    $('#SaldoRestante').val(parseFloat($('#Saldo').val())-0);
    $('#decimales').on('input', function () {
        this.value = this.value.replace(/[^0-9,.]/g, '').replace(/,/g, '.');
      });
      $('#abonoPacientes').on('input', function () {
        this.value = this.value.replace(/[^0-9,.]/g, '').replace(/,/g, '.');
      });

    $(".CirPrevia").click(function(evento){
          
        var valor = $(this).val();
      
        if(valor == 'Si'){
            $("#CirujiasPrevias").css("display", "block");
        }else{
            $("#CirujiasPrevias").css("display", "none");
        }
    });

    $('#ComboConBusqueda').select2();
    
    if($('input[name="Cirujia"]:checked').val()=="No"){
        $("#CirujiasPrevias").css("display", "none");
    }
    

    $('#ComboProductos').select2();
    $('#ComboProductos').change(function(){
        var base_url = window.location.origin;
        $.ajax({
            type:'get',
            url: base_url+"/Inventarios/getSingleProduct",
            dataType: 'json',
            data:{id:$(this).val()},
            complete:function(){},
            success: function(data){
                $('#Tipo').val(data.inventario[0].Tipo);
                $('#CantidadActual').val(data.inventario[0].CantidadActual);
                $('#CantidadMaxima').val(data.inventario[0].CantidadMaxima);
                $('#CantidadMinima').val(data.inventario[0].CantidadMinima);
                
            },
            error: function(){
                alert("Esto es un error");
            }
        })
        
        
    });
   
});