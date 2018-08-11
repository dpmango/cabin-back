class OnboardingsController < ApplicationController
  before_action :set_onboarding, only: [:update]


  # POST /onboardings
  def create
    @onboarding_match = Onboarding.find_by_onboarding_id(params[:onboarding][:onboarding_id])
    if @onboarding_match && (@onboarding_match.ispending)
      render json: @onboarding_match
    else
      @onboarding = Onboarding.new(onboarding_params)

      if @onboarding.save
        render json: @onboarding, status: :created, location: @onboarding
      else
        render json: { :errors => @onboarding.errors }
      end
    end
  end

  # PATCH/PUT /onboardings/1
  def update
    if @onboarding.update(onboarding_params)
      render json: @onboarding
    else
      render json: { :errors => @onboarding.errors }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding
      # @onboarding = SignupLead.find_by(email: params[:id])
      @onboarding = Onboarding.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def onboarding_params
      params.require(:onboarding).permit(:onboarding_id, :company_uen, :company_name, :company_activity, :company_addres, :company_revenue, :consumers_list, :suppliers_list, :payments_to_list, :payments_from_list, :paidup_capital, :company_relations, :paidup_capital_origins, :shareholders_individulas, :shareholders_corporate, :ispending, :isproduction)
    end

end
