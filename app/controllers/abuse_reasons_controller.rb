class AbuseReasonsController < ApplicationController
  before_action :set_abuse_reason, only: [:show, :edit, :update]

  def index
    abuse_reasons = AbuseReason.all
    @presenter = AbuseReasonsPresenter.new(abuse_reasons)
    render 'properties/index', locals: {
      new_property_path: new_abuse_reason_path
    }
  end

  def new
    abuse_reason = AbuseReason.new
    @presenter = AbuseReasonPresenter.new(abuse_reason)
    render 'properties/new'
  end

  def create
    @abuse_reason = AbuseReason.new(permitted_params)
    if @abuse_reason.save
      flash[:info] = 'Successfully saved abuse reason.'
      redirect_to abuse_reason_path(@abuse_reason)
    else
      flash[:error] = 'Unable to save abuse reason.'
    end
  end

  def show
    @presenter = AbuseReasonPresenter.new(@abuse_reason)
    render 'properties/show'
  end

  def edit
  end

  def update
    if @abuse_reason.update_attributes(permitted_params)
      flash[:info] = 'Successfully saved abuse reason.'
      redirect_to abuse_reason_path(@abuse_reason)
    else
      flash[:error] = 'Unable to save abuse reason.'
    end
  end

  private def set_abuse_reason
    @abuse_reason = AbuseReason.find(params[:id])
  end

  private def permitted_params
    params.require(:abuse_reason).permit(
      :id,
      :name,
      :description
    )
  end
end
