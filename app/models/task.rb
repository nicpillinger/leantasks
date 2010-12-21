class Task < ActiveRecord::Base
  attr_accessor :add_to_top_of_list 
  
  belongs_to :task_list
  acts_as_list :scope => :task_list
  
  validates_presence_of :task_list, :message => 'is required'  
  validates_presence_of :name, :message => 'is required'
  validates_presence_of :complexity, :message => 'is required'    

  after_create :insert_in_correct_position
    
  private
  
  def insert_in_correct_position
    if @add_to_top_of_list 
      move_to_top 
    else 
      move_to_bottom
    end
  end

end
