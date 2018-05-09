require 'pg'

feature 'rendering_bookmarks' do
  scenario 'displaying a list of bookmarks' do
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO bookmarks VALUES(1, 'http://google.com')"
    con.exec "INSERT INTO bookmarks VALUES(2, 'http://destroyallsoftware.com')"
    con.exec "INSERT INTO bookmarks VALUES(3, 'http://outlook.com')"

    visit('/')
    expect(page).to have_content('http://google.com http://destroyallsoftware.com http://outlook.com')
  end
end
