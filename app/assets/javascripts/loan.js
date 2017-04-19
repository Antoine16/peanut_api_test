
$('#loan_capital').keypress(function(){
  setTimeout(function(){
    $('#tranquilité').empty();
    $('#tranquilité').append(Math.round($('#loan_capital').val() * 1.06, -2));
    $('#sécurité').empty();
    $('#sécurité').append(Math.round($('#loan_capital').val() * 1.03, -2));
    $('#dynamique').empty();
    $('#dynamique').append(Math.round($('#loan_capital').val() * 1.09, -2));
  }, 200);
})
