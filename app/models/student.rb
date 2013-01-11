class Student < ActiveRecord::Base
  attr_accessible :born_at, :name, :confirm_student
  attr_accessor :confirm_student
  has_many :teachers, :through => :relationships
  has_many :relationships
  belongs_to :home_room, :foreign_key => :homeroom_number

  def is_not_confirmed?
    !self.relationships.first.confirmed?
  end
end
