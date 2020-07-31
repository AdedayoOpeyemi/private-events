require_relative '../rails_helper'

RSpec.feature 'Attend Event', type: :feature do
  before :each do
    @user = User.new(name: 'User Name', username: 'username')
    @user.save

    @event = @user.events.create(title: 'something', description: 'something', date: '2020-12-12')

    visit login_path
    page.fill_in 'username', with: 'username'
    click_button 'Login'
  end

  scenario 'Event attendence', type: :feature do
    expect(page.current_path).to eq root_path
    click_link 'My Events', href: events_path
    expect(page).to have_text 'Upcoming Events'
    expect(page).to have_text @user.name
    expect(page).to have_text '0 Attendee/s'
    expect(page).to have_text 'Attend'
    click_link 'Attend', href: attend_path(@event)
    expect(page).to have_text 'Upcoming Events'
    expect(page).to have_text @user.name
    expect(page).to have_text '1 Attendee/s'
    expect(page).to have_text 'Unattend'
    click_link 'Unattend', href: unattend_path(@event)
    expect(page).to have_text 'Upcoming Events'
    expect(page).to have_text @user.name
    expect(page).to have_text '0 Attendee/s'
    expect(page).to have_text 'Attend'
  end
end
