require 'rails_helper'

describe AbuseReportReasonPresenter do
  it_behaves_like 'a property presenter'

  let(:abuse_report_reason) do
    AbuseReportReason.new(name: name, description: description)
  end
  let(:name) do
    'Irrelevant'
  end
  let(:description) do
    'The pronunciation does not correspond with the pronounceable.'
  end

  subject do
    described_class.new(abuse_report_reason)
  end

  describe '#property' do
    it 'returns the abuse report reason' do
      expect(subject.property).to eql abuse_report_reason
    end
  end

  describe '#property_type' do
    it 'returns "Abuse report reason"' do
      expect(subject.property_type).to eql 'Abuse report reason'
    end
  end

  describe '#property_name' do
    it 'returns the name of the abuse report reason' do
      expect(subject.property_name).to eql name
    end
  end

  describe '#property_description' do
    it 'returns the description of the abuse report reason' do
      expect(subject.property_description).to eql description
    end
  end
end
