require 'pg'

class Bookmark

  def self.all
    connect_to_database
    rs = @@con.exec "SELECT * FROM bookmarks"
    rs.map { |result| result["url"] }
  end

  def self.add(url)
    connect_to_database
    @@con.exec "INSERT INTO bookmarks(url) VALUES('#{url}')"
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      @@con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @@con = PG.connect :dbname => 'bookmark_manager'
    end
  end

end
