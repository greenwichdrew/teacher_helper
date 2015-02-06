class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :date
      t.string :subject
      t.string :assignment
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
