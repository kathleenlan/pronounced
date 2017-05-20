# frozen_string_literal: true
class Pronounceable < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :language_id }
  validates :language, presence: true

  belongs_to :language, inverse_of: :pronounceables

  has_many :pronunciations, inverse_of: :pronounceable

  def to_s
    name
  end

  def pronunciations_count
    pronunciations.count
  end

  def increment_view_count!
    update_attributes(view_count: view_count + 1)
  end
end
