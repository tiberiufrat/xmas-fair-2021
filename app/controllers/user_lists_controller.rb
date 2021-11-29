class UserListsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: %i[index show change_language change_theme]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @search = User.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @users = set_page_and_extract_portion_from @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(usable_params)
    @user.save!

    respond_to do |format|
      format.html { redirect_to user_lists_path, notice: 'User was successfully created.' }
      format.json { render :show, status: :created }
    end
  end

  def update
    @user.update!(usable_params)
    respond_to do |format|
      format.html { redirect_to user_lists_path, notice: 'User was successfully updated.' }
      format.json { render :show }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_lists_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_language
    if I18n.available_locales.include? params[:language].to_sym
      current_user.update language: params[:language]
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: I18n.t('alerts.unavailable_language'))
    end
  end

  def change_theme
    if ['primary', 'danger', 'warning', 'success', 'info', 'dark'].include? params[:theme]
      current_user.update theme: params[:theme]
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: I18n.t('alerts.unavailable_theme'))
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_list_params
    params.permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :grade, :department, :position, :admin)
  end

  def usable_params
    {
      first_name: user_list_params[:first_name],
      last_name: user_list_params[:last_name],
      email: user_list_params[:email],
      password: user_list_params[:password],
      password_confirmation: user_list_params[:password_confirmation],
      phone: user_list_params[:phone],
      grade: user_list_params[:grade].to_i,
      position: user_list_params[:position].to_i,
      department: (user_list_params[:department].to_i unless user_list_params[:department] == ''),
      admin: ActiveModel::Type::Boolean.new.cast(user_list_params[:admin])
    }
  end
end
