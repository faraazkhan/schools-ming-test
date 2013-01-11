class Relationship < ActiveRecord::Base
  attr_accessible :relationship_type, :student_id, :teacher_id
  belongs_to :teacher
  belongs_to :student
  before_create :check_confirmation_requirement

 def self.relationship_types
   %w[HomeRoomTeacher MathTeacher ScienceTeacher]
 end

 def check_confirmation_requirement
   self.confirmed = true if self.teacher.can_confirm?
 end

 def confirm!
   self.confirmed = true
   self.save!
 end
end
