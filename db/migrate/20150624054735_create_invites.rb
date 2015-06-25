class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :attended_event
      t.references :attendee

      t.timestamps null: false
    end
  end
end
