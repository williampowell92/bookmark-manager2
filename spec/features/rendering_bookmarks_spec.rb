feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    visit('/')
    add_bookmark('Google', 'http://google.com')
    add_bookmark('Destroy', 'http://destroyallsoftware.com')
    add_bookmark('Outlook', 'http://outlook.com')
    expect(page).to have_link('Google', href: 'http://google.com')
    expect(page).to have_link('Destroy', href: 'http://destroyallsoftware.com')
    expect(page).to have_link('Outlook', href: 'http://outlook.com')
  end
end
