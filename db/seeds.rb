department1 = Department.create!(name: 'IT', floor: 'Basement')
department2 = Department.create!(name: 'HR', floor: 'FL 1')
department3 = Department.create!(name: 'Marketing', floor: 'FL 2')

it_employee = Employee.create!(name: "Sherry Berry", level: 3, department_id: department1.id)
hr_employee = Employee.create!(name: "Larry Hoover", level: 1, department_id: department2.id)
marketing_employee = Employee.create!(name: "Brad Pitt", level: 5, department_id: department3.id)