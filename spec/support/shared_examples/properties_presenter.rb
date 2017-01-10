# frozen_string_literal: true
RSpec.shared_examples 'a properties presenter' do
  describe 'API' do
    it 'responds to #properties' do
      expect(subject).to respond_to(:properties)
    end
    it 'responds to #header' do
      expect(subject).to respond_to(:header)
    end
    it 'responds to #new_property_button_label' do
      expect(subject).to respond_to(:new_property_button_label)
    end
    it 'responds to #pluralized_property_name' do
      expect(subject).to respond_to(:pluralized_property_name)
    end
  end
end
