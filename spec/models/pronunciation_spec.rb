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
  end
end
