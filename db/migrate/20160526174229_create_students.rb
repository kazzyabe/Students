class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.decimal :weight
      t.decimal :height
      t.string :color
      t.decimal :gpa

      t.timestamps null: false
    end
  end
end
