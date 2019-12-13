require('rspec')
require('tester')

describe('#Tester') do

  it('should return true if the user inputs identical words') do
    tester = Tester.new('tea', 'tea')
    expect(tester.identical).to(eq(true))
  end

  it('should return true if two input strings are anagrams') do
    tester = Tester.new('eat', 'tea')
    expect(tester.anagram_test).to(eq(true))
  end

  it('should return false when given non words') do
    tester = Tester.new('Welcome to the jungle', 'Pleoase come over for tea')
    expect(tester.all_real_words).to(eq(false))
  end

  it('should ignore case') do
    tester = Tester.new('Eat', 'Tea')
    expect(tester.anagram_test).to(eq(true))
  end

  it('should test if strings are antigrams') do
    tester = Tester.new('word', 'pick')
    expect(tester.is_antigram).to(eq(true))
    tester = Tester.new('word', 'door')
    expect(tester.is_antigram).to(eq(false))
  end

  it('should test for matching characters in the two strings') do
    tester = Tester.new('word', 'door')
    expect(tester.matched_letters).to(eq(['d','o','r']))
    tester = Tester.new('door', 'word')
    expect(tester.matched_letters).to(eq(['d','o','r']))
  end

end
