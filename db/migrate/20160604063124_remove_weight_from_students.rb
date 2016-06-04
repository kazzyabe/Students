class RemoveWeightFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :weight, :integer
    remove_column :students, :height, :integer
  end
end
