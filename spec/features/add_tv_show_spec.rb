require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    visit('/')
    click_link('Add New Show')
    fill_in('Title:', with: 'Curb Your Enthusiasm')
    fill_in('Network:', with: 'HBO')
    fill_in('Starting Year:', with: '2002')
    fill_in('Ending Year:', with: '2010')
    select('Comedy', from: 'Genre:')
    fill_in('Synopsis:', with: "Larry David, 'nuff said.")
    click_button('Add TV Show')

    expect(page).to have_content('Curb Your Enthusiasm (HBO)')
  end

  scenario "fail to add a show with invalid information" do
    visit('/')
    click_link('Add New Show')
    fill_in('Title:', with: '')
    fill_in('Network:', with: '')
    fill_in('Starting Year:', with: '')
    fill_in('Ending Year:', with: '')
    select('Comedy', from: 'Genre:')
    fill_in('Synopsis:', with: "Larry David, 'nuff said.")
    click_button('Add TV Show')

    expect(current_path).to eq '/television_shows'
  end
end
