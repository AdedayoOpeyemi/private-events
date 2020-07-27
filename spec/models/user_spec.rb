require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    it 'validates attributes - invalid' do
      user = User.new(name: '', username: '')
      expect(user.valid?).to be(false)
    end

    it 'validates attributes - valid' do
      user = User.new(name: 'somethign', username: 'something')
      expect(user.valid?).to be(true)
    end
  end

  context 'Association tests' do
    it 'has many events' do
      assc = User.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it 'has and belongs to many attended events' do
      assc = User.reflect_on_association(:attended_events)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
