class Pronounceable < ApplicationRecord
  validates :name, uniqueness: { scope: :language_id }

  belongs_to :language, inverse_of: :pronounceables
end
