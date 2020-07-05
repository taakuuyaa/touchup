class ChangeDataCapacityToVideo < ActiveRecord::Migration[5.2]
  def change
    change_column :videos, :capacity, :bigint
  end
end
