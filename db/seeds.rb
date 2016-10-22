require('pry-byebug')
require_relative('../models/pal.rb')
require_relative('../models/event.rb')


pal1 = Pal.new({'name' => 'John Smith', 'type' => 'Basic'})
pal1.save

event1 = Event.new({'type' => 'Cinema'})
event2 = Event.new({'type' => 'Dinner'})
event3 = Event.new({'type' => 'Stroll'})
event4 = Event.new({'type' => 'Drinks'})

event1.save
event2.save
event3.save
event4.save

binding.pry
nil