require 'pg'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
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
    Bookmark.create(params)
    redirect '/bookmarks'
  end

  run if app_file == $0
end
