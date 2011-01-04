class TaskList < ActiveRecord::Base
  has_many :tasks, :order => "position"
  belongs_to :user
  
  validates_presence_of :name, :message => 'is required'
end
