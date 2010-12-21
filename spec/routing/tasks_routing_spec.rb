require "spec_helper"

describe TasksController do
  describe "routing for nested resource" do

    it "recognizes and generates #index" do
      { :get => "/task_lists/1/tasks" }.should route_to(:controller => "tasks", :action => "index", :task_list_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "/task_lists/1/tasks/new" }.should route_to(:controller => "tasks", :action => "new", :task_list_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "/task_lists/1/tasks/1" }.should route_to(:controller => "tasks", :action => "show", :id => "1", :task_list_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/task_lists/1/tasks/1/edit" }.should route_to(:controller => "tasks", :action => "edit", :id => "1", :task_list_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/task_lists/1/tasks" }.should route_to(:controller => "tasks", :action => "create", :task_list_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/task_lists/1/tasks/1" }.should route_to(:controller => "tasks", :action => "update", :id => "1", :task_list_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/task_lists/1/tasks/1" }.should route_to(:controller => "tasks", :action => "destroy", :id => "1", :task_list_id => "1")
    end

  end
end
