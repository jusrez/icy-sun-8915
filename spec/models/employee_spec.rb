require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :tickets}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:level)}
  end

  describe 'instance methods' do
    it 'will order tickets by oldest to youngest' do
      department1 = Department.create!(name: 'IT', floor: 'Basement')
      it_employee = Employee.create!(name: "Sherry Berry", level: 3, department_id: department1.id)
      ticket1 = Ticket.create!(subject: "Paper jam", age: 3)
      ticket2 = Ticket.create!(subject: "Out of toner", age: 12)
      it_employee_ticket1 = EmployeeTicket.create!(employee_id: it_employee.id, ticket_id: ticket1.id)
      it_employee_ticket2 = EmployeeTicket.create!(employee_id: it_employee.id, ticket_id: ticket2.id)

      expect(it_employee.oldest_to_youngest.to_a).to eq([ticket2, ticket1])
    end
  end
end