# frozen_string_literal: true
class AbuseReportsController < ApplicationController
  before_action :set_existing_abuse_report,
                only: [:acknowledge, :dismiss, :show]

  def acknowledge
    @abuse_report.acknowledge!
    flash[:info] = 'Successfully acknowledged report.'
    redirect_to abuse_report_path(@abuse_report)
  rescue AASM::InvalidTransition
    flash[:error] = 'Unable to acknowledge abuse report.'
    redirect_to abuse_report_path(@abuse_report)
  end

  def dismiss
    ActiveRecord::Base.transaction do
      @abuse_report.address!
      disable_pronunciation = params[:disable_pronunciation] == 'true'
      dismiss_report(disable_pronunciation)
    end
  rescue AASM::InvalidTransition
    flash[:error] = I18n.t('controllers.abuse_reports.dismiss.dismiss_error')
  ensure
    redirect_to abuse_report_path(@abuse_report)
  end

  # TODO: Set up pagination
  def index
    @abuse_reports = AbuseReport.all
  end

  def create
    abuse_report = AbuseReport.new(permitted_params)
    if abuse_report.save
      flash[:info] = 'Abuse report submitted successfully.'
    else
      flash[:error] = 'Abuse report could not be submitted for the following '\
        "reasons: #{abuse_report.errors.full_messages.to_sentence}."
    end
    # TODO: If abuse report fails to save, re-render pronounceable page with
    # previously submitted data in abuse report form.
    redirect_to pronounceable_path(abuse_report.pronounceable)
  end

  def show; end

  private def set_existing_abuse_report
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

  private def dismiss_report(disable_pronunciation)
    if disable_pronunciation
      if @abuse_report.disable_pronunciation!
        # rubocop:disable Metrics/LineLength
        flash[:info] = I18n.t('controllers.abuse_reports.dismiss.disable_and_dismiss_success')
        # rubocop:enable Metrics/LineLength
      else
        # rubocop:disable Metrics/LineLength
        flash[:error] = I18n.t('controllers.abuse_reports.dismiss.disable_error')
        # rubocop:enable Metrics/LineLength
        raise ActiveRecord::Rollback
      end
    else
      flash[:info] = I18n.t('controllers.abuse_reports.dismiss.dismiss_success')
    end
  end
end
