class AbuseReportReasonsController < ApplicationController
  before_action :set_abuse_report_reason, only: [:show, :edit, :update]

  def index
    abuse_report_reasons = AbuseReportReason.all
    @presenter = AbuseReportReasonsPresenter.new(abuse_report_reasons)
    render 'properties/index', locals: {
      new_property_path: new_abuse_report_reason_path
    }
  end

  def new
    abuse_report_reason = AbuseReportReason.new
    @presenter = AbuseReportReasonPresenter.new(abuse_report_reason)
    render 'properties/new'
  end

  def create
    @abuse_report_reason = AbuseReportReason.new(permitted_params)
    if @abuse_report_reason.save
      flash[:info] = 'Successfully saved abuse report reason.'
      redirect_to abuse_report_reason_path(@abuse_report_reason)
    else
      flash[:error] = 'Unable to save abuse report reason.'
    end
  end

  def show
    @presenter = AbuseReportReasonPresenter.new(@abuse_report_reason)
    render 'properties/show'
  end

  def edit
  end

  def update
    if @abuse_report_reason.update_attributes(permitted_params)
      flash[:info] = 'Successfully saved abuse report reason.'
      redirect_to abuse_report_reason_path(@abuse_report_reason)
    else
      flash[:error] = 'Unable to save abuse report reason.'
    end
  end

  private def set_abuse_report_reason
    @abuse_report_reason = AbuseReportReason.find(params[:id])
  end

  private def permitted_params
    params.require(:abuse_report_reason).permit(
      :id,
      :name,
      :description
    )
  end
end
