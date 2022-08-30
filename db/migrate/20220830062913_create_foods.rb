class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name, null: false
      t.integer :quantity, null: false, default: 1
      t.date :expiry_at, null: false
      t.string :image
      t.boolean :checked, null: false, default: false
      t.text :memo

      t.timestamps
    end
  end
end
