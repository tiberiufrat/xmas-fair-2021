class CreateSpiridonPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :spiridon_purchases do |t|
      t.integer     :amount,   null: false, default: 0
      t.references  :operator, null: false, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
