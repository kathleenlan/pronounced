# frozen_string_literal: true
class Pronunciation < ApplicationRecord
  has_attached_file :audio_file
  validates_attachment :audio_file, presence: true,
                                    content_type: {
                                      content_type: [
                                        'audio/mpeg',
                                        'audio/mp3',
                                        'audio/mp4',
                                        'video/mp4',
                                        'audio/ogg',
                                        'audio/wav',
                                        'audio/webm'
                                      ]
                                    },
                                    size: { in: 0..2.megabytes }

  validates :pronounceable, presence: true
  validates :user, presence: true, uniqueness: { scope: :pronounceable_id }

  belongs_to :pronounceable, inverse_of: :pronunciations
  belongs_to :user, inverse_of: :pronunciations

  has_many :abuse_reports, inverse_of: :pronunciation

  delegate :url, to: :audio_file, prefix: true

  scope :for_pronounceable, lambda { |pronounceable|
    where(pronounceable_id: pronounceable.id)
  }

  def any_abuse_reports_reported_by?(user)
    abuse_reports.reported_by(user).any?
  end

  def upload_date
    audio_file_updated_at
  end

  def uploaded_by
    user
  end

  def disable!
    update_attributes(disabled: true)
  end
end
