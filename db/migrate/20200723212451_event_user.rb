class EventUser < ActiveRecord::Migration[6.0]
  def change
    create_table :event_user do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
