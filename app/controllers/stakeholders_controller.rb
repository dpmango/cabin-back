class StakeholdersController < ApplicationController
  before_action :set_stakeholder, only: [:show, :update]

  # GET /stakeholders
  # TODO - protect with JWT tokens
  def index
    @stakeholders = Stakeholder.all
    render json: @stakeholders
    # .as_json(:only => [:id, :company_name, :company_uen, :a_corpsecretary, :a_accounting, :a_status, :a_action, :a_date_fye, :a_date_agm, :a_date_renewal, :created_at])
  end

  # Get /stakeholder/:id
  # TODO - protect with JWT tokens
  def show
    render json: @stakeholder
  end

  # POST /stakeholders
  def create
    @stakeholder_match = Stakeholder.find_by_stakeholder_id(params[:stakeholder][:stakeholder_id])
    if @stakeholder_match && (@stakeholder_match.ispending)
      render json: @stakeholder_match
    else
      @stakeholder = Stakeholder.new(stakeholder_params)

      if @stakeholder.save
        render json: @stakeholder, status: :created, location: @stakeholder
      else
        render json: { :errors => @stakeholder.errors }
      end
    end
  end

  # PATCH/PUT /stakeholders/1
  def update
    if @stakeholder.update(stakeholder_params)
      render json: @stakeholder
    else
      render json: { :errors => @stakeholder.errors }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder
      # @stakeholder = SignupLead.find_by(email: params[:id])
      @stakeholder = Stakeholder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stakeholder_params
      params.require(:stakeholder).permit(:stakeholder_id, :name, :passport, :birthday, :nationality, :email, :phone, :residentionalAdress)
    end

end
