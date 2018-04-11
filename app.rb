require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    'This is the homepage'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/create' do
    erb :create
  end

  post '/bookmarks' do
    if params[:url] !~ /\A#{URI::regexp}\z/
      flash[:error] = "#{params[:url]} is not a valid URL. Please try again."
      redirect '/error'
    else
      Bookmark.create(params)
      redirect '/bookmarks'
    end
  end

  get '/error' do
    flash[:error]
  end

  run if app_file == $0
end
