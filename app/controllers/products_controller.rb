class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: :destroy
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @search = Product.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @products = @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show
    fresh_when etag: @product
  end

  def new
    @product = Product.new
    @product.stand_id = params[:stand] if params.key?(:stand)
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.save!

    respond_to do |format|
      format.html { redirect_to @product, notice: "#{t('activerecord.models.product.one').capitalize} #{t 'general.successfully_created'}" }
      format.json { render :show, status: :created }
    end
  end

  def update
    @product.update!(product_params)
    respond_to do |format|
      format.html { redirect_to @product, notice: "#{t('activerecord.models.product.one').capitalize} #{t 'general.successfully_updated'}" }
      format.json { render :show }
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "#{t('activerecord.models.product.one').capitalize} #{t 'general.successfully_destroyed'}" }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :icon, :price, :stand_id)
  end
end
