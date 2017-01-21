# frozen_string_literal: true
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

  describe '#user_allowed_to_add_pronunciation?' do
    context 'when the user is present' do
      let(:user) do
        instance_double 'User'
      end

      context 'when the user has already uploaded a pronunciation' do
        before do
          allow(user).to receive(:no_pronunciations_for?).with(pronounceable)
            .and_return false
        end

        it 'returns false' do
          expect(subject.user_allowed_to_add_pronunciation?(user)).to eql false
        end
      end

      context 'when the user has not yet uploaded a pronunciation' do
        before do
          allow(user).to receive(:no_pronunciations_for?).with(pronounceable)
            .and_return true
        end

        it 'returns true' do
          expect(subject.user_allowed_to_add_pronunciation?(user)).to eql true
        end
      end
    end

    context 'when the user is absent' do
      let(:user) do
        nil
      end

      it 'returns false' do
        expect(subject.user_allowed_to_add_pronunciation?(user)).to eql false
      end
    end
  end

  describe '#user_disallowed_from_adding_pronunciation_message' do
    context 'when the user is present' do
      let(:user) do
        instance_double 'User'
      end

      it 'returns a message saying the user has already uploaded a '\
        'pronunciation' do
        expected_message = 'You have already uploaded a pronunciation for '\
          'this pronounceable.'
        expect(
          subject.user_disallowed_from_adding_pronunciation_message(user)
        ).to eql expected_message
      end
    end

    context 'when the user is not present' do
      let(:user) do
        nil
      end

      it 'returns a message that tells the user to log in' do
        expected_message = 'You must be logged in to upload a pronunciation.'
        expect(
          subject.user_disallowed_from_adding_pronunciation_message(user)
        ).to eql expected_message
      end
    end
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
