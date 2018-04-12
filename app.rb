# frozen_string_literal: true

require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

# This class is the controller for my bookmark manager application
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
    flash[:error] = "#{params[:url]} is not a valid URL. Please try again."
    flash[:error] unless Bookmark.create(params)
    redirect '/bookmarks'
  end

  run if app_file == $PROGRAM_NAME
end
