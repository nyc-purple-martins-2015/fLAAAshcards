class Guess < ActiveRecord::Base
  belongs_to :round
  has_one :user, :through => :rounds


  validates :correct, presence: true
end
