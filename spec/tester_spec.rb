require('rspec')
require('tester')

describe('#Tester') do
  it('should return "These are anagrams" if two input strings are anagrams') do
    tester = Tester.new('eat', 'tea')
    expect(tester.anagram_test).to(eq("These are anagrams"))
  end

  it('should return "Please only enter real words" when given non words') do
    tester = Tester.new('Welcome to the jungle', 'Pleoase come over for tea')
    expect(tester.anagram_test).to(eq("Please only enter real words"))
  end

  it('should ignore case') do
    tester = Tester.new('Eat', 'Tea')
    expect(tester.anagram_test).to(eq("These are anagrams"))
  end

  it('should test if strings are antigrams') do
    tester = Tester.new('word', 'pick')
    expect(tester.is_antigram).to(eq(true))
    tester = Tester.new('word', 'door')
    expect(tester.is_antigram).to(eq(false))
  end

  it('should test for matching characters in the two strings') do
    tester = Tester.new('word', 'door')
    expect(tester.matching_letters).to(eq(['d','o','r']))
    tester = Tester.new('door', 'word')
    expect(tester.matching_letters).to(eq(['d','o','r']))
  end

end
