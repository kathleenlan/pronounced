# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :pronunciations, inverse_of: :user
  has_many :abuse_reports, inverse_of: :reported_by

  def to_s
    email
  end

  def no_pronunciations_for?(pronounceable)
    pronunciations.for_pronounceable(pronounceable).none?
  end
end
