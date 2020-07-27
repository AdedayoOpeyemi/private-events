require_relative '../rails_helper'

RSpec.feature 'Create Event', type: :feature do
  before :each do
    @user = User.new(name: 'User Name', username: 'username')
    @user.save

    visit login_path
    page.fill_in 'username', with: 'username'
    click_button 'Login'
  end

  scenario 'Event creation', type: :feature do
    expect(page.current_path).to eq root_path
    click_link 'My Events', href: events_path
    click_link 'New Event', href: new_event_path
    page.fill_in 'event[title]', with: 'Test event'
    page.fill_in 'event[description]', with: 'Test Description'
    page.fill_in 'event[date]', with: '2020-12-12'
    click_button 'Create Event'
    expect(page.current_path).to eq events_path
    expect(page).to have_text 'Upcoming Events'
    expect(page).to have_text @user.name
  end
end
