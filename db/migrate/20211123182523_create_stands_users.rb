class CreateStandsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :stands_users, id: false do |t|
      t.belongs_to :stand
      t.belongs_to :user
    end
  end
end
