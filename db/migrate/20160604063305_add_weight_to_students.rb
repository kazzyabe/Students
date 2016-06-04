class AddWeightToStudents < ActiveRecord::Migration
  def change
    add_column :students, :weight, :decimal
    add_column :students, :height, :decimal
  end
end
