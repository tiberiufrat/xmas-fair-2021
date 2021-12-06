class SpiridonPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: %i[edit update destroy]
  before_action :set_spiridon_purchase, only: %i[ show edit update destroy ]

  def index
    @search = SpiridonPurchase.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @spiridon_purchases = @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show; end

  def new
    @spiridon_purchase = SpiridonPurchase.new
  end

  def edit; end

  def create
    @spiridon_purchase = SpiridonPurchase.new(spiridon_purchase_params)
    # Set operator to current user if there is no operator (i.e. non-admin user)
    @spiridon_purchase.operator = current_user if @spiridon_purchase.operator.nil?
    @spiridon_purchase.save!

    respond_to do |format|
      format.html { redirect_to @spiridon_purchase, notice: "#{t('activerecord.models.spiridon_purchase.one').capitalize} #{t 'general.successfully_created'}" }
      format.json { render :show, status: :created }
    end
  end

  def update
    @spiridon_purchase.update!(spiridon_purchase_params)
    respond_to do |format|
      format.html { redirect_to @spiridon_purchase, notice: "#{t('activerecord.models.spiridon_purchase.one').capitalize} #{t 'general.successfully_updated'}" }
      format.json { render :show }
    end
  end

  def destroy
    @spiridon_purchase.destroy
    respond_to do |format|
      format.html { redirect_to spiridon_purchases_url, notice: "#{t('activerecord.models.spiridon_purchase.one').capitalize} #{t 'general.successfully_destroyed'}" }
      format.json { head :no_content }
    end
  end

  private

  def set_spiridon_purchase
    @spiridon_purchase = SpiridonPurchase.find(params[:id])
  end

  def spiridon_purchase_params
    params.require(:spiridon_purchase).permit(:amount, :operator_id)
  end
end
