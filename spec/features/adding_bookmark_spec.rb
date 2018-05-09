feature 'adding bookmarks' do
  scenario 'adding a bookmark to the list' do
    visit('/')
    click_link('add bookmark')
    fill_in('new-bookmark', with: 'http://www.google.com')
    click_button('Save')
    expect(page).to have_content('http://www.google.com')
  end
end
