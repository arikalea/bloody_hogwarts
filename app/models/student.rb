class Student < ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.student_count
   count
  end

  def self.average_age
    average(:age)
  end
end
