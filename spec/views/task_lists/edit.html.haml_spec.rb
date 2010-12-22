require 'spec_helper'

describe "task_lists/edit.html.haml" do
  before(:each) do
    @task_list = assign(:task_list, Fabricate(:task_list))
  end

  it "renders the edit task_list form" do
    render

    assert_select "form", :action => task_list_path(@task_list), :method => "post" do
      assert_select "input#task_list_name", :name => "task_list[name]"
    end
  end
end
