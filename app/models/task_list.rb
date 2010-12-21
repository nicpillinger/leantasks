class TaskList < ActiveRecord::Base
  has_many :tasks, :order => "position"

  validates_presence_of :name, :message => 'is required'
end
