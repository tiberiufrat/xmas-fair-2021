class HomeController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def index; end

  def search
    redirect_to root_path unless params[:search].present?
    @query = params[:search] if params[:search].present?
    # @query = sanitize_sql_like(@query)
    @users = User.where('first_name LIKE ?', "%#{@query}%")
                 .or(User.where('last_name LIKE ?', "%#{@query}%"))
                 .or(User.where("LOWER(first_name || ' ' || last_name) LIKE ?", "%#{@query.downcase}%"))
                 .or(User.where('email LIKE ?', "%#{@query}%"))
                 .or(User.where('phone LIKE ?', "%#{@query}%"))
    @stands = Stand.where('LOWER(name) LIKE ?', "%#{@query.downcase}%")
    @products = Product.where('LOWER(name) LIKE ?', "%#{@query.downcase}%")
  end

  def about
  end

  def profile; end
end
