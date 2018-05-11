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
    erb(:add_bookmark)
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

  get '/update-bookmark' do
    @bookmarks = CommanderData.all

    erb(:update_bookmark)
  end

  get '/update-form' do
    session[:old_title] = params['bookmark'] unless params['bookmark'] == nil

    erb(:update_form)
  end

  post '/update-action' do
    if CommanderData.valid?(params['new-bookmark'])
      CommanderData.update(session['old_title'],
                           params['new-title'],
                           params['new-bookmark'])
      redirect('/bookmarks')
    else
      flash[:invalid_url] = 'Invalid url'
      redirect('/update-form')
    end


    CommanderData.update(session['old_title'],
                         params['new-title'],
                         params['new-bookmark'])

   redirect('/bookmarks')
  end

  run! if app_file == $0

end
