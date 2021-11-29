class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform
  before_action :set_locale

  private

  def authorize_admin!
    return if current_user.admin
    redirect_to root_path, alert: 'Admins only!'
  end

  def set_locale
    I18n.locale = user_signed_in? ? current_user.language : I18n.default_locale
  end
end
