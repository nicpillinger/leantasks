module TaskListsHelper
  def prioritisation_link(task, promote)
    link_text = promote ? "up" : "down"
    link_url = promote ? promote_task_list_task_path(task.task_list, task) : demote_task_list_task_path(task.task_list, task)
    link_id = (promote ? "promote_" : "demote_") + "task_#{task.id}"
    link_to(link_text, link_url, :method => :post, :remote => true, :id => link_id, :class => 'prioritisation_link') 
  end
end
