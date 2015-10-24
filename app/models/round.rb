class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, :through => :deck
  has_many :guesses

  def correct_guesses
    self.guesses.where(correct: 1)
  end

  def correct_cards
    self.correct_guesses.map { |guess| guess.card }
  end

  def yet_to_guess_correctly
    self.cards - self.correct_cards
  end

  def next_card
    self.yet_to_guess_correctly.sample
  end

  def guess_card_count
    Hash[self.guesses.group_by { |guess| guess.card_id }.map {|id, occurence| [id, occurence.count]}]
  end

  def guessed_correct_on_first_try
    guess_card_count.select {|card_id, occurences| card_id if occurences == 1 }.keys.length
  end
end
