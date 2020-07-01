class CreateVideoItemLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :video_item_links do |t|
      t.string :name
      t.string :url
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
