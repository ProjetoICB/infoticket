# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $('#chamados').dataTable({

    "aaSorting": [],
    "bPaginate": true,
    "bLengthChange":false,
    "ordering":     false,
    "iDisplayLength": 10,
    "oLanguage": {
      "sProcessing":   "Processando...",
      "sLengthMenu":   "Mostrar _MENU_ registros",
      "sZeroRecords":  "Sem resultados",
      "sInfo":         "Mostrando de _START_ ate _END_ de _TOTAL_ registros",
      "sInfoEmpty":    "Sem resultados",
      "sInfoFiltered": "(filtrado de _MAX_ registros no total)",
      "sInfoPostFix":  "",
      "sSearch":       "Buscar:",
      "sUrl":          "",
      "oPaginate": {
        "sFirst":    "Primeiro",
        "sPrevious": "Anterior",
        "sNext":     "Seguinte",
        "sLast":     "Ultimo"
      }
    }
  });




$('.label-with-popover').popover(placement: 'right')



