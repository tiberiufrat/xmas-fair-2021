class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: %i[edit update destroy]
  before_action :set_purchase, only: %i[show edit update destroy]

  def index
    @search = Purchase.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @purchases = set_page_and_extract_portion_from @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show
    fresh_when etag: @purchase
  end

  def new
    @purchase = Purchase.new
    @purchase.stand_id = params[:stand] if params.key?(:stand)
  end

  def edit; end

  def create
    @purchase = Purchase.new(purchase_params)
    # Set operator to current user if there is no operator (i.e. non-admin user)
    @purchase.operator = current_user if @purchase.operator.nil?
    @purchase.save!

    respond_to do |format|
      format.html { redirect_to @purchase, notice: "#{t('activerecord.models.purchase.one').capitalize} #{t 'general.successfully_created'}" }
      format.json { render :show, status: :created }
    end
  end

  def update
    @purchase.update!(purchase_params)
    respond_to do |format|
      format.html { redirect_to @purchase, notice: "#{t('activerecord.models.purchase.one').capitalize} #{t 'general.successfully_updated'}" }
      format.json { render :show }
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: "#{t('activerecord.models.purchase.one').capitalize} #{t 'general.successfully_destroyed'}" }
      format.json { head :no_content }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:amount, :operator_id, :stand_id, product_ids: [], purchased_products_attributes: [:id, :product_id, :amount, :_destroy])
  end
end
