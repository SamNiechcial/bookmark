require 'pg'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end
