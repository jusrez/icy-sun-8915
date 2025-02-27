class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  validates_presence_of :subject
  validates :age, presence: true, numericality: true
end