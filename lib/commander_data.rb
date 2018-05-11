require 'pg'
require 'uri'

require_relative './bookmark'

class CommanderData

  def self.all(bookmark_class = Bookmark, connection = connect_to_database)
    rs = connection.exec "SELECT * FROM bookmarks"
    rs.map { |row| bookmark_class.new(row['id'], row['title'], row['url']) }
  end

  def self.add(title, url, connection = connect_to_database)
    connection.exec "INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}')"
  end

  def self.valid?(url)
    !!(url =~ /\A#{URI::regexp(['http', 'https'])}\z/)
  end

  def self.delete(id, connection = connect_to_database)
    connection.exec "DELETE FROM bookmarks WHERE id = '#{id}'"
  end

  def self.update(old_title, new_title, new_url, connection = connect_to_database)
    connection.exec "UPDATE bookmarks SET title = '#{new_title}', url = '#{new_url}' WHERE title = '#{old_title}'"
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'bookmark_manager_test'
    else
      PG.connect :dbname => 'bookmark_manager'
    end
  end

end
