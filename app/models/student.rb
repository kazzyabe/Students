class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :gpa, presence: true
end
