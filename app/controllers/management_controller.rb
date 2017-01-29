# frozen_string_literal: true
class ManagementController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
  end

  private def authenticate_admin!
    raise 'Unauthorized user' unless current_user.admin?
  end
end
