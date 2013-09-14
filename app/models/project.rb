class Project < ActiveRecord::Base
  belongs_to :client
  has_many :work_logs
  validates :name, presence: true
  validates :budget_hours, numericality: true
end
