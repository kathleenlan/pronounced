class AbuseReportsController < ApplicationController
  def create
    abuse_report = AbuseReport.new(permitted_params)
    if abuse_report.save
      flash[:info] = 'Abuse report submitted successfully.'
    else
      flash[:error] = "Abuse report could not be submitted for the following reasons: #{abuse_report.errors.full_messages.to_sentence}."
    end
    redirect_to root_path
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
