# frozen_string_literal: true
class PronunciationPresenter < SimpleDelegator
  alias pronunciation __getobj__

  def user_allowed_to_report?(user)
    !pronunciation.any_abuse_reports_reported_by?(user)
  end

  def new_abuse_report(user:)
    pronunciation.abuse_reports.build(reported_by: user)
  end
end
