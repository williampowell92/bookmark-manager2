require 'sinatra/base'
require 'sinatra/flash'

require_relative'lib/commander_data'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure do
    use Rack::MethodOverride
  end

  get '/bookmarks' do
    @bookmarks = CommanderData.all

    erb(:index)
  end

  get '/bookmarks/new' do
    erb(:new_bookmark)
  end

  post '/bookmarks' do
    if CommanderData.valid?(params['new-bookmark'])
      CommanderData.add(params['new-title'], params['new-bookmark'])
      redirect('/bookmarks')
    else
      flash[:invalid_url] = 'Invalid url'
      redirect('/bookmarks/new')
    end
  end

  delete '/bookmarks/:id' do
    CommanderData.delete(params['id'])

    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    erb(:edit_bookmark)
  end

  put '/bookmarks/:id' do
    if CommanderData.valid?(params['url'])
      CommanderData.update(params['id'],
                           params['title'],
                           params['url'])
      redirect('/bookmarks')
    else
      flash[:invalid_url] = 'Invalid url'
      redirect("/bookmarks/#{params['id']}/edit")
    end
  end

  run! if app_file == $0
end
