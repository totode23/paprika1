class CreateInforms < ActiveRecord::Migration[7.0]
  def change
    create_table :informs do |t|
      t.integer :group_id,null: false, default: ""
      t.text :news_title
      t.text :news_message
      
      t.timestamps
    end
  end
end
