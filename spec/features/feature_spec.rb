require 'pg'

feature 'Loading a page of bookmarks' do
  scenario 'Loading bookmarks page presents user with a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://destroyallsoftware.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end
