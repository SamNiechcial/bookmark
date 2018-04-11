require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns a list of all bookmarks' do

      Bookmark.create(url: "http://makersacademy.com")
      Bookmark.create(url: "http://www.google.com")
      Bookmark.create(url: "http://destroyallsoftware.com")

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://www.google.com',
        'http://destroyallsoftware.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark')

      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end
end
