$(document).ready(function(){
    $('#abonoPaciente').change(function(){
        if($('#abonoPaciente').val==''){
            $('#SaldoRestante').val($('#Saldo').val-0);
            return;
        }
        $('#SaldoRestante').val($('#Saldo').val-$('#abonoPaciente').val);
        return;
    });
    $('#decimales').on('input', function () {
        this.value = this.value.replace(/[^0-9,.]/g, '').replace(/,/g, '.');
      });

    $(".CirPrevia").click(function(evento){
          
        var valor = $(this).val();
      
        if(valor == 'Si'){
            $("#CirujiasPrevias").css("display", "block");
        }else{
            $("#CirujiasPrevias").css("display", "none");
    }

    $(function() {
        $('.selectpicker').selectpicker();
      });
   

    });
    if($('input[name="Cirujia"]:checked').val()=="No"){
        $("#CirujiasPrevias").css("display", "none");
    }
    
});