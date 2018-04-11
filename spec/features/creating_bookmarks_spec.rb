require 'pg'

feature 'Adding a bookmark to the list' do
  scenario 'Inputting a new URL in the form adds the URL to the database list' do
    visit('/create')
    fill_in('url', with: 'http://justatest.com')
    click_button('Submit')

    expect(page).to have_content 'http://justatest.com'
  end
end
