class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  has_one :user, :through => :rounds
  has_one :deck, :through => :rounds #do we need this?

  validates :correct, presence: true
end
