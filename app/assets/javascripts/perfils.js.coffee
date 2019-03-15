jQuery ->


  $('#perfil').dataTable ({
        "iDisplayLength": 10,
        "bPaginate": true,
        "bLengthChange":false,    # campo de mudar quantidade de registros a mostrar
        "ordering":     false,    # não permite ordenação (ver nos demais por onde esta ordenado e adaptar isso
        "aaSorting":    [],
        "oLanguage": {
          "sInfo":              "Mostrando de _START_ até _END_ de _TOTAL_ registros",
          "sInfoFiltered":      "Filtrado de _MAX_ registros no total",
          "sInfoEmpty":         "Sem resultados",
          "sZeroRecords":       "Sem resultados",
          "sSearch":            "Buscar",
          "oPaginate": {
            "sFirst":         "Primeiro",
            "sPrevious":      "Anterior",
            "sNext":          "Próximo",
            "sLast":          "Ultimo"
        }
      }
  });


