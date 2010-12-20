require 'spec_helper'

describe Task, "a new task object" do
  
  before (:each) do
    @task = Task.new
  end

  context "unsaved task" do
    it "by default should be added to the bottom of tasklist" do
      @task.add_to_top_of_list.should be_false
    end    
  end

  context "saved task" do
    context "by default should be added to the bottom of tasklist" do
      it "should not have a next task" do
        @task.attributes = Factory.attributes_for(:task)
        @task.save!
        @task.next_task.should be_nil
      end
    end
  end

  context "with no name" do
    it "should be invalid" do
      @task.attributes = Factory.attributes_for(:task).except(:name)
      @task.should_not be_valid
    end
  end

  context "with no complexity" do
    it "should be invalid" do
      @task.attributes = Factory.attributes_for(:task).except(:complexity)
      @task.should_not be_valid
    end
  end

  context "with name and complexity" do
    it "should be valid" do
      @task.attributes = Factory.attributes_for(:task)
      @task.should be_valid
    end
  end
    
end
