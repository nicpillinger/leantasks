require 'spec_helper'

describe "tasks/show.html.haml" do
  before(:each) do
    @task_list = Fabricate.build(:task_list)
    @task = assign(:task, @task_list.tasks[0])
  end

  it "renders attributes in <p>" do
    render

    rendered.should contain(@task.name.to_s)
    rendered.should contain(@task.complexity.to_s)    
    rendered.should have_selector("a", :href => task_list_task_path(@task_list, @task))    
  end
end
