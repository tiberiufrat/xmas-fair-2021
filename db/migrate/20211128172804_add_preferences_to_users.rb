class AddPreferencesToUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension "hstore"
    add_column :users, :preferences, :hstore, default: {}
    add_index :users, :preferences, using: :gist
  end
end
