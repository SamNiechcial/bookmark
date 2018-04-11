require 'pg'
require 'sinatra/flash'

class Bookmark

  def self.connection
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(params)
    return false unless is_url?(params)
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{params[:url]}');")
  end

  private

  def self.is_url?(params)
    params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
