# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private def authenticate_admin_user!
    authenticate_user! && authenticate_admin!
  end

  private def authenticate_admin!
    raise 'Unauthorized user' unless current_user.admin?
  end
end
