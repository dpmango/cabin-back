class SignupLead < ApplicationRecord
  validates :email, presence: { message: "Please enter your email" }
  validates_email_format_of :email, :message => 'Email format is not correct'
  validates_uniqueness_of :email, :message => 'We have already scheduled an appointment'
end
