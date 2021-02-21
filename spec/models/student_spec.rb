require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  before :each do
    @student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    @student_2 = Student.create!(name: "AJ Dorion", age: 44, house: "Ravenclaw")
    @studen_3 = Student.create!(name: 'Harry Potter', age: 17, house: 'Gryfindor')
    # @students = [@student_1, @student_2]
    @course_1 = Course.create!(name: "Defense against the Dark Arts")
    @course_2 = Course.create!(name: "Herbology")
    @course_3 = Course.create!(name: "Potions")
    # @courses = [@course_1, @course_2, @course_3]
    @student_course_1 = StudentCourse.create!(course_id: @course_1.id, student_id: @student_1.id)
    @student_course_2 = StudentCourse.create!(course_id: @course_2.id, student_id: @student_1.id)
    @student_course_3 = StudentCourse.create!(course_id: @course_3.id, student_id: @student_1.id)
    @student_course_4 = StudentCourse.create!(course_id: @course_1.id, student_id: @student_2.id)
  end

  describe 'methods' do
    it 'counts number of students' do
      expect(Student.student_count).to eq(3)
    end

    it 'averages all students age' do
      expect(Student.average_age).to eq(25)
    end
  end
end
