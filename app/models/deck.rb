class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :users, :through => :rounds


  validates :name, presence: true, uniqueness: true

  def get_deck

  end

  def next_card
    @temp_array = self.cards.all
    @temp_array.sample
  end

end





