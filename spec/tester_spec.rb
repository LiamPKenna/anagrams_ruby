require('rspec')
require('tester')



describe('#Tester') do
  it('should return "These are anagrams" if two input strings are anagrams') do
    tester = Tester.new('eat', 'tea')
    expect(tester.anagram_test).to(eq("These are anagrams"))
  end

  it('should test if strings are antigrams') do
    tester = Tester.new('word', 'pick')
    expect(tester.is_antigram).to(eq(true))
    tester = Tester.new('word', 'door')
    expect(tester.is_antigram).to(eq(false))
  end

  it('should test for the number of matching characters in the two strings') do
    tester = Tester.new('word', 'door')
    expect(tester.matching_letters).to(eq([3,['d','o','r']]))
    tester = Tester.new('door', 'word')
    expect(tester.matching_letters).to(eq([3,['d','o','r']]))
  end

end
