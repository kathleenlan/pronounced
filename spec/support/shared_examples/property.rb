RSpec.shared_examples 'a property' do
  describe 'db columns' do
    it do
      is_expected.to have_db_column(:name).of_type(:string)
    .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:type).of_type(:string)
    .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:description).of_type(:text)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of(:name)
    end
  end

  describe '#to_s' do
    let(:name) do
      'Something fantastic'
    end

    subject do
      described_class.new(name: name)
    end

    it 'returns the name' do
      expect(subject.to_s).to eql name
    end
  end
end
