class SignupLeadsController < ApplicationController
  before_action :set_signup_lead, only: [:show, :update, :destroy]

  # GET /signup_leads
  def index
    @signup_leads = SignupLead.all

    render json: @signup_leads
  end

  # GET /signup_leads/1
  def show
    render json: @signup_lead
  end

  # POST /signup_leads
  def create
    @signup_lead = SignupLead.new(signup_lead_params)

    if @signup_lead.save
      render json: @signup_lead, status: :created, location: @signup_lead
    else
      render json: @signup_lead.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /signup_leads/1
  def update
    if @signup_lead.update(signup_lead_params)
      render json: @signup_lead
    else
      render json: @signup_lead.errors, status: :unprocessable_entity
    end
  end

  # DELETE /signup_leads/1
  def destroy
    @signup_lead.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup_lead
      @signup_lead = SignupLead.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def signup_lead_params
      params.require(:signup_lead).permit(:email, :first_name, :last_name, :company_name, :phone, :company_industry, :company_old, :company_employees, :meeting_date, :meeting_time, :ispending)
    end
end
