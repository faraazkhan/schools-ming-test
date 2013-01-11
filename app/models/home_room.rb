class HomeRoom < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  attr_accessible :teacher_id, :homeroom_number
  # attr_accessible :title, :body
end
