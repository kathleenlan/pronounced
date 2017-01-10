# frozen_string_literal: true
class PronounceablePresenter < SimpleDelegator
  alias pronounceable __getobj__

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
