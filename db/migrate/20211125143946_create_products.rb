class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :icon
      t.integer :price
      t.references :stand, null: false, foreign_key: { to_table: :stands }

      t.timestamps
    end
  end
end
