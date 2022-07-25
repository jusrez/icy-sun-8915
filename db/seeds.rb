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