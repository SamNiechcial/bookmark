require 'pg'

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
    p params
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{params[:url]}');")
  end
end
