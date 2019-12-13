require('./lib/input_string')

class Tester
  def initialize(string1, string2)
    @string1 = InputString.new(string1)
    @string2 = InputString.new(string2)
    @matched_letters = matching_letters()
    @match_count = @matched_letters.length
  end

  def anagram_test
    if (@string1.not_words || @string2.not_words)
      return 'Please only enter real words'
    end
    if (@string1.text == @string2.text)
      return 'These are exactly the same'
    end
    (@string1.clean == @string2.clean) ?
      'These are anagrams' :
      (is_antigram()) ?
        'These words have no letter matches and are antigrams' :
        "These are not anagrams but #{@match_count} letter#{(@match_count > 1)? 's' : ''} match:
  #{@matched_letters.join(', ')}"
  end

  def is_antigram
    @string1.clean.split('').none?{ |c| @string2.clean.include?(c) }
  end

  def matching_letters
    arr2 = @string2.clean.split('')
    matches = []
    @string1.clean.split('').each do |chr|
      if arr2.include?(chr)
        matches.push(chr)
        arr2.slice!(arr2.index(chr))
      end
    end
    matches
  end
end
