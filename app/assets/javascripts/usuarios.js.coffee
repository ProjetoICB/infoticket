jQuery ->

  $('#usuarios').dataTable({

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



