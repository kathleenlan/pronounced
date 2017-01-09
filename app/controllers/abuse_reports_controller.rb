class AbuseReportsController < ApplicationController
  # TODO: Set up pagination
  def index
    @abuse_reports = AbuseReport.all
  end

  def create
    abuse_report = AbuseReport.new(permitted_params)
    if abuse_report.save
      flash[:info] = 'Abuse report submitted successfully.'
    else
      flash[:error] = "Abuse report could not be submitted for the following reasons: #{abuse_report.errors.full_messages.to_sentence}."
    end
    # TODO: If abuse report fails to save, re-render pronounceable page with previously submitted data in abuse report form.
    redirect_to pronounceable_path(abuse_report.pronounceable)
  end

  def show
    @abuse_report = AbuseReport.find(params[:id])
  end

  private def permitted_params
    params.require(:abuse_report).permit(
      :reported_by_id,
      :pronunciation_id,
      :abuse_report_reason_id,
      :description
    )
  end
end
