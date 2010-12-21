require 'spec_helper'

describe "task_lists/show.html.haml" do
  before(:each) do
    @task_list = assign(:task_list, stub_model(TaskList,
      :name => "Name",
      :tasks => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
