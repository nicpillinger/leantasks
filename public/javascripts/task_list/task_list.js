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
        beforeSend: function(){
          toggleSpinner();
        },
        complete: function(){
          toggleSpinner();
        },
        success: function(){
          $("#notice").html("reprioritised!");
        }
      });
    }
  });
}
