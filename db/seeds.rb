#Events
Event.create(title: 'Go to bed', descript: "I'm sleepy", date: '19900530', creator_id: 1, location: "Bathroom")
Event.create(title: 'Go to work', descript: "I'm ready", date: '20200416', creator_id: 2, location: "Bedroom")

#Users
User.create(user: 'TheStig', name:'Stig McMan', email: 'stig@yahoo.com')
User.create(user: 'StigJr', name:'Stig McMan Jr.', email: 'stigjr@yahoo.com')
User.create(user: 'StigSr', name:'Stig McMan Sr.', email: 'stigsr@yahoo.com')
User.create(user: 'loner', name:'The Loner', email: 'loner@yahoo.com')

#Invites
Invite.create(attended_event_id: 1, attendee_id: 2)
Invite.create(attended_event_id: 2, attendee_id: 1)
Invite.create(attended_event_id: 2, attendee_id: 3)
Invite.create(attended_event_id: 1, attendee_id: 3)
