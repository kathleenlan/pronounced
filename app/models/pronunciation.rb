class Pronunciation < ApplicationRecord
  has_attached_file :audio_file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :audio_file, presence: true,
      content_type: { content_type: ["audio/mpeg", "audio/mp3"] },
      size: { in: 0..100.kilobytes }

  validates :pronounceable, presence: true
  validates :user, presence: true

  belongs_to :pronounceable, inverse_of: :pronunciations
  belongs_to :user, inverse_of: :pronunciations
end
