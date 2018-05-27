class SignupLead < ApplicationRecord
  validates :email, presence: true
  validates_uniqueness_of :email
  validates_email_format_of :email, :message => 'email format is not correct'
end
