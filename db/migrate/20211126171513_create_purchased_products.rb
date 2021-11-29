class CreatePurchasedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :purchased_products do |t|
      t.belongs_to :purchase
      t.belongs_to :product
      t.integer :amount,      default: 1
      t.timestamps
    end
  end
end
