class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: 'User', join_table: 'event_user'
end
