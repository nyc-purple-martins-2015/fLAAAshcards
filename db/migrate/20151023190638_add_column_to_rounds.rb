class AddColumnToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :correct_guesses, :string
  end
end
