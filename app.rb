require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'This is the homepage'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb :index
  end

  run if app_file == $0
end
