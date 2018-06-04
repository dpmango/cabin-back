desc "This task is called by the Heroku scheduler add-on"
task :send_followup => :environment do
  puts "Sheduler working ..."

  require "#{Rails.root}/app/services/zapier/base.rb"
  require "#{Rails.root}/app/services/zapier/signup_lead_followup.rb"

  SignupLead.all.each do |lead|
    if lead.isfollowup === true
      if lead.updated_at < (Time.now.utc - 1.hour)
        Zapier::SignupLeadFollowUp.new(lead).post_to_zapier
        lead.update(isfollowup: false)
      end
    end
  end

end
