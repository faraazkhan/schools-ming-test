class CreateHomeRooms < ActiveRecord::Migration
  def change
    create_table :home_rooms do |t|
      t.integer :teacher_id
      t.integer :homeroom_number

      t.timestamps
    end
  end
end
