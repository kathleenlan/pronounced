# frozen_string_literal: true
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
    it do
      is_expected.to have_db_column(:view_count).of_type(:integer)
        .with_options(defualt: 0)
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
      is_expected.to validate_presence_of(:name)
    end
    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:language_id)
    end
    it do
      is_expected.to validate_presence_of(:language)
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

  describe '#increment_view_count!' do
    it 'adds 1 to the view_count attribute' do
      expect { subject.increment_view_count! }.to change { subject.view_count }.by(1)
    end
  end
end
