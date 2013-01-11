class AddHomeRoomNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :homeroom_number, :integer
  end
end
