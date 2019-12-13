require('input_string')

class Tester
  def initialize(string1, string2)
    @string1 = InputString.new(string1)
    @string2 = InputString.new(string2)
  end

  def anagram_test
    if (@string1.non_word || @string2.non_word)
      return 'Please only enter real words'
    end
    is_anagram = @string1.clean == @string2.clean
    (is_anagram) ?
      'These are anagrams' :
      (is_antigram()) ?
        'These words have no letter matches and are antigrams' :
        "These are not anagrams but #{matching_letters()[0]} letters match: #{matching_letters()[1].join(', ')}"
  end

  def is_antigram
    @string1.clean.split('').all?{ |c| !@string2.clean.include?(c) }
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
    [matches.length, matches]
  end
end
