feature 'adding bookmarks' do
  scenario 'adding valid bookmark' do
    visit('/')
    add_bookmark('Google', 'http://www.google.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_no_content('Invalid url')
  end

  scenario 'adding invalid bookmark' do
    visit('/')
    add_bookmark('What am I', 'Not a url')
    expect(page).to have_content('Invalid url')
  end
end
