require_relative '../lib/bookmark'
require 'pg'

describe Bookmark do

  describe '#all' do
    it 'responds to it' do
      expect(described_class).to respond_to(:all)
    end
    it 'returns urls from database' do
      con = PG.connect :dbname => 'bookmark_manager_test'
      con.exec "INSERT INTO bookmarks VALUES(1, 'http://google.com')"
      con.exec "INSERT INTO bookmarks VALUES(2, 'http://destroyallsoftware.com')"
      con.exec "INSERT INTO bookmarks VALUES(3, 'http://outlook.com')"
      expect(described_class.all).to eq(['http://google.com', 'http://destroyallsoftware.com', 'http://outlook.com'])
    end
  end

end
