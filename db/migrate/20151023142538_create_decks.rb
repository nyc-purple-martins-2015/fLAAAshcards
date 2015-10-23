class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
