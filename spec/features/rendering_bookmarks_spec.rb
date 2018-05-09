feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    visit('/')
    expect(page).to have_content('["google.com", "github.com", "yahoo.com"]')
  end
end
