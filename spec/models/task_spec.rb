require 'spec_helper'

describe Task, "a new task object" do
  
  before (:each) do
    @task = Task.new
  end

  context "with no name" do
    it "should be invalid" do
      @task.attributes = Fabricate.attributes_for(:task).except(:name)
      @task.should_not be_valid
    end
  end

  context "with no complexity" do
    it "should be invalid" do
      @task.attributes = Fabricate.attributes_for(:task).except(:complexity)
      @task.should_not be_valid
    end
  end

  context "with no task list" do
    it "should be invalid" do
      @task.attributes = Fabricate.attributes_for(:task).except(:task_list)
      @task.should_not be_valid
    end
  end

  context "with name, complexity and task list" do
    it "should be valid" do
      @task.attributes = Fabricate.attributes_for(:task, :task_list => Fabricate(:task_list))
      @task.should be_valid
    end
  end
    
end
