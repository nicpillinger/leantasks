require 'spec_helper'

describe "tasks/edit.html.haml" do
  before(:each) do
    @task_list = Fabricate.build(:task_list)
    @task = assign(:task, @task_list.tasks[0])
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => task_list_task_path(@task_list, @task), :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_complexity", :name => "task[complexity]"
    end
  end
end
