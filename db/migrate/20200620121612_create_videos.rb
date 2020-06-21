class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :item_url, null: false, index: true
      t.string :file_name, null: false
      t.integer :capacity
      t.text :text
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
