require('pry-byebug')
require_relative('../models/pal.rb')
require_relative('../models/event.rb')
require_relative('../models/client.rb')
require_relative('../models/palship.rb')
require_relative('../models/paldate.rb')



client1 = Client.new({'name' => 'Mia'})
client2 = Client.new({'name' => 'Claudia'})
client3 = Client.new({'name' => 'Joe'})

client1.save
client2.save
client3.save

pal1 = Pal.new({'name' => 'Brian', 'type' => 'Budget'})
pal2 = Pal.new({'name' => 'John Smith', 'type' => 'Classic'})
pal3 = Pal.new({'name' => 'Donny King', 'type' => 'Deluxe'})

pal1.save
pal2.save
pal3.save

event1 = Event.new({'type' => 'Cinema'})
event2 = Event.new({'type' => 'Dinner'})
event3 = Event.new({'type' => 'Stroll'})

event1.save
event2.save
event3.save

palship1 = Palship.new({'pal_id' => pal1.id, 'client_id' => client1.id})
palship2 = Palship.new({'pal_id' => pal2.id, 'client_id' => client2.id})
palship3 = Palship.new({'pal_id' => pal3.id, 'client_id' => client3.id})

palship1.save
palship2.save
palship3.save

paldate1 = PalDate.new({'palship_id' => palship1.id, 'event_id' => event1.id})
paldate1.save

binding.pry
nil