require_relative '../rails_helper'

RSpec.feature 'Authentication', type: :feature do
  scenario 'Log in and log out' do
    User.create(name: 'User Example', username: 'userexample')

    visit login_path
    page.fill_in 'username', with: 'userexample'
    click_button 'Login'
    expect(page.current_path).to eq root_path
    have_link 'Home', href: root_path
    have_link 'My Events', href: events_path
    have_link 'Logout', href: logout_path
    click_on 'Logout'
    expect(page.current_path).to eq login_path
  end
end
