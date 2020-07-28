require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Validation tests' do
    it 'validates attributes - invalid' do
      event = Event.new(title: '', description: '', date: '')
      expect(event.valid?).to be(false)
    end

    it 'validates attributes - valid' do
      event = Event.new(title: 'something', description: 'something', date: '2019-12-12')
      event.creator = User.create(name: 'somethign', username: 'something')
      expect(event.valid?).to be(true)
    end
  end

  context 'Association tests' do
    it { should belong_to(:creator).class_name('User') }

    it { should have_and_belong_to_many(:attendees).class_name('User') }
  end
end
