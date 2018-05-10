feature 'adding bookmarks' do
  before do
    visit('/')
    click_link('add bookmark')
  end

  fscenario 'adding valid bookmark' do
    fill_in('new-bookmark', with: 'http://www.google.com')
    fill_in('new-title', with: 'Google')
    click_button('Save')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_no_content('Invalid url')
  end

  scenario 'adding invalid bookmark' do
    fill_in('new-bookmark', with: 'Im not a url')
    fill_in('new-title', with: 'Did I tell you')
    click_button('Save')
    expect(page).to have_content('Invalid url')
    expect(page).to have_no_content('Did I tell you')
  end
end
