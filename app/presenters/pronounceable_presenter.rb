# frozen_string_literal: true
class PronounceablePresenter < SimpleDelegator
  alias pronounceable __getobj__

  def user_allowed_to_add_pronunciation?(user)
    user.present? && user.no_pronunciations_for?(pronounceable)
  end

  def user_disallowed_from_adding_pronunciation_message(user)
    if user.present?
      'You have already uploaded a pronunciation for this pronounceable.'
    else
      'You must be logged in to upload a pronunciation.'
    end
  end

  def any_pronunciations?
    pronounceable.pronunciations.any?
  end

  def each_pronunciation
    pronounceable.pronunciations.find_each.with_index do |pronunciation, index|
      pronunciation_presenter = PronunciationPresenter.new(pronunciation)
      yield pronunciation_presenter, index
    end
  end
end
