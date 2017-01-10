# frozen_string_literal: true
class AbuseReportReasonsPresenter
  attr_reader :properties

  def initialize(abuse_report_reasons)
    @properties = abuse_report_reasons
  end

  def header
    'Abuse Report Reasons'
  end

  def new_property_button_label
    'Add an abuse report reason'
  end

  def pluralized_property_name
    'abuse report reasons'
  end
end
