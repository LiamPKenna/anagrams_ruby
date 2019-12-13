require('rspec')
require('tester')

tester = Tester.new()

describe('#Tester') do
  # it('should return "These are anagrams" if two input strings are anagrams') do
  #   expect(tester.test('eat', 'tea')).to(eq("These are anagrams"))
  # end

  it('') do
    expect(tester.clean_and_sort("Dcb a!@ e")).to(eq('abcde'))
  end
end
