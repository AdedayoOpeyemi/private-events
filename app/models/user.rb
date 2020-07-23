class User < ApplicationRecord
  has_many :events
  has_and_belongs_to_many :attended_events, class_name: 'Event', join_table: 'event_user'

  def upcoming_events
    attended_events.where('date > ?', Date.today)
  end

  def past_events
    attended_events.where('date < ?', Date.today)
  end

  def attending?(event)
    event.attendees.exists?(id)
  end
end
