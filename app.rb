require 'sinatra/base'
require 'sinatra/flash'

require_relative'lib/commander_data'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = CommanderData.all

    erb(:index)
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/add-bookmark' do
    if CommanderData.valid?(params['new-bookmark'])
      CommanderData.add(params['new-title'], params['new-bookmark'])
    else
      flash[:invalid_url] = 'Invalid url'
    end

    redirect('/')
  end

  get '/delete-bookmark' do
    @bookmarks = CommanderData.all

    erb(:delete_bookmark)
  end

  get '/delete-action' do
    CommanderData.delete(params['bookmark'])

    redirect('/')
  end

  get '/update-bookmark' do
    @bookmarks = CommanderData.all

    erb(:update_bookmark)
  end

  get '/update-form' do
    session[:old_title] = params['bookmark']

    erb(:update_form)
  end

  post '/update-action' do\
    CommanderData.update(session['old_title'],
                         params['new-title'],
                         params['new-bookmark'])

   redirect('/')
  end

  run! if app_file == $0

end
