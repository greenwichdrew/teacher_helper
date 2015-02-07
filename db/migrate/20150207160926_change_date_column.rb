class ChangeDateColumn < ActiveRecord::Migration
  def change
    remove_column :grades, :date
    add_column :grades, :date, :date
  end
end
