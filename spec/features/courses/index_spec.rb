require 'rails_helper'

RSpec.describe 'Course index page' do
  describe 'As a visitor' do
    before :each do
      @student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      @student_2 = Student.create!(name: "AJ Dorion", age: 44, house: "Ravenclaw")
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

    it 'see list of courses with number of students in each' do
      visit '/courses'

      expect(page).to have_content("#{@course_1.name}: #{@course_1.students.count}")
      expect(page).to have_content("#{@course_2.name}: #{@course_2.students.count}")
      expect(page).to have_content("#{@course_3.name}: #{@course_3.students.count}")
    end
  end
end
