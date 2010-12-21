require 'spec_helper'

describe TaskList do
  
  before (:each) do
    @task_list = Fabricate(:task_list)
    @task = Fabricate.build(:task)
  end
  
  describe "adding a task" do
    it "should default to being added to the bottom of tasklist" do      
      @task_list.tasks << @task
      @task.first?.should be_false
      @task.last?.should be_true
    end

    it "if requested should add to the top of the tasklist" do
      @task.add_to_top_of_list = true
      @task_list.tasks << task
      @task.first?.should be_true
      @task.last?.should be_false
    end

  end   
end
