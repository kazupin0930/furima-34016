class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :nickname, null: false
      t.string   :email, null: false, unique: true
      t.string   :encrypted_password, null: false
      t.string   :last_name, null: false
      t.string   :first_name, null: false
      t.string   :last_name_frigana, null: false
      t.string   :first_name_frigana, null: false
      t.date     :date_of_birth, null: false
      t.timestamps
    end
  end
end
