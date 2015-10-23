class AddColumnToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :first_time, :integer, default: 0
  end
end
