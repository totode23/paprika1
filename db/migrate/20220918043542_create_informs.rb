class CreateInforms < ActiveRecord::Migration[7.0]
  def change
    create_table :informs do |t|
      t.integer :user_id,null: false
      t.text :news_title
      t.text :news_message
      t.boolean :checked,default: false
      
      t.timestamps
    end
  end
end
