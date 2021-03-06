class StandsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: :destroy
  before_action :set_stand, only: %i[show edit update destroy]

  def index
    @search = Stand.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @stands = @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show; end

  def new
    @stand = Stand.new
  end

  def edit; end

  def create
    @stand = Stand.new(stand_params)
    @stand.save!

    respond_to do |format|
      format.html { redirect_to @stand, notice: "#{t('activerecord.models.stand.one').capitalize} #{t 'general.successfully_created'}" }
      format.json { render :show, status: :created }
    end
  end

  def update
    @stand.update!(stand_params)
    respond_to do |format|
      format.html { redirect_to @stand, notice: "#{t('activerecord.models.stand.one').capitalize} #{t 'general.successfully_updated'}" }
      format.json { render :show }
    end
  end

  def destroy
    @stand.destroy
    respond_to do |format|
      format.html { redirect_to stands_url, notice: "#{t('activerecord.models.stand.one').capitalize} #{t 'general.successfully_destroyed'}" }
      format.json { head :no_content }
    end
  end

  private
    def set_stand
      @stand = Stand.find(params[:id])
    end

    def stand_params
      params.require(:stand).permit(:name, :icon, :operator_id, :user_ids => [])
    end
end
