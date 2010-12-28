function toggleSpinner(){
  $("#spinner").toggle();
}

function bindSortableItems(updateTaskPositionsUrl){
  $(".sortable").sortable({
    update: function(event, ui) { 
      $.ajax({
        url: updateTaskPositionsUrl,
        data: $("#task_list").sortable("serialize"),
        type: "post",
        dataType: "script",
        success: function(){
          $("#task_list").effect('highlight');
        }
      });
    }
  });
}
