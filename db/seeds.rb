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



sample = Deck.create!(name: "Sample", description: "test deck")

trivia = Deck.create!(name: "Trivia", description: "Random Trivia")

sample_cards = create_cards("db/seed.txt", sample)

trivia_cards = create_cards("db/seeds2.txt", trivia)



# sample_cards.each do |card|
#   sample.cards << card
# end

# trivia_cards.each do |card|
#   trivia.cards << card
# end


