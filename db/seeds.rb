require('pry-byebug')
require_relative('../models/pal.rb')


pal1 = Pal.new({'name' => 'John Smith', 'type' => 'Basic'})
pal1.save

binding.pry
nil