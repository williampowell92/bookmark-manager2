feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    CommanderData.add('http://google.com')
    CommanderData.add('http://destroyallsoftware.com')
    CommanderData.add('http://outlook.com')
    visit('/')
    expect(page).to have_content('http://google.com http://destroyallsoftware.com http://outlook.com')
  end
end
