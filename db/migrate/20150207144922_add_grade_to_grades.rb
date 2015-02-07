class AddGradeToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :letter, :string
    # change_column :grades, :date, :date
  end
end
