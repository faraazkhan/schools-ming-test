class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :teacher_type
  attr_accessible :name

  validates_uniqueness_of :email
  

  has_many :students, :through => :relationships
  has_many :relationships
  has_many :home_rooms

  #method to be called by the js on the sign up form
  #
  def self.check_email(email)
    #teacher_exists? if Teacher.find_by_email(email) is true else return error
  end

  def self.teacher_types
    %w[Math Science HomeRoom]
  end

  def can_confirm?
    self.teacher_type == 'HomeRoom'
  end



  # Student has many teachers through relationships
  # Teacher has many students through relationships
  # Teachers can add students
  # Teachers can manage students if relationship_type = 'HomeRoom Teacher'
  # Any relationship created by a Non HomeRoom teacher must be approved by the HomeRoom Teacher
end
