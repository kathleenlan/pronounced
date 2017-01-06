class AbuseReasonsPresenter
  attr_reader :properties

  def initialize(abuse_reasons)
    @properties = abuse_reasons
  end

  def header
    'Abuse Reasons'
  end

  def new_property_button_label
    'Add an abuse reason'
  end

  def pluralized_property_name
    'abuse reasons'
  end
end
