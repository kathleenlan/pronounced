require 'rails_helper'

describe PronounceablePresenter do
  let(:pronounceable) do
    instance_double(
      'Pronounceable',
      pronunciations: pronunciations
    )
  end
  let(:pronunciations) do
    instance_double(
      'ActiveRecord::Associations::CollectionProxy',
      any?: any_pronunciations
    )
  end
  let(:any_pronunciations) do
    true
  end

  subject do
    described_class.new(pronounceable)
  end

  describe '#any_pronunciations?' do
    context 'when the Pronounceable does not have any pronunciations' do
      let(:any_pronunciations) do
        false
      end

      it 'returns false' do
        expect(subject.any_pronunciations?).to be false
      end
    end

    context 'when the Pronounceable has pronunciations' do
      let(:any_pronunciations) do
        true
      end

      it 'returns true' do
        expect(subject.any_pronunciations?).to be true
      end
    end
  end

  describe '#each_pronunciation' do
  end
end
