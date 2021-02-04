class CreateDayToShips < ActiveRecord::Migration[6.0]
  def change
    create_table :day_to_ships do |t|
      t.string  :title, null: false
      t.text    :text, null: false
      t.integer :day_to_ship_id, null: false
      t.timestamps
    end
  end
end
