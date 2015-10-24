class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :users, :through => :rounds


  validates :name, presence: true, uniqueness: true

  def next_card
    @temp_array.sample
  end

end





