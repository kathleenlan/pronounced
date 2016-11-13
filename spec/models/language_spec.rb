require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'db columns' do
    it do
      is_expected.to have_db_column(:name).of_type(:string)
        .with_options(null: false)
    end
  end

  describe 'validations' do
    subject do
      described_class.new(name: 'Test Name')
    end

    it do
      is_expected.to validate_uniqueness_of(:name)
    end
  end
end
