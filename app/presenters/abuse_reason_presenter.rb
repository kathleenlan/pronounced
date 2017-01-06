class AbuseReasonPresenter
  attr_reader :property

  def initialize(abuse_reason)
    @property = abuse_reason
  end

  def property_type
    'Abuse reason'
  end

  def property_name
    property.name
  end

  def property_description
    property.description
  end
end
