# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db columns and indices' do
    it do
      is_expected.to have_db_column(:email).of_type(:string)
        .with_options(null: false, default: '')
    end
    it do
      is_expected.to have_db_column(:encrypted_password)
        .of_type(:string).with_options(null: false, default: '')
    end
    it do
      is_expected.to have_db_column(:reset_password_token)
        .of_type(:string)
    end
    it do
      is_expected.to have_db_column(:reset_password_sent_at)
        .of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:remember_created_at)
        .of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:sign_in_count)
        .of_type(:integer)
        .with_options(default: 0, null: false)
    end
    it do
      is_expected.to have_db_column(:current_sign_in_at)
        .of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:last_sign_in_at)
        .of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:current_sign_in_ip)
        .of_type(:inet)
    end
    it do
      is_expected.to have_db_column(:last_sign_in_ip)
        .of_type(:inet)
    end
    it do
      is_expected.to have_db_column(:confirmation_token)
        .of_type(:string)
    end
    it do
      is_expected.to have_db_column(:confirmed_at).of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime)
    end
    it do
      is_expected.to have_db_column(:unconfirmed_email).of_type(:string)
    end
    it do
      is_expected.to have_db_column(:failed_attempts).of_type(:integer)
        .with_options(default: 0, null: false)
    end
    it do
      is_expected.to have_db_column(:unlock_token).of_type(:string)
    end
    it do
      is_expected.to have_db_column(:locked_at).of_type(:datetime)
    end
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:pronunciations)
        .inverse_of(:user)
    end
    it do
      is_expected.to have_many(:abuse_reports)
        .inverse_of(:reported_by)
    end
  end
end
