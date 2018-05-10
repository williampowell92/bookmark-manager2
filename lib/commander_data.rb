require 'pg'
require 'uri'

require_relative './bookmark'

class CommanderData

  def self.all(bookmark_class = Bookmark)
    connect_to_database
    rs = @@con.exec "SELECT * FROM bookmarks"
    rs.map { |row| bookmark_class.new(row['title'], row['url']) }
  end

  def self.add(title, url)
    connect_to_database
    @@con.exec "INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}')"
  end

  def self.valid?(url)
    !!(url =~ /\A#{URI::regexp(['http', 'https'])}\z/)
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

#
# def self.all(bookmark_class = Bookmark)
#   connect_to_database
#   rs = @@con.exec "SELECT * FROM bookmarks"
#   rs.map { |row| bookmark_class.new(row['title'], row['url']) }
# end
#
# def self.add
#
# end
