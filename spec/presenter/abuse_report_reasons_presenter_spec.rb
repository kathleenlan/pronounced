# frozen_string_literal: true
require 'rails_helper'

describe AbuseReportReasonsPresenter do
  it_behaves_like 'a properties presenter'
  let(:abuse_report_reasons) do
    instance_double 'AbuseReportReason::ActiveRecord_Relation'
  end

  subject do
    described_class.new(abuse_report_reasons)
  end

  describe '#properties' do
    it 'returns the abuse report reasons' do
      expect(subject.properties).to eql abuse_report_reasons
    end
  end

  describe '#header' do
    it 'returns the text for the header of the page' do
      expect(subject.header).to eql 'Abuse Report Reasons'
    end
  end

  describe '#new_property_button_label' do
    it 'returns the label text for the new property button' do
      expect(subject.new_property_button_label)
        .to eql 'Add an abuse report reason'
    end
  end

  describe '#pluralized_property_name' do
    it 'returns the pluralized name of the property type' do
      expect(subject.pluralized_property_name)
        .to eql 'abuse report reasons'
    end
  end
end
