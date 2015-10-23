class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, :through => :rounds
  has_many :decks, :through => :rounds

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end


