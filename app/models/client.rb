class Client < ActiveRecord::Base
  has_many :projects
  validates :name, :contact_email, :account_number, presence: true
end
