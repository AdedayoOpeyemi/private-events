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
    it 'belongs to creator' do
      assc = Event.reflect_on_association(:creator)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has and belongs to many attendees' do
      assc = Event.reflect_on_association(:attendees)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
