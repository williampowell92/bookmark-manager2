feature 'deleting bookmarks' do
  scenario 'it deletes the bookmark' do
    visit '/'
    add_bookmark('Google', 'http://www.google.com')
    click_link 'delete bookmark' 
    click_link 'Google'
    expect(page).to have_no_content('Google')
  end
end
