require 'rails_helper'

RSpec.describe Pronunciation, type: :model do
  describe 'db columns and indices' do
    it do
      is_expected.to have_db_column(:user_id).of_type(:integer)
      .with_options(foreign_key: true, null: false)
    end
    it do
      is_expected.to have_db_column(:pronounceable_id).of_type(:integer)
      .with_options(foreign_key: true, null: false)
    end
    it do
      is_expected.to have_db_column(:audio_file_file_name).of_type(:string)
    end
    it do
      is_expected.to have_db_column(:audio_file_content_type).of_type(:string)
    end
    it do
      is_expected.to have_db_column(:audio_file_file_size).of_type(:integer)
    end
    it do
      is_expected.to have_db_column(:audio_file_updated_at).of_type(:datetime)
    end

    it do
      is_expected.to have_db_index(:pronounceable_id)
    end
    it do
      is_expected.to have_db_index(:user_id)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of(:user)
    end
    it do
      is_expected.to validate_presence_of(:pronounceable)
    end
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:user)
    end
    it do
      is_expected.to belong_to(:pronounceable)
    end
    it do
      is_expected.to have_many(:abuse_reports)
        .inverse_of(:pronunciation)
    end
  end

  describe 'delegations' do
    it do
      is_expected.to delegate_method(:url).to(:audio_file).with_prefix
    end
  end

  describe '#upload_date' do
    let(:audio_file_updated_at) do
      instance_double 'ActiveSupport::TimeWithZone'
    end

    before do
      allow(subject).to receive(:audio_file_updated_at)
        .and_return audio_file_updated_at
    end

    it 'returns the datetime at which the audio file was last updated' do
      expect(subject.upload_date).to eql audio_file_updated_at
    end
  end

  describe '#uploaded_by' do
    let(:user) do
      User.new
    end

    subject do
      described_class.new(user: user)
    end

    it 'returns the user' do
      expect(subject.uploaded_by).to eql user
    end
  end
end
