# frozen_string_literal: true
class AbuseReportReasonPresenter
  attr_reader :property

  def initialize(abuse_report_reason)
    @property = abuse_report_reason
  end

  def property_type
    'Abuse report reason'
  end

  def property_name
    property.name
  end

  def property_description
    property.description
  end
end
