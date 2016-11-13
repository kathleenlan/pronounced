class Language < ApplicationRecord
  validates :name, uniqueness: true

  has_many :pronounceables, inverse_of: :language
end
