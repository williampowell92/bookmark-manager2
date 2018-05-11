feature 'updating bookmarks' do
  let(:title) { 'Google' }
  let(:url) { 'http://www.google.com' }
  let(:broken_url) { 'htttp://www.google.com' }

  before do
    visit '/bookmarks'
    add_bookmark('Boogle', 'http://www.googgle.com')
    click_button 'Update'
  end

  scenario 'valid bookmark' do
    fill_in('url', with: url)
    fill_in('title', with: title)
    click_button('Update')
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link(title, href: url)
  end

  scenario 'invalid url' do
    fill_in('url', with: broken_url)
    fill_in('title', with: title)
    click_button('Update')
    expect(page).to have_current_path(/\/bookmarks\/\d+\/edit/)
    expect(page).to have_content('Invalid url')
  end
end
