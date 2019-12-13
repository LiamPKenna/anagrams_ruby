class InputString
  attr_reader(:string, :clean, :non_word)
  def initialize(input_string)
    @text = input_string
    @clean = clean_and_sort()
    @non_word = contains_non_word()
  end

  def clean_and_sort
    @text.downcase.split('').keep_if{ |x| /[a-z]/.match?(x) }.sort.join('')
  end

  def contains_non_word
    word_array = @text.downcase.split(' ').map{ |s| s.gsub(/[^a-z]/, '') }
    no_vowels = word_array.any?{ |w| !/[aeiouy]+/.match(w) }
    trip_characters = word_array.any?{ |w| %r{(.)\1{2}}.match(w) }
    (no_vowels || trip_characters)
  end

end
