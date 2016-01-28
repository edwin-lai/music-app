class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :regular_or_bonus
      t.text :lyrics
      t.integer :album_id

      t.timestamps null: false
    end

    add_index :tracks, :name
    add_index :tracks, :album_id
  end
end
