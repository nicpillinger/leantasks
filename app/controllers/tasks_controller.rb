class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    redirect_to(task_list_url(params[:task_list_id]))
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new(:task_list => TaskList.find(params[:task_list_id]))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new({ :attributes => params[:task], :task_list => @task_list })    
    
    respond_to do |format|
      if @task.valid? && @task_list.tasks << @task    
        add_to_top = params[:task][:add_to_top_of_list] == "1" ? true : false
        if add_to_top
          @task.move_to_top
        else
          @task.move_to_bottom
        end
        @task_list.reload
        
        format.html { redirect_to(@task_list, :notice => "task successfully added to the #{add_to_top ? 'top' : 'bottom'} of the list") }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(task_list_path(params[:task_list_id]), :notice => 'task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST
  def promote
    @task = Task.find(params[:id])
    @task_list = TaskList.find(params[:task_list_id])  
    
    respond_to do |format|
      @task.move_higher
      @task_list.save
      @task_list.reload
      @notice = "task promoted!"
      format.js { render "promote_demote" }
    end
  end

  # POST
  def demote
    @task = Task.find(params[:id])
    @task_list = TaskList.find(params[:task_list_id])  
    
    respond_to do |format|
      @task.move_lower
      @task_list.save
      @task_list.reload
      @notice = "task demoted!"
      format.js { render "promote_demote" }
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(task_list_url(params[:task_list_id])) }
      format.xml  { head :ok }
    end
  end
end
