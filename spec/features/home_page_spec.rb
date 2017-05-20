describe 'home page', :type => :feature do
  before do
    visit '/'
  end

  it 'has a search bar' do
    expect(find('input[type="search"]')).to be_truthy
  end
end
