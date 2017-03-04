describe 'home page', :type => :feature do
  before do
    visit '/'
  end

  it 'has a button for adding a pronounceable' do
    expect(page).to have_content('Add a pronounceable')
  end

  it 'has a search bar' do
    expect(find('input[type="search"]')).to be_truthy
  end
end
