require 'rails_helper'

RSpec.describe Pronounceable, type: :model do
  describe 'db columns' do
    it do
      is_expected.to have_db_column(:name).of_type(:string)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:language_id).of_type(:integer)
        .with_options(foreign_key: true, null: false)
    end
  end

  describe 'validations' do
    let(:language) do
      create(:language)
    end

    subject do
      described_class.new(name: 'Test Name', language: language)
    end

    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:language_id)
    end
  end

  describe '#to_s' do
    let(:name) do
      'cabbage'
    end

    subject do
      described_class.new(name: name)
    end

    it 'returns the name' do
      expect(subject.to_s).to eql name
    end
  end
end
