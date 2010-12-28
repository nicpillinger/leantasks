module TaskListsHelper
  def prioritisation_links(task)
    promote_link = build_prioritisation_link("up", promote_task_list_task_path(task.task_list, task), "promote_task_#{task.id}")
    demote_link = build_prioritisation_link("down", demote_task_list_task_path(task.task_list, task), "demote_task_#{task.id}")
    promote_link + " " +  demote_link
  end
  
  private
  
  def build_prioritisation_link(link_text, link_url, link_id)
    link_to(link_text, link_url, :method => :post, :remote => true, :id => link_id, :class => 'prioritisation_link') 
  end
  
end
