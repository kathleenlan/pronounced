# frozen_string_literal: true
class Pronounceable < ApplicationRecord
  validates :name, uniqueness: { scope: :language_id }

  belongs_to :language, inverse_of: :pronounceables

  has_many :pronunciations, inverse_of: :pronounceable

  def to_s
    name
  end

  def pronunciations_count
    pronunciations.count
  end
end
