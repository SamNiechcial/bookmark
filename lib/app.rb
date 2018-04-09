require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    @bookmarks = [
      "www.google.com",
      "www.facebook.com",
      "www.yahoo.com"
    ]

    bookmarks.join
  end


  run if $app_file == 0

end
