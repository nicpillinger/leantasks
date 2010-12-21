require 'spec_helper'

describe TaskListsController do

  def mock_task_list(stubs={})
    (@mock_task_list ||= mock_model(TaskList).as_null_object).tap do |task_list|
      task_list.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all task_lists as @task_lists" do
      TaskList.stub(:all) { [mock_task_list] }
      get :index
      assigns(:task_lists).should eq([mock_task_list])
    end
  end

  describe "GET show" do
    it "assigns the requested task_list as @task_list" do
      TaskList.stub(:find).with("37") { mock_task_list }
      get :show, :id => "37"
      assigns(:task_list).should be(mock_task_list)
    end
  end

  describe "GET new" do
    it "assigns a new task_list as @task_list" do
      TaskList.stub(:new) { mock_task_list }
      get :new
      assigns(:task_list).should be(mock_task_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested task_list as @task_list" do
      TaskList.stub(:find).with("37") { mock_task_list }
      get :edit, :id => "37"
      assigns(:task_list).should be(mock_task_list)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created task_list as @task_list" do
        TaskList.stub(:new).with({'these' => 'params'}) { mock_task_list(:save => true) }
        post :create, :task_list => {'these' => 'params'}
        assigns(:task_list).should be(mock_task_list)
      end

      it "redirects to the created task_list" do
        TaskList.stub(:new) { mock_task_list(:save => true) }
        post :create, :task_list => {}
        response.should redirect_to(task_list_url(mock_task_list))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task_list as @task_list" do
        TaskList.stub(:new).with({'these' => 'params'}) { mock_task_list(:save => false) }
        post :create, :task_list => {'these' => 'params'}
        assigns(:task_list).should be(mock_task_list)
      end

      it "re-renders the 'new' template" do
        TaskList.stub(:new) { mock_task_list(:save => false) }
        post :create, :task_list => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested task_list" do
        TaskList.should_receive(:find).with("37") { mock_task_list }
        mock_task_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :task_list => {'these' => 'params'}
      end

      it "assigns the requested task_list as @task_list" do
        TaskList.stub(:find) { mock_task_list(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:task_list).should be(mock_task_list)
      end

      it "redirects to the task_list" do
        TaskList.stub(:find) { mock_task_list(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(task_list_url(mock_task_list))
      end
    end

    describe "with invalid params" do
      it "assigns the task_list as @task_list" do
        TaskList.stub(:find) { mock_task_list(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:task_list).should be(mock_task_list)
      end

      it "re-renders the 'edit' template" do
        TaskList.stub(:find) { mock_task_list(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested task_list" do
      TaskList.should_receive(:find).with("37") { mock_task_list }
      mock_task_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the task_lists list" do
      TaskList.stub(:find) { mock_task_list }
      delete :destroy, :id => "1"
      response.should redirect_to(task_lists_url)
    end
  end

end
