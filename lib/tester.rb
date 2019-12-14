require('./lib/input_string')

class Tester
  attr_reader(:matched_letters, :match_count)
  def initialize(string1, string2)
    @string1 = InputString.new(string1)
    @string2 = InputString.new(string2)
    @matched_letters = matching_letters()
    @match_count = @matched_letters.length
  end

  def all_real_words
    @string1.all_words_real && @string2.all_words_real
  end

  def anagram_test
    @string1.clean == @string2.clean
  end

  def identical
    @string1.text == @string2.text
  end

  def is_antigram
    @string1.clean.split('').none?{ |c| @string2.clean.include?(c) }
  end

  def found_palindromes
    @string1.palindromes + @string2.palindromes
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
