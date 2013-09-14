class WorkLog < ActiveRecord::Base
  belongs_to :project
  validates :project_id, :day, :hours, presence: true
  validates :hours, numericality: true
end
