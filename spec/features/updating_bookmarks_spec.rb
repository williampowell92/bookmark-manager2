feature 'updating bookmarks' do
  let(:title) { 'Google' }
  let(:url) { 'http://www.google.com' }
  let(:broken_url) { 'htttp://www.google.com' }

  scenario 'valid bookmark' do
    visit '/'
    add_bookmark('Boogle', 'http://www.googgle.com')
    click_link 'update bookmark'
    click_link 'Boogle'
    fill_in('new-bookmark', with: url)
    fill_in('new-title', with: title)
    click_button('Update')
    expect(page).to have_link(title, href: url)
  end

  scenario 'invalid bookmark' do
    visit '/'
    add_bookmark('Boogle', 'http://www.googgle.com')
    click_link 'update bookmark'
    click_link 'Boogle'
    fill_in('new-bookmark', with: broken_url)
    fill_in('new-title', with: title)
    click_button('Update')
    expect(page).to have_content('Invalid url')
    expect(page).to have_current_path('/update-form')
  end
end
