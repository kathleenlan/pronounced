describe 'the new pronounceable page', type: :feature do
  context 'when user is not signed in' do
    it 'requires users to sign in' do
      visit new_pronounceable_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'when user is signed in' do
    before do
      Language.find_or_create_by(name: 'English')
      password = 'test_password'
      user = create(:user, password: password, confirmed_at: Time.zone.now)
      visit new_pronounceable_path
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: password)
      find('input[type="submit"]').click
    end

    after do
      User.destroy_all
      Pronounceable.destroy_all
      Language.destroy_all
    end

    context 'when the field inputs are valid' do
      it 'creates a pronounceable' do
        pronounceable_count = Pronounceable.count
        select('English', from: 'pronounceable_language_id')
        fill_in('pronounceable_name', with: 'Chicken')
        click_on('Save')
        expect(Pronounceable.count).to eql pronounceable_count + 1
      end
    end

    context 'when the field inputs are invalid' do
      it 'does not create a pronounceable' do
        pronounceable_count = Pronounceable.count
        select('English', from: 'pronounceable_language_id')
        click_on('Save')
        expect(Pronounceable.count).to eql pronounceable_count
      end
      it 'does not create a pronounceable' do
        pronounceable_count = Pronounceable.count
        fill_in('pronounceable_name', with: 'Chicken')
        click_on('Save')
        expect(Pronounceable.count).to eql pronounceable_count
      end
      it 'does not create a pronounceable' do
        pronounceable_count = Pronounceable.count
        click_on('Save')
        expect(Pronounceable.count).to eql pronounceable_count
      end
    end
  end
end
