#!/usr/bin/env ruby


require('./lib/ui')

ui = UI.new()
keep_going = true

ui.clear
ui.welcome
while keep_going == true
  ui.clear
  input_string1 = ui.prompt('first')
  ui.clear
  input_string2 = ui.prompt('second')
  ui.clear
  ui.test_strings(input_string1, input_string2)
  keep_going = ui.go_again
end
ui.clear
