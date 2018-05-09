require 'pg'

class Bookmark

  def self.all
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map do |result|
      result["url"]
    end
  end

end
