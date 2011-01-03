module TaskListsHelper
  def prioritisation_links(task)
    if (!task.first?)
      promote_link = build_prioritisation_link("up", 
        promote_task_list_task_path(task.task_list, task), 
        "promote_task_#{task.id}", image_tag("green-up.png", :size => "32x32", :alt => "Promote task"))
    end
    if (!task.last?)
      demote_link = build_prioritisation_link("down", 
        demote_task_list_task_path(task.task_list, task), 
        "demote_task_#{task.id}", image_tag("green-down.png", :size => "32x32", :alt => "Demote task"))
    end
    
    content_tag(:span) do 
      task.first? ? demote_link : task.last? ? promote_link : promote_link + demote_link
    end
  end
  
  private
  
  def build_prioritisation_link(link_text, link_url, link_id, image)
    link_to(image, link_url, :method => :post, :remote => true, :id => link_id, :class => 'prioritisation_link') 
  end
  
end
