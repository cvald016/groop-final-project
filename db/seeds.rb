# Seed file creates events in the past, friends events, and your events

expiration_date = Time.now.utc + 20.days

u1 = User.create(full_name: "Artie Polanco", picture_url: "kevin.jpg", phone_number: "3058785704" ,email: "artie@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u2 = User.create(full_name: "Christopher Valdemoro", picture_url: "chris.jpg", phone_number: "3058785704" ,email: "chrisv@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u3 = User.create(full_name: "Enrique Gollas", picture_url: "enrique.jpg", phone_number: "3058785704" ,email: "egollas@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u4 = User.create(full_name: "Annette Medina", picture_url: "annette.jpg", phone_number: "3058785704" ,email: "annette@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u5 = User.create(full_name: "Jonas Erthal", picture_url: "jonas.jpg", phone_number: "3058785704" ,email: "jerthal@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u6 = User.create(full_name: "Christina Medeiros", picture_url: "christina.jpg", phone_number: "3058785704" ,email: "christina@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u7 = User.create(full_name: "Alfonso Estremadoyro", picture_url: "alfonso.jpg", phone_number: "3058785704" ,email: "alfonsoe@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u8 = User.create(full_name: "Elsie Giraudy", picture_url: "elsie.jpg", phone_number: "3058785704" ,email: "egiraudy@gmail.com", uid: "id123", oauth_token:"faketoken1", oauth_expires_at: expiration_date, provider: "facebook")
u9 = User.create(full_name: "Steph Ricardo", picture_url: "steph.jpg", phone_number: "3058785704" ,created_at: "2017-06-19 20:11:50", updated_at: "2017-06-19 20:11:50", uid: "10158821515595627", oauth_token: "EAAOW30xR3YcBALxdsokUVQaq3pmZALdpWjefksX4PXRUlZBCOhF2ysm4fKxdLyzfKOuJ5FDz1tAe7VYZCA14CZB1TsroGrfcSjrTbPEusu0Rn2cxGmZAwMybNW9uhUBsgXsNGMYrkZCZBUcJrgEKL5ZBvSijkj1v16ZBuLCfzUwv4TwZDZD", oauth_expires_at: "2017-08-18 20:11:49", provider: "facebook", email: "s.ricardo1@umiami.edu" )
u10 = User.create(full_name: "Kevin Wong", picture_url: "http://graph.facebook.com/10109918612188513/picture?width=500", phone_number: "3058785704" ,created_at: "2017-06-26 21:58:58", updated_at: "2017-06-26 21:58:58", uid: "10109918612188513", oauth_token: "EAAOW30xR3YcBAM4LVS8pU5tOkKUUfB3uPv4TZCYEOJ1ij0R0GfSckJaIW3c3oGW4eYPB4ZAohQp4PNsFFqai5AGuwUeG01MnF6crZBul0T5Q8yow2iKJQ8U3z6a56gqVtLL4aoE5nlFQOLui0gSVYUbgKS6XMUYhfMbPAwF5gZDZD", oauth_expires_at: "2017-08-25 21:58:58", provider: "facebook", email: "kwong@gmail.com" )

e1 = Event.create(title: "Burgers" , creator_id: 1, date: Time.now + 1.weeks, location: "Wynwood" , description: "Grab some burgers after class.")
e2 = Event.create(title: "BBQ at Chris'" , creator_id: 2, date: Time.now + 1.weeks, location: "Chris' House" , description: "Lets grill and chill.")
e3 = Event.create(title: "Beach Picnic" , creator_id: 3, date: Time.now - 3.weeks, location: "South Beach" , description: "Party and hangout on the beach.")
e4 = Event.create(title: "Dog Park" , creator_id: 7, date: Time.now - (1.weeks + 5.days), location: "Broward Doggy Park" , description: "Bring your dogs over to play with Neo and Nala!")
e5 = Event.create(title: "Coffee and Donuts" , creator_id: 6, date: Time.now + 1.weeks + 2.days, location: "Wynwood" , description: "We can grab some yummy snacks at the Salty Donut!")
e6 = Event.create(title: "Wynloop Run" , creator_id: 5, date: Time.now + 2.weeks, location: "Wynbase" , description: "Run the Wynloop with me.")
e7 = Event.create(title: "Pool Day" , creator_id: 9, date: Time.now + 1.weeks + 5.days, location: "Steph's House" , description: "Enjoy the sun and the pool.")
e8 = Event.create(title: "Study Session" , creator_id: 9, date: Time.now - 4.weeks, location: "Wynbase" , description: "Review Rails at Wynbase.")
e9 = Event.create(title: "Barhopping" , creator_id: 2, date: Time.now + 1.weeks + 3.days, location: "Wynwood" , description: "Checkout the walls and have some beers.")
e10 = Event.create(title: "Shopping" , creator_id: 8, date: Time.now + 5.days, location: "Sawgrass Mall" , description: "Have some coffee and walk around the mall.")
e11 = Event.create(title: "Pitch Day Project Meeting" , creator_id: 9, date: Time.now - 5.days, location: "Wynbase" , description: "Review our project for Pitch day.")

UserEvent.create(event_id: 1, user_id: 2)
UserEvent.create(event_id: 1, user_id: 5)
UserEvent.create(event_id: 1, user_id: 7)
UserEvent.create(event_id: 1, user_id: 10)
UserEvent.create(event_id: 2, user_id: 3)
UserEvent.create(event_id: 2, user_id: 4)
UserEvent.create(event_id: 2, user_id: 5)
UserEvent.create(event_id: 2, user_id: 6)
UserEvent.create(event_id: 2, user_id: 9)
UserEvent.create(event_id: 3, user_id: 1)
UserEvent.create(event_id: 3, user_id: 2)
UserEvent.create(event_id: 3, user_id: 4)
UserEvent.create(event_id: 3, user_id: 5)
UserEvent.create(event_id: 3, user_id: 6)
UserEvent.create(event_id: 3, user_id: 7)
UserEvent.create(event_id: 3, user_id: 9)
UserEvent.create(event_id: 3, user_id: 10)
UserEvent.create(event_id: 4, user_id: 1)
UserEvent.create(event_id: 4, user_id: 4)
UserEvent.create(event_id: 4, user_id: 5)
UserEvent.create(event_id: 4, user_id: 9)
UserEvent.create(event_id: 5, user_id: 4)
UserEvent.create(event_id: 5, user_id: 9)
UserEvent.create(event_id: 7, user_id: 1)
UserEvent.create(event_id: 7, user_id: 2)
UserEvent.create(event_id: 7, user_id: 3)
UserEvent.create(event_id: 7, user_id: 4)
UserEvent.create(event_id: 7, user_id: 5)
UserEvent.create(event_id: 7, user_id: 6)
UserEvent.create(event_id: 7, user_id: 7)
UserEvent.create(event_id: 7, user_id: 8)
UserEvent.create(event_id: 7, user_id: 10)
UserEvent.create(event_id: 8, user_id: 1)
UserEvent.create(event_id: 8, user_id: 4)
UserEvent.create(event_id: 8, user_id: 6)
UserEvent.create(event_id: 9, user_id: 1)
UserEvent.create(event_id: 9, user_id: 5)
UserEvent.create(event_id: 9, user_id: 7)
UserEvent.create(event_id: 9, user_id: 10)
UserEvent.create(event_id: 10, user_id: 9)
UserEvent.create(event_id: 11, user_id: 2)
UserEvent.create(event_id: 11, user_id: 3)
