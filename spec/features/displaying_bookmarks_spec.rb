# frozen_string_literal: true

require 'bookmark'
require 'pg'

feature 'Loading a page of bookmarks' do
  scenario 'Loading bookmarks page presents user with a list of bookmarks' do
    Bookmark.create(url: 'http://makersacademy.com')
    Bookmark.create(url: 'http://www.google.com')
    Bookmark.create(url: 'http://destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
  end
end
