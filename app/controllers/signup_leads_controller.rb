class SignupLeadsController < ApplicationController
  before_action :set_signup_lead, only: [:update]

  # POST /signup_leads
  def create
    @signup_match = SignupLead.find_by_email(params[:signup_lead][:email].downcase)
    if @signup_match && (@signup_match.ispending && @signup_match.isfollowup)
      render json: @signup_match
    else
      @signup_lead = SignupLead.new(signup_lead_params)

      if @signup_lead.save
        render json: @signup_lead, status: :created, location: @signup_lead
      else
        render json: { :errors => @signup_lead.errors }
      end
    end
  end

  # PATCH/PUT /signup_leads/1
  def update
    if @signup_lead.update(signup_lead_params)
      render json: @signup_lead
    else
      render json: { :errors => @signup_lead.errors }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup_lead
      # @signup_lead = SignupLead.find_by(email: params[:id])
      @signup_lead = SignupLead.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def signup_lead_params
      params.require(:signup_lead).permit(:email, :first_name, :last_name, :company_name, :phone, :company_industry, :company_old, :company_employees, :meeting_date, :meeting_time, :ispending, :isfollowup, :pricing_plan, :pricing_options, :email_instead)
    end
end
