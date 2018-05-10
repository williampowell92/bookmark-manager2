feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    CommanderData.add('Google', 'http://google.com')
    CommanderData.add('Destroy', 'http://destroyallsoftware.com')
    CommanderData.add('Outlook', 'http://outlook.com')
    visit('/')
    expect(page).to have_link('Google', href: 'http://google.com')
    expect(page).to have_link('Destroy', href: 'http://destroyallsoftware.com')
    expect(page).to have_link('Outlook', href: 'http://outlook.com')
  end
end
