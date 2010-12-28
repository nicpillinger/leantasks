require 'spec_helper'

describe "task_lists/show.html.haml" do
  before(:each) do
    @task_list = assign(:task_list, Fabricate(:task_list))
  end

  it "renders attributes in <p>" do
    render    
    rendered.should have_selector(:h1, :content => @task_list.name)
    rendered.should have_selector(:div) do |listdiv|
      rendered.should have_selector(:ul, :class => "sortable") do |list|
        @task_list.tasks.each do |task|
          list.should have_selector(:li) do |listitem|
            listitem.should have_selector(:a, :href => task_list_task_path(@task_list, task))
            listitem.should have_selector(:a, :id => "promote_task_#{task.id}", :href => promote_task_list_task_path(@task_list, task))
            listitem.should have_selector(:a, :id => "demote_task_#{task.id}", :href => demote_task_list_task_path(@task_list, task))
          end
        end
      end
    end
    rendered.should have_selector(:a, :href => new_task_list_task_path(@task_list))
  end
end
