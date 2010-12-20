class Task < ActiveRecord::Base
  attr_accessor :add_to_top_of_list
  has_one :next_task, :class_name => "Task"
  
  after_create :update_list_pointers
  
  validates_presence_of :name, :message => 'is required'
  validates_presence_of :complexity, :message => 'is required'    
  
  private
  
    def update_list_pointers
      if @add_to_top_of_list
        self.next_task = Task.first
      else
        tail = Task.last
        tail.next_task = self
      end
    end
end
