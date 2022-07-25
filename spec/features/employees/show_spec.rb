require 'rails_helper'

RSpec.describe 'Employee Show' do
  describe 'As a user' do
    describe 'When I visit the Employee show page' do
      it 'I see the employees name, department, and a list of all of their tickets from oldest to youngest. I also see the oldest ticket assigned to the employee listed separately' do
        department1 = Department.create!(name: 'IT', floor: 'Basement')
        department2 = Department.create!(name: 'HR', floor: 'FL 1')
        department3 = Department.create!(name: 'Marketing', floor: 'FL 2')

        it_employee = Employee.create!(name: "Sherry Berry", level: 3, department_id: department1.id)
        hr_employee = Employee.create!(name: "Larry Hoover", level: 1, department_id: department2.id)
        marketing_employee = Employee.create!(name: "Brad Pitt", level: 5, department_id: department3.id)

        ticket1 = Ticket.create!(subject: "Paper jam", age: 3)
        ticket2 = Ticket.create!(subject: "Out of toner", age: 12)
        ticket3 = Ticket.create!(subject: "Mouse broken", age: 5)

        it_employee_ticket1 = EmployeeTicket.create!(employee_id: it_employee.id, ticket_id: ticket1.id)
        it_employee_ticket2 = EmployeeTicket.create!(employee_id: it_employee.id, ticket_id: ticket2.id)

        visit "/employees/#{it_employee.id}"

        expect(page).to have_content(it_employee.name)
        expect(page).to have_content(it_employee.department.name)
        expect(page).to have_content("List of open tickets (oldest to youngest)")
        
        within "#ticket-0" do
          expect(page).to have_content(ticket2.subject)
        end

        within "#ticket-1" do
          expect(page).to have_content(ticket1.subject)
        end

        expect(page).to have_content("Oldest Ticket")

        within "#oldest_ticket-#{ticket2.id}" do
          expect(page).to have_content(ticket2.subject)
        end
      end

      it 'I do not see any tickets listed that are not assigned to the employee and i see a form to add a ticket to this movie' do
        department1 = Department.create!(name: 'IT', floor: 'Basement')
        it_employee = Employee.create!(name: "Sherry Berry", level: 3, department_id: department1.id)
        ticket1 = Ticket.create!(subject: "Paper jam", age: 3)
        ticket2 = Ticket.create!(subject: "Out of toner", age: 12)
        ticket3 = Ticket.create!(subject: "Mouse broken", age: 5)

        visit "/employees/#{it_employee.id}"

        expect(page).to_not have_content(ticket1.subject)
        expect(page).to_not have_content(ticket2.subject)
        expect(page).to_not have_content(ticket3.subject)
        
        fill_in 'Ticket', with: "#{ticket1.id}"
        click_button 'Assign ticket'
        
        expect(current_path).to eq("/employees/#{it_employee.id}")
       
        expect(page).to have_content(ticket1.subject)
      end
    end
  end
end