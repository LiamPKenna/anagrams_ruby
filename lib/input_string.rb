class InputString
  attr_reader(:string, :clean, :not_words)
  def initialize(input_string)
    @text = input_string
    @all_words = File.open('./dict.txt').read.chomp.split(' ')
    @clean = clean_and_sort()
    @not_words = contains_non_word()
  end

  def clean_and_sort
    @text.downcase.split('').keep_if{ |x| /[a-z]/.match?(x) }.sort.join('')
  end

  def contains_non_word
    word_array = @text.downcase.split(' ').map{ |s| s.gsub(/[^a-z]/, '') }
    no_vowels = word_array.any?{ |w| !/[aeiouy]+/.match(w) }
    trip_characters = word_array.any?{ |w| %r{(.)\1{2}}.match(w) }
    not_word = word_array.any?{ |w| !(@all_words.include?(w)) }
    (not_word || no_vowels || trip_characters)
  end

end
