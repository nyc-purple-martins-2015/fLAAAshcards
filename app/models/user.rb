class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, :through => :rounds
  has_many :played_decks, :through => :rounds, :source => :deck
  has_many :cards, :through => :decks
  has_many :decks, :foreign_key => :author_id


  validates :username, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end


