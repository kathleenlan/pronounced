class PronounceablePresenter < SimpleDelegator
  alias_method :pronounceable, :__getobj__

  def any_pronunciations?
    pronounceable.pronunciations.any?
  end

  def each_pronunciation(&block)
    pronounceable.pronunciations.find_each.with_index do |pronunciation, index|
      pronunciation_presenter = PronunciationPresenter.new(pronunciation)
      yield pronunciation_presenter, index
    end
  end
end
