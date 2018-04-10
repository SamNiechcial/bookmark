require 'app'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.facebook.com"
    expect(page).to have_content "http://www.yahoo.com"
  end
end
