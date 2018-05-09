require 'sinatra/base'
require_relative'lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmark = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0

end
