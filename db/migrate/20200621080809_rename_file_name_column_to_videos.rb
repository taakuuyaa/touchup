class RenameFileNameColumnToVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :file_name, :file
  end
end
