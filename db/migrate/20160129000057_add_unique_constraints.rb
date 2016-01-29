class AddUniqueConstraints < ActiveRecord::Migration
  change_column :albums, :name, :string, null: false
  change_column :albums, :live_or_studio, :string, null: false
  change_column :albums, :band_id, :integer, null: false
  change_column :bands, :name, :string, null: false
  change_column :tracks, :name, :string, null: false
  change_column :tracks, :regular_or_bonus, :string, null: false
  change_column :tracks, :album_id, :integer, null: false
end
