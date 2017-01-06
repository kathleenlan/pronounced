require 'rails_helper'

describe AbuseReasonsPresenter do
  it_behaves_like 'a properties presenter'
  let(:abuse_reasons) do
    instance_double 'AbuseReason::ActiveRecord_Relation'
  end

  subject do
    described_class.new(abuse_reasons)
  end

  describe '#properties' do
    it 'returns the abuse reasons' do
      expect(subject.properties).to eql abuse_reasons
    end
  end

  describe '#header' do
    it 'returns the text for the header of the page' do
      expect(subject.header).to eql 'Abuse Reasons'
    end
  end

  describe '#new_property_button_label' do
    it 'returns the label text for the new property button' do
      expect(subject.new_property_button_label)
        .to eql 'Add an abuse reason'
    end
  end

  describe '#pluralized_property_name' do
    it 'returns the pluralized name of the property type' do
      expect(subject.pluralized_property_name)
        .to eql 'abuse reasons'
    end
  end
end
