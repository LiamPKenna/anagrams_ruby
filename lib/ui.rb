class UI
  def welcome
    puts 'Welcome to Anagram / Antigram!'
    puts '(press ENTER to begin)'
    gets
  end

  def clear
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end
