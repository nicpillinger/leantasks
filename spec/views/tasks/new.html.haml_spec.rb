require 'spec_helper'

describe "tasks/new.html.haml" do
  before(:each) do
    @task_list = Fabricate.build(:task_list)
    @task = assign(:task, @task_list.tasks[0])
  end

  it "renders new task form" do
    render

    assert_select "form", :action => task_list_tasks_path(@task_list), :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_complexity", :name => "task[complexity]"
      assert_select "input#task_add_to_top_of_list", :name => "task[add_to_top_of_list]"
    end
  end
end
