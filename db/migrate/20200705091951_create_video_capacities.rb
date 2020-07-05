class CreateVideoCapacities < ActiveRecord::Migration[5.2]
  def change
    create_table :video_capacities do |t|
      t.references :video
      t.bigint :capacity, default: 0

      t.timestamps
    end
  end
end
