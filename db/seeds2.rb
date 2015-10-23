

anders = User.create!(username: "anders", password: "password")

deck = Deck.create!(name: "Books")

5.times do
  deck.cards.create!(question: Faker::Book.title, answer: Faker::Book.author)
end

anders.rounds.create!(deck_id: 1)



