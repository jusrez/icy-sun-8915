require 'rails_helper'

RSpec.describe 'Department Index' do
  describe 'As a user' do
    describe 'When I visit the Department index page' do
      it 'I see each departments name and floor and underneath each department, I can see the names of all of its employees' do
        department1 = Department.create!(name: 'IT', floor: 'Basement')
        department2 = Department.create!(name: 'HR', floor: 'FL 1')
        department3 = Department.create!(name: 'Marketing', floor: 'FL 2')

        it_employee = Employee.create!(name: "Sherry Berry", level: 3, department_id: department1.id)
        hr_employee = Employee.create!(name: "Larry Hoover", level: 1, department_id: department2.id)
        marketing_employee = Employee.create!(name: "Brad Pitt", level: 5, department_id: department3.id)

        visit '/departments'
   
        within "#department-#{department1.id}" do
          expect(page).to have_content("IT")
          expect(page).to have_content("Basement")
          expect(page).to have_content("Sherry Berry")
          expect(page).to_not have_content("Larry Hoover")
        end

        within "#department-#{department2.id}" do
          expect(page).to have_content("HR")
          expect(page).to have_content("FL 1")
          expect(page).to have_content("Larry Hoover")
          expect(page).to_not have_content("Brad Pitt")
        end

        within "#department-#{department3.id}" do
          expect(page).to have_content("Marketing")
          expect(page).to have_content("FL 2")
          expect(page).to have_content("Brad Pitt")
          expect(page).to_not have_content("Sherry Berry")
        end
      end
    end
  end
end