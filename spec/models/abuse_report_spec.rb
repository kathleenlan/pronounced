require 'rails_helper'

RSpec.describe AbuseReport, type: :model do
  describe 'db columns' do
    it do
      is_expected.to have_db_column(:pronunciation_id).of_type(:integer)
      .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:reported_by_id).of_type(:integer)
      .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:abuse_report_reason_id).of_type(:integer)
      .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:description).of_type(:text)
    end
    it do
      is_expected.to have_db_column(:created_at).of_type(:datetime)
      .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:updated_at).of_type(:datetime)
      .with_options(null: false)
    end
  end

  describe 'db indices' do
    it do
      is_expected.to have_db_index(:pronunciation_id)
    end
    it do
      is_expected.to have_db_index(:reported_by_id)
    end
    it do
      is_expected.to have_db_index(:abuse_report_reason_id)
    end
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:pronunciation)
        .inverse_of(:abuse_reports)
    end
    it do
      is_expected.to belong_to(:reported_by)
        .class_name('User')
        .inverse_of(:abuse_reports)
    end
    it do
      is_expected.to belong_to(:abuse_report_reason)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of(:pronunciation)
    end
    it do
      is_expected.to validate_presence_of(:reported_by)
    end
    it do
      is_expected.to validate_presence_of(:abuse_report_reason)
    end
  end
end
