require 'sinatra/base'
require 'sinatra/flash'

require_relative'lib/commander_data'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = CommanderData.all

    erb(:index)
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/add-bookmark' do
    if CommanderData.valid?(params['new-bookmark'])
      CommanderData.add(params['new-title'], params['new-bookmark'])
      redirect('/bookmarks')
    else
      flash[:invalid_url] = 'Invalid url'
      redirect('/add-bookmark')
    end
  end

  get '/delete-bookmark' do
    @bookmarks = CommanderData.all

    erb(:delete_bookmark)
  end

  get '/delete-action' do
    CommanderData.delete(params['bookmark'])

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
