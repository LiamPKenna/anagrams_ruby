class Tester
  def initialize
  end

  # def test(string1, string2)
  #   is_anagram =
  # end

  def clean_and_sort(string)
    string.downcase.split('').keep_if{ |x| /[a-z]/.match?(x)}.sort.join('')
  end
end
