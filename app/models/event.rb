class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: 'User', join_table: 'event_user'

  scope :upcoming, -> { where('date > ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :user_id, presence: true

  def upcoming?
    date > Date.today
  end

  def past?
    !upcoming?
  end
end
