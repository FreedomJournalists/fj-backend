class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
    render json: @campaigns, status: :ok
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
     render json: @campaign, status: :ok
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    # Add the current logged in user as the creator of the campaign
    @campaign.user = current_user

      if @campaign.save
        render json: @campaign, status: :created
      else
        render json: @campaign.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    campaign = Campaign.where(id: params[:id])
    if campaign.update(update_campaign_params)
      render json: campaign
    else
      render json: campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.permit(:title, :description, :money_raised, :goal, :image_file)
    end

    def update_campaign_params
     params.permit(:image_file, :image_file_file_name, :image_file_content_type, :image_file_file_size, :image_file_updated_at)
    end
end
