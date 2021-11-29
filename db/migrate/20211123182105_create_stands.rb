class CreateStands < ActiveRecord::Migration[6.1]
  def change
    create_table :stands do |t|
      t.string :name, null: false
      t.string :icon
      t.references :operator, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
