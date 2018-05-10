require 'sinatra/base'
require 'sinatra/flash'

require_relative'lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all

    erb(:index)
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/add-bookmark' do
    Bookmark.add(params['new-bookmark'])

    redirect('/')
  end

  run! if app_file == $0

end
