require 'bookmark'

describe Bookmark do
  describe ".all" do
    it "returns a list of all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://destroyallsoftware.com")
    end
  end
end
