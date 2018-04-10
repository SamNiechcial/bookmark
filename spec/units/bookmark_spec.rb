require 'bookmark'

describe Bookmark do
  describe ".all" do
    it "returns a list of all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.facebook.com")
      expect(bookmarks).to include("http://www.yahoo.com")
    end
  end
end
