require 'spec_helper'

describe TasksController do

  def mock_task(stubs={})
    (@mock_task ||= mock_model(Task).as_null_object).tap do |task|
      task.stub(stubs) unless stubs.empty?
    end
  end

  def mock_tasklist(stubs={})
    (@mock_task_list ||= mock_model(TaskList).as_null_object).tap do |task_list|
      task_list.stub(stubs) unless stubs.empty?
    end
  end

  def task_params
    {'name' => 't1', 'complexity' => '1'}
  end
  
  def add_to_top_params
    task_params[:add_to_top_of_list] = '1'
    task_params
  end
  
  def add_to_bottom_params
    task_params[:add_to_top_of_list] = '0'
    task_params
  end

  describe "GET index" do
    it "should redirect to task_list/:task_list_id" do
      get :index, :task_list_id => 1      
      response.should redirect_to(task_list_path(1))
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      Task.stub(:find).with("37") { mock_task }
      get :show, :id => "37", :task_list_id => "1"
      assigns(:task).should be(mock_task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      TaskList.stub(:find).with("1").and_return(mock_tasklist)
      Task.stub(:new).with(:task_list => mock_tasklist) { mock_task }
      get :new, :task_list_id => "1"
      assigns(:task).should be(mock_task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      Task.stub(:find).with("37") { mock_task }
      get :edit, :id => "37", :task_list_id => "1"
      assigns(:task).should be(mock_task)
    end
  end

  describe "POST create" do

    describe "with valid params for adding to end of list" do
      it "adds to tasklist and moves to bottom, redirects to tasklist" do        
          verify_add_to_list_gives(add_to_bottom_params)
        end
    end
      
    describe "with valid params for adding to top of list" do
      it "adds to tasklist and moves to top, redirects to tasklist" do
          verify_add_to_list_gives(add_to_top_params)  
        end
    end
  
    def verify_add_to_list_gives(task_params)
      
      move_call = task_params[:add_to_top_of_list] == "1" ? :move_to_top : :move_to_bottom
      mock_t = mock_task(:valid? => true)     
      mock_t.should_receive(move_call)        
        
      TaskList.stub(:find).and_return(mock_tasklist({
        :tasks => [], :reload => true}))
      Task.stub(:new).with({:attributes =>  add_to_bottom_params, 
        :task_list => mock_tasklist}).and_return(mock_t)

      post :create, :task_list_id => "1", :task => add_to_bottom_params
        
      mock_tasklist.tasks.should include(mock_t)
      response.should redirect_to(task_list_url(mock_tasklist))
      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task, renders new view" do
        TaskList.stub(:find).and_return(mock_tasklist(:tasks => []))
        Task.stub(:new).with({
          :attributes => {'these' => 'params'}, 
          :task_list => mock_tasklist}) { mock_task(:valid? => false) }
        post :create, :task_list_id => "1", :task => {'these' => 'params'}
        assigns(:task).should be(mock_task)
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested task" do
        Task.should_receive(:find).with("37") { mock_task }
        mock_task.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :task_list_id => "1", :id => "37", :task => {'these' => 'params'}
      end

      it "assigns the requested task as @task" do
        Task.stub(:find) { mock_task(:update_attributes => true) }
        put :update, :task_list_id => "1", :id => "1"
        assigns(:task).should be(mock_task)
      end

      it "redirects to the task" do
        Task.stub(:find) { mock_task(:update_attributes => true) }
        put :update, :id => "1", :task_list_id => "1" 
        response.should redirect_to(task_list_path(1))
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        Task.stub(:find) { mock_task(:update_attributes => false) }
        put :update, :id => "1", :task_list_id => "1"
        assigns(:task).should be(mock_task)
      end

      it "re-renders the 'edit' template" do
        Task.stub(:find) { mock_task(:update_attributes => false) }
        put :update, :id => "1", :task_list_id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      Task.should_receive(:find).with("37") { mock_task }
      mock_task.should_receive(:destroy)
      delete :destroy, :id => "37", :task_list_id => "1"
    end

    it "redirects to the tasks list" do
      Task.stub(:find) { mock_task }
      delete :destroy, :id => "1", :task_list_id => "1"
      response.should redirect_to(task_list_path(1))
    end
  end

end
