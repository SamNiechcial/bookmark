require 'sinatra/base'
require_relative 'bookmarks'

class App < Sinatra::Base

  get '/' do
    @bookmarks = [
      "www.google.com",
      "www.facebook.com",
      "www.yahoo.com"
    ]

  erb :index
  end


  run if $app_file == 0

end
