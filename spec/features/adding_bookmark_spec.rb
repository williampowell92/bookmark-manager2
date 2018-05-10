feature 'adding bookmarks' do
  before do
    visit('/')
    click_link('add bookmark')
  end

  scenario 'adding valid bookmark' do
    fill_in('new-bookmark', with: 'http://www.google.com')
    click_button('Save')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_no_content('Invalid url')
  end

  scenario 'adding invalid bookmark' do
    fill_in('new-bookmark', with: 'Im not a url')
    click_button('Save')
    expect(page).to have_content('Invalid url')
    expect(page).to have_no_content('Im not a url')
  end
end
