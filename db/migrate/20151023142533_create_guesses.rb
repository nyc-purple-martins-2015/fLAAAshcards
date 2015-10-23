class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :round_id, null: false
      t.integer :correct, default: 0
      t.integer :card_id

      t.timestamps
    end
  end
end
