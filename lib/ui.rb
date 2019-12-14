require('colorize')
require('./lib/tester')

class UI
  def initialize
    @break = make_break()
    @title = make_title()
    @pause = make_pause()
  end

  def welcome
    puts @break
    puts @title
    puts @break
    puts "               Welcome to Anagram / Antigram!".colorize(:magenta)
    puts "                  (press ENTER to begin)".colorize(:magenta)
    puts @break
    gets
  end

  def clear
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def prompt(first_or_second)
    puts @break
    print("Please enter the #{first_or_second} word or phrase to be checked:")
    puts @break
    gets.chomp
  end

  def test_strings(string1, string2)
    tester = Tester.new(string1, string2)
    puts @break
    if tester.all_real_words
      if tester.found_palindromes.length > 0
        print('You entered the following palindromes:')
        print("#{tester.found_palindromes.join(', ')}")
        puts @break
      end
      print("Comparing '#{string1}' & '#{string2}':")
      puts @pause
      if tester.identical
        print('These are exactly the same')
      elsif tester.anagram_test
        print('THESE ARE ANAGRAMS')
      elsif tester.is_antigram
        print('These have no letter matches')
        puts @pause
        print('THESE ARE ANTIGRAMS')
      else
        print('THESE ARE NOT ANAGRAMS')
        puts @pause
        print("However #{tester.match_count} of their letters matched:")
        print("#{tester.matched_letters.join(', ')}")
      end
    else
      print('Please only enter real words')
    end
    puts @break
  end

  def print(text)
    puts "  #{text}".colorize(:red)
  end

  def go_again
    print('Go again? (y/n)')
    puts @break
    (gets.chomp.downcase == 'y')
  end

  def make_pause
    "
  #{'-  ' * 19}

".colorize(:light_blue)
  end

  def make_break
    "

#{'#' * 60}
#{'-' * 60}

".colorize(:cyan)
  end

  def make_title
    "
         /\\
        /  \\  ____   ____  ____  ____ ____ ____
       / /\\ \\|  _ \\ / _  |/ _  |/ ___) _  |    \\
      | |__| | | | ( ( | ( ( | | |  ( ( | | | | |
      |______|_| |_|\\_||_|\\_|| |_|   \\_||_|_|_|_|
                         (_____|

                         _
         /\\         _   (_)
        /  \\  ____ | |_  _  ____  ____ ____ ____
       / /\\ \\|  _ \\|  _)| |/ _  |/ ___) _  |    \\
      | |__| | | | | |__| ( ( | | |  ( ( | | | | |
      |______|_| |_|\\___)_|\\_|| |_|   \\_||_|_|_|_|
                          (_____|
  ".colorize(:magenta)
  end
end
