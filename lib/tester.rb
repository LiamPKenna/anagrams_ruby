class Tester
  def initialize(string1, string2)
    @string1 = string1
    @string2 = string2
  end

  def anagram_test
    if (contains_non_word(@string1) || contains_non_word(@string2))
      return 'Please only enter real words'
    end
    is_anagram = clean_and_sort(@string1) == clean_and_sort(@string2)
    (is_anagram) ? 'These are anagrams' : 'These are not anagrams'
  end

  def clean_and_sort(string)
    string.downcase.split('').keep_if{ |x| /[a-z]/.match?(x)}.sort.join('')
  end

  def contains_non_word(string)
    word_array = string.downcase.split(' ').map{ |s| s.gsub(/[^a-z]/, '')}
    no_vowels = word_array.any?{ |w| !/[aeiouy]+/.match(w) }
    trip_characters = word_array.any?{ |w| %r{(.)\1{2}}.match(w) }
    (no_vowels || trip_characters)
  end

end
