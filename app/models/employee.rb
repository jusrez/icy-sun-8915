class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  validates_presence_of :name
  validates :level, presence: true, numericality: true

  def oldest_to_youngest
    tickets.order(age: :desc)
  end
end