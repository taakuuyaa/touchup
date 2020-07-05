class CreateVideoItemLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :video_item_links do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
