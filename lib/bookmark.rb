require 'pg'

class Bookmark
  def self.all
    [
      "http://www.google.com",
      "http://www.facebook.com",
      "http://www.yahoo.com"
    ]
  end
end

#connection = PG.connect(dbname: 'bookmark_manager')
#result = connection.exec("SELECT * FROM bookmarks")
#result.map { |bookmark| bookmark['url'] }
