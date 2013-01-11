class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.string :relationship_type

      t.timestamps
    end
  end
end
