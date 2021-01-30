class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.text       :record, null: false
      t.string     :buyer, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
