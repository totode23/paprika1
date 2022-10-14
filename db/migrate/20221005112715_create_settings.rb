class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.boolean :inform, null: false, default: true
      t.integer :inform_date, null: false, default: 3
      t.time :inform_time
      t.integer :green_date, null: false, default: 3
      t.integer :red_date, null: false, default: 1

      t.timestamps
    end
  end
end
