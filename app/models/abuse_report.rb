class AbuseReport < ApplicationRecord
  include AASM

  aasm(:abuse_report_status, :column => 'abuse_report_status') do
    state :submitted, initial: true
    state :acknowledged
    state :addressed

    event :acknowledge do
      transitions from: :submitted, to: :acknowledged
    end
    event :address do
      transitions from: :acknowledged, to: :addressed
    end
  end

  validates :pronunciation, presence: true
  validates :reported_by, presence: true
  validates :abuse_report_reason, presence: true

  belongs_to :pronunciation, inverse_of: :abuse_reports
  belongs_to :reported_by, class_name: 'User', inverse_of: :abuse_reports
  belongs_to :abuse_report_reason

  delegate :pronounceable, to: :pronunciation
  delegate :upload_date, :uploaded_by, :audio_file_url, to: :pronunciation, prefix: true

  scope :reported_by, -> (user) { where(reported_by: user) }
end
