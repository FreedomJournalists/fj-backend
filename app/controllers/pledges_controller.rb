class PledgesController < ApplicationController
  before_action :set_pledge, only: [:show, :update, :destroy]

  # GET /pledges
  # GET /pledges.json
  def index
    @pledges = Pledge.all
  end

  # GET /pledges/1
  # GET /pledges/1.json
  def show
  end

  # POST /pledges
  # POST /pledges.json
  def create
    @pledge = Pledge.new(set_pledge_for_create)
    @pledge.user = current_user

    if @pledge.save
      render :show, status: :created, location: @pledge
    else
      render json: @pledge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pledges/1
  # PATCH/PUT /pledges/1.json
  def update
    if @pledge.update(pledge_params)
      render :show, status: :ok, location: @pledge
    else
      render json: @pledge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.json
  def destroy
    @pledge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledge
      @pledge = Pledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledge_params
      params.permit(:money, :message, :date, :campaign_id)
    end
end
