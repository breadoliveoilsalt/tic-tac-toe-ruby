#!/usr/local/bin/ruby

require 'require_all'
require_all 'lib'

puts "Please enter your name: "
h = HumanPlayer.new
h.select_marker
puts "Thanks!"
