class SignupLead < ApplicationRecord
  validates :email, presence: { message: "Please enter your email" }
  validates_email_format_of :email, :message => 'Email format is not correct'
  # validates_uniqueness_of :email, :message => 'We have already scheduled an appointment'

  after_save :place_to_zapier

  # called when signup is sucessfull
  def place_to_zapier
    if self.ispending == false
      Zapier::SignupLead.new(self).post_to_zapier
    end
  end

end
