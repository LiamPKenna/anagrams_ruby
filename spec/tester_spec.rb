require('rspec')
require('tester')



describe('#Tester') do
  it('should return "These are anagrams" if two input strings are anagrams') do
    tester = Tester.new('eat', 'tea')
    expect(tester.anagram_test).to(eq("These are anagrams"))
  end

  it('should remove all non-alpha characters and sort to alphabetical order') do
    tester = Tester.new('eat', 'tea')
    expect(tester.clean_and_sort("Dcb a!@ e")).to(eq('abcde'))
  end

  it('should test for the presence of non words') do
    tester = Tester.new('eat', 'tea')
    expect(tester.contains_non_word('this is a tst')).to(eq(true))
    expect(tester.contains_non_word('ttthis is a test')).to(eq(true))
    expect(tester.contains_non_word('this is a test')).to(eq(false))
  end

  it('should test if strings are antigrams') do
    tester = Tester.new('word', 'pick')
    expect(tester.is_antigram).to(eq(true))
    tester = Tester.new('word', 'door')
    expect(tester.is_antigram).to(eq(false))
  end
end
