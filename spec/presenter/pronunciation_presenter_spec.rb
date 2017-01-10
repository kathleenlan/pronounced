# frozen_string_literal: true
require 'rails_helper'

describe PronunciationPresenter do
  let(:pronunciation) do
    Pronunciation.new
  end
  let(:user) do
    User.new
  end

  subject do
    described_class.new(pronunciation)
  end

  describe '#user_allowed_to_report?' do
    context 'when the user has previously submitted a report for this '\
      'pronunciation' do
      before do
        allow(pronunciation).to receive(:any_abuse_reports_reported_by?)
          .with(user).and_return true
      end

      it 'returns false' do
        expect(subject.user_allowed_to_report?(user)).to be false
      end
    end

    context 'when the user has not previously submitted a report for this '\
      'pronunciation' do
      before do
        allow(pronunciation).to receive(:any_abuse_reports_reported_by?)
          .with(user).and_return false
      end

      it 'returns true' do
        expect(subject.user_allowed_to_report?(user)).to be true
      end
    end
  end

  describe '#new_abuse_report' do
    let(:abuse_report) do
      subject.new_abuse_report(user: user)
    end

    it 'returns a new abuse report' do
      expect(abuse_report).to be_an_instance_of(AbuseReport)
    end
    it 'returns an abuse report associated with the pronunciation' do
      expect(abuse_report.pronunciation).to eql pronunciation
    end
    it 'returns an abuse report that is reported_by the user' do
      expect(abuse_report.reported_by).to eql user
    end
  end
end
