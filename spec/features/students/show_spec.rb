require 'rails_helper'

RSpec.describe 'Student show page' do
  describe 'As a visitor' do
    before :each do
      @student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      @student2 = Student.create!(name: 'Harry Potter', age: 17, house: 'Gryfindor')
      @course1 = @student1.courses.create!(name: "Defense against the Dark Arts")
      @course2 = @student1.courses.create!(name: "Herbology")
      @course3 = @student1.courses.create!(name: "Potions")
    end

    it 'See a list of students courses' do
      visit "/students/#{@student1.id}"

      expect(page).to have_content("Defense against the Dark Arts")
      expect(page).to have_content("Herbology")
      expect(page).to have_content("Potions")
    end
  end
end
