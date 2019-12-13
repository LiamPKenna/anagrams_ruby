require('rspec')
require('input_string')

describe('#InputString') do
  it('should remove all non-alpha characters and sort to alphabetical order') do
    tester = InputString.new("Dcb a!@ e")
    expect(tester.clean_and_sort).to(eq('abcde'))
  end

  it('should test for the presence of non words') do
    tester = InputString.new('this is a tst')
    expect(tester.contains_non_word).to(eq(true))
    tester = InputString.new('ttthis is a test')
    expect(tester.contains_non_word).to(eq(true))
    tester = InputString.new('this is a test')
    expect(tester.contains_non_word).to(eq(false))
  end
end
