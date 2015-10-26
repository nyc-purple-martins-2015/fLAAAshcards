class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.string :description
      t.integer :author_id
      t.integer :private, :default => 0

      t.timestamps
    end
  end
end
