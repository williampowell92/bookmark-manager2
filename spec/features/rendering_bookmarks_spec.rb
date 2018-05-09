feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    visit('/')
    expect(page).to have_content('http://google.com http://destroyallsoftware.com http://outlook.com http://AOL.com')
  end
end
