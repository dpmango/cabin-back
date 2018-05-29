module Zapier
  class SignupLead < Zapier::Base
    def call_operation
      puts "LEAD PARAMS"
      puts params
      HTTParty.post(ENV['ZAP_SPACE'], body: params)
    end

    def params
      {
        email: resource.email,
        phone: resource.phone,
        first_name: resource.first_name,
        last_name: resource.last_name,
        company_name: resource.company_name,
        company_industry: resource.company_industry,
        company_employees: resource.company_employees,
        company_old: resource.company_old,
        meeting_date: resource.meeting_date,
        meeting_time: resource.meeting_time
      }
    end
  end
end
