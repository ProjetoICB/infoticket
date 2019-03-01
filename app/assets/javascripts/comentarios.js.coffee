# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#comentarios').dataTable({
            "bPaginate": true,
            "iDisplayLength": 10,
            "aaSorting": [],
 		"oLanguage": {
                "sProcessing":   "Processando...",
                "sLengthMenu":   "Mostrar _MENU_ registros",
                "sZeroRecords":  "Sem resultados",
                "sInfo":         "Mostrando de _START_ ate _END_ de _TOTAL_ registros",
                "sInfoEmpty":    "Mostrando de 0 ate 0 de 0 registros",
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
