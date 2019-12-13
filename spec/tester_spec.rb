require('rspec')
require('tester')

tester = Tester.new()

describe('#Tester') do
  it('should return "These are anagrams" if two input strings are anagrams') do
    expect(tester.anagram_test('eat', 'tea')).to(eq("These are anagrams"))
  end

  it('should remove all non-alpha characters and sort to alphabetical order') do
    expect(tester.clean_and_sort("Dcb a!@ e")).to(eq('abcde'))
  end

  it('should test for the presence of non words') do
    expect(tester.contains_non_word('this is a tst')).to(eq(true))
    expect(tester.contains_non_word('ttthis is a test')).to(eq(true))
    expect(tester.contains_non_word('this is a test')).to(eq(false))
  end
end
