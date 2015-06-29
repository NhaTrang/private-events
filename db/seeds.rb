# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "descript"
    t.datetime "date"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "attended_event_id"
    t.integer  "attendee_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user"
    t.string   "name"
    t.string   "email"
    t.string   "remember_token"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  Event.create(title: 'Go to bed', descript: "I'm sleepy", date: 19900530, creator_id: 1)
  Event.create(title: 'Go to work', descript: "I'm ready", date: 20200416, creator_id: 2)
  User.create(user: 'TheStig', name:'Stig McMan', email: 'stig@yahoo.com')
  User.create(user: 'StigJr', name:'Stig McMan Jr.', email: 'stigjr@yahoo.com')
  Invite.create(attended_event_id: 1, attendee_id: 2)
  Invite.create(attended_event_id: 2, attendee_id: 1)
