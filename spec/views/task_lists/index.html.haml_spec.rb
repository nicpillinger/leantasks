require 'spec_helper'

describe "task_lists/index.html.haml" do
  before(:each) do
    assign(:task_lists, [Fabricate(:task_list), Fabricate(:task_list)])
  end

  it "renders a list of task_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "fab task list".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "10".to_s, :count => 2
  end
end
