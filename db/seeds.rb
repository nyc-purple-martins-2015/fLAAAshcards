  def load_cards(filename)
    @load_array= []
    File.open(filename).each do |line|
      @load_array << line.chomp
    end
  end

  def create_cards
    load_cards("db/seed.txt")
    @load_array.each_with_index do |line, index|
      if index%2 == 0
        Card.create(question: line, answer: @load_array[index+1])
      end
    end
  end

create_cards


sample = Deck.create!(name: "sample", description: "test deck")

Card.all.each do |card|
  sample.cards << card
end


anders = User.create!(username: "anders", password: "password")

deck = Deck.create!(name: "Books")

5.times do
  deck.cards.create!(question: Faker::Book.title, answer: Faker::Name.name)
end

anders.rounds.create!(deck_id: 1)
