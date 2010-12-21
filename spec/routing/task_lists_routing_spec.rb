require "spec_helper"

describe TaskListsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/task_lists" }.should route_to(:controller => "task_lists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/task_lists/new" }.should route_to(:controller => "task_lists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/task_lists/1" }.should route_to(:controller => "task_lists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/task_lists/1/edit" }.should route_to(:controller => "task_lists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/task_lists" }.should route_to(:controller => "task_lists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/task_lists/1" }.should route_to(:controller => "task_lists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/task_lists/1" }.should route_to(:controller => "task_lists", :action => "destroy", :id => "1")
    end

  end
end
