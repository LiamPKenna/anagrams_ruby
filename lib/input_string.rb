class InputString
  attr_reader(:text, :clean, :not_words, :palindromes)
  def initialize(input_string)
    @text = input_string
    @all_words = File.open('./dict.txt').read.chomp.split(' ')
    @word_array = @text.downcase.split(' ').map{ |s| s.gsub(/[^a-z]/, '') }
    @clean = clean_and_sort()
    @not_words = contains_non_word()
    @palindromes = get_palindrome()
  end

  def clean_and_sort
    @text.downcase.split('').keep_if{ |x| /[a-z]/.match?(x) }.sort.join('')
  end

  def contains_non_word
    no_vowels = @word_array.any?{ |w| !/[aeiouy]+/.match(w) }
    trip_characters = @word_array.any?{ |w| %r{(.)\1{2}}.match(w) }
    not_word = @word_array.any?{ |w| !(@all_words.include?(w)) }
    (not_word || no_vowels || trip_characters)
  end

  def get_palindrome
    @word_array.select{ |w| (w == w.reverse) && (w.length > 1) }
  end

end
