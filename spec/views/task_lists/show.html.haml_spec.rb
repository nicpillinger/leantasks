require 'spec_helper'

describe "task_lists/show.html.haml" do
  before(:each) do
    @task_list = assign(:task_list, Fabricate(:task_list))
  end

  it "renders attributes in <p>" do
    render
  end
end
