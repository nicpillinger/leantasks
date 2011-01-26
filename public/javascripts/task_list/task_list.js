function bindAjaxEventsFor(jqueryIdentifier){
  $(jqueryIdentifier).bind("ajax:beforeSend", function() {
    displayUpdatingMsg();
  });
}

function displayUpdatingMsg(){
  $("#notice").html("updating...").show();
}

function displayNotice(noticeMsg){
  $("#notice").html(noticeMsg).fadeIn('slow').delay(2000).fadeOut('slow');
}

function hideNotice(){
  $("#notice").hide();
}

function bindSortableItems(updateTaskPositionsUrl){
  $("#task_list").sortable({
    update: function(event, ui) { 
      $.ajax({
        url: updateTaskPositionsUrl,
        data: $("#task_list").sortable("serialize"),
        type: "post",
        dataType: "script",
        beforeSend: function(){
          displayUpdatingMsg();
        }
      });
    }
  });
}
