require('rspec')
require('input_string')

describe('#InputString') do
  it('should remove all non-alpha characters and sort to alphabetical order') do
    string1 = InputString.new("Dcb a!@ e")
    expect(string1.clean_and_sort).to(eq('abcde'))
  end

  it('should test for the presence of non words') do
    string1 = InputString.new('this is a tst')
    expect(string1.contains_non_word).to(eq(true))
    string1 = InputString.new('ttthis is a test')
    expect(string1.contains_non_word).to(eq(true))
    string1 = InputString.new('this is a test')
    expect(string1.contains_non_word).to(eq(false))
  end

  it('should form an array of any input words that are palindromes') do
    string1 = InputString.new('bob is a toot')
    expect(string1.get_palindrome).to(eq(['bob','toot']))
  end
end
