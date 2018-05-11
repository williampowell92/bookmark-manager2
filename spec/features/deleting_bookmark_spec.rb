feature 'deleting bookmarks' do
  scenario 'it deletes the bookmark' do
    visit '/bookmarks'
    add_bookmark('Google', 'http://www.google.com')
    click_button 'Delete'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_no_content('Google')
  end
end
