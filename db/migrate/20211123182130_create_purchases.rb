class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :operator, null: false, references: :users, foreign_key: { to_table: :users }
      t.references :stand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
