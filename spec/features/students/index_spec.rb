require 'rails_helper'

RSpec.describe 'Student index page' do
  describe 'As a visitor' do
    before :each do
      @student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      @student2 = Student.create!(name: 'Harry Potter', age: 17, house: 'Gryfindor')
    end

    it 'Displays all student attributes' do
      visit '/students'

      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student1.age)
      expect(page).to have_content(@student1.house)
    end
  end
end
