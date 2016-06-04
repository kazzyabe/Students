class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :gender, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :color, presence: true
  validates :gpa, presence: true
end
