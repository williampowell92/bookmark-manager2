feature 'updating bookmarks' do
  let(:title) { 'Google' }
  let(:url) { 'http://www.google.com' }

  scenario 'it updates the bookmark' do
    visit '/'
    add_bookmark('Boogle', 'http://www.googgle.com')
    click_link 'update bookmark'
    click_link 'Boogle'
    fill_in('new-bookmark', with: url)
    fill_in('new-title', with: title)
    click_button('Update')
    expect(page).to have_link(title, href: url)
  end
end
