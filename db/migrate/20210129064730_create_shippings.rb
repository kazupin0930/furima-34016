class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.text :address, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
