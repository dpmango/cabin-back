class SignupLead < ApplicationRecord
  validates :email, presence: { message: "Please enter your email" }
  validates_email_format_of :email, :message => 'Email format is not correct'
  # validates_uniqueness_of :email, :message => 'We have already scheduled an appointment'

  after_save :place_to_zapier
  before_save :email_to_lowercase

  def email_to_lowercase
    self.email = self.email.downcase!
  end
  # called when signup is sucessfull
  def place_to_zapier
    if self.ispending == false
      Zapier::SignupLead.new(self).post_to_zapier
    end
  end

end
