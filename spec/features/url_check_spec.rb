feature 'URL validity checking' do
  scenario 'Attempting to add an invalid URL returns an error page' do
    visit('/create')
    fill_in('url', with: 'this is not a url')
    click_button('Submit')

    expect(page).to have_content "this is not a url is not a valid URL. Please try again."
  end
end
