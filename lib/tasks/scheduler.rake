desc "This task is called by the Heroku scheduler add-on"
task :send_followup => :environment do
  puts "Sheduler working ..."
  User.all.each do |lead|
    if lead.isfollowup === true
      Zapier::SignupLeadFollowUp.new(lead).post_to_zapier
      lead.update(isfollowup: false)
    end
  end

end
