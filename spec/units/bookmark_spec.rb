# frozen_string_literal: true

require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks in an array' do
      bookmark1 = Bookmark.create(url: 'http://makersacademy.com')
      bookmark2 = Bookmark.create(url: 'http://destroyallsoftware.com')

      expected_bookmarks = [
        bookmark1,
        bookmark2
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if the URL is not valid' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com')

      expect(Bookmark.all).to include bookmark
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark1 = Bookmark.new(1, url: 'http://testbookmark.com')
      bookmark2 = Bookmark.new(1, url: 'http://testbookmark.com')

      expect(bookmark1).to eq bookmark2
    end
  end
end
