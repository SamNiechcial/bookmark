# frozen_string_literal: true

feature 'URL validity checking' do
  scenario 'Attempting to add an invalid URL returns an error page' do
    visit('/create')
    fill_in('url', with: 'ding')
    click_button('Submit')

    expect(page).to have_content 'ding is not a valid URL. Please try again.'
  end
end
