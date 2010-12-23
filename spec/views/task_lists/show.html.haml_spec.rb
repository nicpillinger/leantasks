require 'spec_helper'

describe "task_lists/show.html.haml" do
  before(:each) do
    @task_list = assign(:task_list, Fabricate(:task_list))
  end

  it "renders attributes in <p>" do
    render
    
    rendered.should have_selector("h1", :content => @task_list.name)
    rendered.should have_selector(:table) do |table|
      @task_list.tasks.each do |task|
        table.should have_selector(:tr) do |row|
          row.should have_selector(:td) do |promote_col|
            if task.position == 1
              promote_col.should have_selector(:form, :url => mark_complete_task_list_task_path(@task_list, task)) do |f|
                f.should have_selector(:div)
                f.should have_selector(:input, {:id => "task_submit", :name => "commit", :type => "submit", :value => "done!"}) 
              end
            else
              promote_col.should have_selector(:form, :url => promote_task_list_task_path(@task_list, task)) do |f|
                f.should have_selector(:input, :value => "^") 
              end
            end
          end          
        end
      end
    end
  end
end
