class AddTeacherTypeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :teacher_type, :string
  end
end
