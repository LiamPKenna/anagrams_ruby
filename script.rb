#!/usr/bin/env ruby

require('./lib/tester')
require('./lib/ui')

ui = UI.new()

ui.clear
ui.welcome
ui.clear
puts 'Please enter the first word or phrase to be checked:'
input_string1 = gets.chomp
ui.clear
puts 'Please enter the second word or phrase to be checked:'
input_string2 = gets.chomp

tester = Tester.new(input_string1, input_string2)
puts tester.anagram_test
