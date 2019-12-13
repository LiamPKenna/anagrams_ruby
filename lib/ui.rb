require('./lib/tester')

class UI
  def initialize
    @break = make_break()
  end

  def welcome
    puts @break
    puts 'Welcome to Anagram / Antigram!'
    puts '(press ENTER to begin)'
    puts @break
    gets
  end

  def clear
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def prompt(first_or_second)
    puts @break
    puts "Please enter the #{first_or_second} word or phrase to be checked:"
    puts @break
    gets.chomp
  end

  def test_strings(string1, string2)
    puts @break
    puts "Comparing #{string1} and #{string2}:"
    puts Tester.new(string1, string2).anagram_test
    puts @break
  end

  def go_again
    puts 'Go again? (y/n)'
    puts @break
    (gets.chomp.downcase == 'y')
  end

  def make_break
    "

#{'#' * 60}
#{'-' * 60}

"
  end
end
