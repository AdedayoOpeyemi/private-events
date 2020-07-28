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
    it { should have_many(:events).class_name('Event') }

    it { should have_and_belong_to_many(:attended_events).class_name('Event') }
  end
end
