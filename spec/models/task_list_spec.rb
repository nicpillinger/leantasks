require 'spec_helper'

describe TaskList do
  
  before (:each) do
    @task_list = TaskList.new
  end
  
  context "creating a task list" do
    it "is invalid without a name" do         
      @task_list.attributes = Fabricate.attributes_for(:task_list).except(:name)
      @task_list.should_not be_valid
    end
  end
  
  context "creating a task list" do 
    it "is valid with a name and empty list of tasks" do
      @task_list.attributes = Fabricate.attributes_for(:task_list)
      @task_list.should be_valid      
    end
  end  
   
end
