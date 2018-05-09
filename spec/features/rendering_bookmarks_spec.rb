feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    Bookmark.add('http://google.com')
    Bookmark.add('http://destroyallsoftware.com')
    Bookmark.add('http://outlook.com')
    visit('/')
    expect(page).to have_content('http://google.com http://destroyallsoftware.com http://outlook.com')
  end
end
