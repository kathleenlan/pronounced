# frozen_string_literal: true
RSpec.shared_examples 'a property presenter' do
  describe 'API' do
    it 'responds to #property' do
      expect(subject).to respond_to(:property)
    end
    it 'responds to #property_type' do
      expect(subject).to respond_to(:property_type)
    end
    it 'responds to #property_name' do
      expect(subject).to respond_to(:property_name)
    end
    it 'responds to #property_description' do
      expect(subject).to respond_to(:property_description)
    end
  end
end
