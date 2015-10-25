  def load_cards(filename)
    @load_array= []
    File.open(filename).each do |line|
      @load_array << line.chomp
    end
  end

  def create_cards(file, deck)
    load_cards(file)
    @load_array.each_with_index do |line, index|
      if index%2 == 0
        deck.cards.create(question: line, answer: @load_array[index+1])
      end
    end
  end



sample = Deck.create!(name: "Test", description: "Test Deck", image: "https://lh4.ggpht.com/wKrDLLmmxjfRG2-E-k5L5BUuHWpCOe4lWRF7oVs1Gzdn5e5yvr8fj-ORTlBF43U47yI=w300")

trivia = Deck.create!(name: "Trivia", description: "Random Trivia", image: "http://www.betweenthebuns.com/images/trivia.gif")

sample_cards = create_cards("db/seed.txt", sample)

trivia_cards = create_cards("db/seeds2.txt", trivia)



# sample_cards.each do |card|
#   sample.cards << card
# end

# trivia_cards.each do |card|
#   trivia.cards << card
# end


