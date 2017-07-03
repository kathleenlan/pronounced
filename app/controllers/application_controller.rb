# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_recaptcha_site_key

  private def authenticate_admin_user!
    authenticate_user! && authenticate_admin!
  end

  private def authenticate_admin!
    raise 'Unauthorized user' unless current_user.admin?
  end

  private def set_recaptcha_site_key
    @recaptcha_site_key ||= Secrets.recaptcha_site_key
  end
end
